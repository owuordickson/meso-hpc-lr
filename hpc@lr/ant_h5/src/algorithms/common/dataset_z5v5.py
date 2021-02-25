# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent"
@license: "MIT"
@version: "5.5"
@email: "owuordickson@gmail.com"
@created: "22 Feb 2021"
@modified: "22 Feb 2021"

Changes
-------
1. uses an nxm matrix to store binary matrices (where n=size/2 * size - 1 && m = attributes * 2).
2. introduces fuzzy classification of gradual states

"""
import csv
import zarr
from numcodecs import Blosc
from dateutil.parser import parse
import time
import numpy as np
import gc
import os
from pathlib import Path
from algorithms.common.gp_v4 import GI


class Dataset:

    def __init__(self, file_path, min_sup=0.5, eq=False):
        self.z_file = 'app_data/' + str(Path(file_path).stem) + str('.zarr')
        if os.path.exists(self.z_file):
            print("Fetching data from Zarr file")
            z_root = zarr.open(self.z_file, 'r')
            self.titles = z_root['dataset/titles'][:]
            self.time_cols = z_root['dataset/time_cols'][:]
            self.attr_cols = z_root['dataset/attr_cols'][:]
            size = z_root['dataset/size_arr'][:]
            self.col_count = size[0]
            self.row_count = size[1]
            self.attr_size = size[2]
            valid_count = size[3]
            self.step_name = 'step_' + str(int(self.row_count - self.attr_size))
            self.thd_supp = min_sup
            if valid_count < 3:
                self.no_bins = True
            else:
                self.no_bins = False
            # self.valid_items = []
        else:
            self.thd_supp = min_sup
            self.equal = eq
            self.titles, self.data = Dataset.read_csv(file_path)
            self.row_count, self.col_count = self.data.shape
            self.time_cols = self.get_time_cols()
            self.attr_cols = self.get_attr_cols()
            # self.valid_items = []
            # self.rank_matrix = None
            self.no_bins = False
            self.step_name = ''  # For T-GRAANK
            self.attr_size = 0  # For T-GRAANK
            self.init_gp_attributes()

    def get_attr_cols(self):
        all_cols = np.arange(self.col_count)
        attr_cols = np.setdiff1d(all_cols, self.time_cols)
        return attr_cols

    def get_time_cols(self):
        # Retrieve first column only
        time_cols = list()
        n = self.col_count
        for i in range(n):  # check every column/attribute for time format
            row_data = str(self.data[0][i])
            try:
                time_ok, t_stamp = Dataset.test_time(row_data)
                if time_ok:
                    time_cols.append(i)
            except ValueError:
                continue
        return np.array(time_cols)

    def init_gp_attributes(self, attr_data=None):
        # 1. Transpose csv array data
        if attr_data is None:
            attr_data = self.data.T
            self.attr_size = self.row_count
        else:
            self.attr_size = len(attr_data[self.attr_cols[0]])
        self.step_name = 'step_' + str(int(self.row_count - self.attr_size))

        # 2. Initialize h5 groups to store class attributes
        self.init_zarr_groups()
        z_root = zarr.open(self.z_file, 'r+')

        # 3. Initialize (k x attr) matrix
        n = self.attr_size
        m = self.col_count
        k = int(n * (n - 1) / 2)
        chunk_size = 5

        grp_name = 'dataset/' + self.step_name + '/rank_matrix'
        compressor = Blosc(cname='zstd', clevel=3, shuffle=Blosc.BITSHUFFLE)
        rank_matrix = z_root.create_dataset(grp_name, shape=(k, m), dtype=np.float16,
                                            compressor=compressor)
        # rank_matrix = np.memmap(self.np_file, dtype=float, mode='w+', shape=(k, m))

        # 4. Determine binary rank (fuzzy: 0, 0.5, 1) and calculate support of pattern
        valid_count = 0
        valid_items = []
        for col in self.attr_cols:
            col_data = np.array(attr_data[col], dtype=float)
            incr = GI(col, '+')
            decr = GI(col, '-')

            # 4a. Determine gradual ranks
            tmp_rank = np.where(col_data < col_data[:, np.newaxis], 1,
                                np.where(col_data > col_data[:, np.newaxis], 0.5, 0))
            tmp_rank = tmp_rank[np.triu_indices(n, k=1)]

            # 4b. Check support of each generated item-set
            supp = float(np.count_nonzero(tmp_rank)) / float(n * (n - 1.0) / 2.0)
            if supp >= self.thd_supp:
                rank_matrix[:, col] = tmp_rank[:]
                valid_items.append(incr.as_string())
                valid_items.append(decr.as_string())
                valid_count += 2

        grp_name = 'dataset/' + self.step_name + '/valid_items'
        self.add_zarr_dataset(grp_name, np.array(valid_items).astype('S'))
        data_size = np.array([self.col_count, self.row_count, self.attr_size, valid_count])
        self.add_zarr_dataset('dataset/size_arr', data_size)
        if valid_count < 3:
            self.no_bins = True
        del self.data
        del attr_data
        del valid_items
        # print(rank_matrix[:])
        gc.collect()

    def init_zarr_groups(self):
        if os.path.exists(self.z_file):
            pass
        else:
            z_root = zarr.open(self.z_file, 'w')
            grp = z_root.require_group('dataset')
            grp.create_dataset('titles', data=self.titles)
            # grp.create_dataset('attr_data', data=self.attr_data.astype('S'), compression="gzip",
            #                   compression_opts=9)
            grp.create_dataset('time_cols', data=self.time_cols.astype('u1'))
            grp.create_dataset('attr_cols', data=self.attr_cols.astype('u1'))
            # z_root.close()

    def read_zarr_dataset(self, group):
        temp = np.array([])
        z_root = zarr.open(self.z_file, 'r')
        if group in z_root:
            temp = z_root[group][:]
        # z_root.close()
        return temp

    def add_zarr_dataset(self, group, data, compress=False):
        h5f = zarr.open(self.z_file, 'r+')
        if group in h5f:
            del h5f[group]
        if compress:
            compressor = Blosc(cname='zstd', clevel=3, shuffle=Blosc.BITSHUFFLE)
            h5f.create_dataset(group, data=data, chunks=True, compressor=compressor)
        else:
            h5f.create_dataset(group, data=data)
        # h5f.close()

    @staticmethod
    def read_csv(file):
        # 1. Retrieve data set from file
        try:
            with open(file, 'r') as f:
                dialect = csv.Sniffer().sniff(f.readline(), delimiters=";,' '\t")
                f.seek(0)
                reader = csv.reader(f, dialect)
                raw_data = list(reader)
                f.close()

            if len(raw_data) <= 1:
                print("Unable to read CSV file")
                raise Exception("CSV file read error. File has little or no data")
            else:
                print("Data fetched from CSV file")
                # 2. Get table headers
                if raw_data[0][0].replace('.', '', 1).isdigit() or raw_data[0][0].isdigit():
                    titles = np.array([])
                else:
                    if raw_data[0][1].replace('.', '', 1).isdigit() or raw_data[0][1].isdigit():
                        titles = np.array([])
                    else:
                        # titles = self.convert_data_to_array(data, has_title=True)
                        keys = np.arange(len(raw_data[0]))
                        values = np.array(raw_data[0], dtype='S')
                        titles = np.rec.fromarrays((keys, values), names=('key', 'value'))
                        raw_data = np.delete(raw_data, 0, 0)
                return titles, np.asarray(raw_data)
                # return Dataset.get_tbl_headers(temp)
        except Exception as error:
            print("Unable to read CSV file")
            raise Exception("CSV file read error. " + str(error))

    @staticmethod
    def test_time(date_str):
        # add all the possible formats
        try:
            if type(int(date_str)):
                return False, False
        except ValueError:
            try:
                if type(float(date_str)):
                    return False, False
            except ValueError:
                try:
                    date_time = parse(date_str)
                    t_stamp = time.mktime(date_time.timetuple())
                    return True, t_stamp
                except ValueError:
                    raise ValueError('no valid date-time format found')

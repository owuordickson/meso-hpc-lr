# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent"
@license: "MIT"
@version: "5.4"
@email: "owuordickson@gmail.com"
@created: "12 July 2019"
@modified: "17 Feb 2021"

Changes
-------
1. save attribute gradual item sets binaries as json file and retrieve them as dicts
   - this frees primary memory from storing nxn matrices
2. Fetch all binaries during initialization
3. Replaced loops for fetching binary rank with numpy function

"""
import csv
import h5py
from dateutil.parser import parse
import time
import numpy as np
import gc
import os
from pathlib import Path


class Dataset:

    def __init__(self, file_path, min_sup=0.5):
        self.h5_file = str(Path(file_path).stem) + str('.h5')
        if os.path.exists(self.h5_file):
            print("Fetching data from h5 file")
            h5f = h5py.File(self.h5_file, 'r')
            self.titles = h5f['dataset/titles'][:]
            self.time_cols = h5f['dataset/time_cols'][:]
            self.attr_cols = h5f['dataset/attr_cols'][:]
            size = h5f['dataset/size_arr'][:]
            self.col_count = size[0]
            self.row_count = size[1]
            self.attr_size = size[2]
            valid_count = size[3]
            self.step_name = 'step_' + str(int(self.row_count - self.attr_size))
            h5f.close()
            self.thd_supp = min_sup
            if valid_count < 3:
                self.no_bins = True
            else:
                self.no_bins = False
        else:
            self.thd_supp = min_sup
            self.titles, self.data = Dataset.read_csv(file_path)
            self.row_count, self.col_count = self.data.shape
            self.time_cols = self.get_time_cols()
            self.attr_cols = self.get_attr_cols()
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
        # (check) implement parallel multiprocessing
        # 1. Transpose csv array data
        if attr_data is None:
            attr_data = self.data.T
            self.attr_size = self.row_count
        else:
            self.attr_size = len(attr_data[self.attr_cols[0]])
        self.step_name = 'step_' + str(int(self.row_count - self.attr_size))

        # 2. Initialize h5 groups to store class attributes
        self.init_h5_groups()
        h5f = h5py.File(self.h5_file, 'r+')

        # 3. Construct and store 1-item_set valid bins
        # execute binary rank to calculate support of pattern
        n = self.attr_size
        valid_count = 0
        for col in self.attr_cols:
            col_data = np.array(attr_data[col], dtype=float)
            incr = np.array((col, '+'), dtype='i, S1')
            decr = np.array((col, '-'), dtype='i, S1')

            # 3a. Generate 1-itemset gradual items
            with np.errstate(invalid='ignore'):
                # temp_pos = col_data < col_data[:, np.newaxis]
                grp = 'dataset/' + self.step_name + '/valid_bins/' + str(col) + '_pos'
                temp_pos = h5f.create_dataset(grp, data=col_data > col_data[:, np.newaxis], chunks=True)

                # 3b. Check support of each generated itemset
                bin_sum = 0
                for s in temp_pos.iter_chunks():
                    bin_sum += np.sum(temp_pos[s])
                supp = float(bin_sum) / float(n * (n - 1.0) / 2.0)
                if supp < self.thd_supp:
                    del h5f[grp]
                else:
                    grp = 'dataset/' + self.step_name + '/valid_bins/' + str(col) + '_neg'
                    h5f.create_dataset(grp, data=col_data < col_data[:, np.newaxis], chunks=True)
                    valid_count += 2
        h5f.close()
        data_size = np.array([self.col_count, self.row_count, self.attr_size, valid_count])
        self.add_h5_dataset('dataset/size_arr', data_size)
        if valid_count < 3:
            self.no_bins = True
        gc.collect()

    def init_h5_groups(self):
        if os.path.exists(self.h5_file):
            pass
        else:
            h5f = h5py.File(self.h5_file, 'w')
            grp = h5f.require_group('dataset')
            grp.create_dataset('titles', data=self.titles)
            grp.create_dataset('data', data=np.array(self.data.copy()).astype('S'), compression="gzip",
                               compression_opts=9)
            grp.create_dataset('time_cols', data=self.time_cols)
            grp.create_dataset('attr_cols', data=self.attr_cols)
            h5f.close()
            self.data = None

    def read_h5_dataset(self, group):
        temp = np.array([])
        h5f = h5py.File(self.h5_file, 'r')
        if group in h5f:
            temp = h5f[group][:]
        h5f.close()
        return temp

    def add_h5_dataset(self, group, data):
        h5f = h5py.File(self.h5_file, 'r+')
        if group in h5f:
            del h5f[group]
        h5f.create_dataset(group, data=data, compression="gzip", compression_opts=9)
        h5f.close()

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

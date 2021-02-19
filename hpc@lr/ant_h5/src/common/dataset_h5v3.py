# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent"
@license: "MIT"
@version: "5.3"
@email: "owuordickson@gmail.com"
@created: "05 February 2021"

Description
-------


"""


import csv
import h5py
import os
import gc
from pathlib import Path
from dateutil.parser import parse
import time
import numpy as np


class Dataset:

    def __init__(self, file_path, segs, min_sup=0.5):
        self.h5_file = str(Path(file_path).stem) + str('.h5')
        if os.path.exists(self.h5_file):
            print("Fetching data from h5 file")
            h5f = h5py.File(self.h5_file, 'r')
            self.titles = h5f['dataset/titles'][:]
            self.time_cols = h5f['dataset/time_cols'][:]
            self.attr_cols = h5f['dataset/attr_cols'][:]
            # self.data = h5f['dataset/data'][:]  # TO BE REMOVED
            size = h5f['dataset/size'][:]
            self.col_count = size[0]
            self.row_count = size[1]
            self.attr_size = size[2]
            self.step_name = 'step_' + str(int(self.row_count - self.attr_size))
            self.invalid_bins = h5f['dataset/' + self.step_name + '/invalid_bins'][:]
            self.seg_sums = h5f['dataset/' + self.step_name + '/seg_sums'][:]
            self.seg_count = self.seg_sums[0].size
            h5f.close()
            self.thd_supp = min_sup
            n = (self.attr_cols.size * 2) - self.invalid_bins.size
            if n > 0:
                self.no_bins = False
            else:
                self.no_bins = True
            # self.data = None
        else:
            self.thd_supp = min_sup
            self.titles, self.data = Dataset.read_csv(file_path)
            self.row_count, self.col_count = self.data.shape
            self.time_cols = self.get_time_cols()
            self.attr_cols = self.get_attr_cols()
            self.invalid_bins = np.array([])
            self.no_bins = False
            self.seg_sums = np.array([])
            self.seg_count = 0
            self.step_name = ''  # For T-GRAANK
            self.attr_size = 0  # For T-GRAANK
            self.init_gp_attributes(segs)
            # self.valid_bins = np.array([])
            # self.init_attributes()

    def get_attr_cols(self):
        all_cols = np.arange(self.col_count)
        attr_cols = np.setdiff1d(all_cols, self.time_cols)
        return attr_cols

    def get_time_cols(self):
        time_cols = list()
        # for k in range(10, len(self.data[0])):
        #    time_cols.append(k)
        # time_cols.append(0)
        n = len(self.data[0])
        for i in range(n):  # check every column for time format
            row_data = str(self.data[0][i])
            try:
                time_ok, t_stamp = Dataset.test_time(row_data)
                if time_ok:
                    time_cols.append(i)
            except ValueError:
                continue
        if len(time_cols) > 0:
            return np.array(time_cols)
        else:
            return np.array([])

    def init_gp_attributes(self, seg_no, attr_data=None):
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
        # valid_bins = list()
        invalid_bins = list()
        seg_sums = list()
        valid_count = 0
        for col in self.attr_cols:
            col_data = np.array(attr_data[col], dtype=float)
            incr = np.array((col, '+'), dtype='i, S1')
            decr = np.array((col, '-'), dtype='i, S1')

            # 3a. Execute binary rank to calculate support of pattern
            seg_step = int(self.row_count / seg_no)
            arr_pos, arr_neg = self.bin_rank(col_data, seg_step)
            if arr_pos is None:
                invalid_bins.append(incr)
            else:
                # valid_bins.append(np.array([incr.tolist(), arr_pos[0], arr_pos[1]], dtype=object))
                grp_name = 'dataset/' + self.step_name + '/valid_bins/' + str(col) + '_pos'
                grp = h5f.create_group(grp_name)
                temp_dict = dict(attr=incr.tolist(), segs=arr_pos[0])
                for k, v in temp_dict.items():
                    grp.create_dataset(k, data=v)
                bins_zip = zip(np.arange(arr_pos[0].size), arr_pos[1])
                # bins_dict = dict(bins_zip)
                grp = h5f.create_group(grp_name + '/bins')
                for k, v in bins_zip:
                    grp.create_dataset(str(k), data=v)
                seg_sums.append(arr_pos[0])
                valid_count += 1
            if arr_neg is None:
                invalid_bins.append(decr)
            else:
                # valid_bins.append(np.array([decr.tolist(), arr_neg[0], arr_neg[1]], dtype=object))
                grp_name = 'dataset/' + self.step_name + '/valid_bins/' + str(col) + '_neg'
                grp = h5f.create_group(grp_name)
                # self.add_h5_dataset(grp, np.array([decr.tolist(), arr_neg[1]]))
                temp_dict = dict(attr=decr.tolist(), segs=arr_neg[0])
                for k, v in temp_dict.items():
                    grp.create_dataset(k, data=v)
                bins_zip = zip(np.arange(arr_neg[0].size), arr_neg[1])
                # bins_dict = dict(bins_zip)
                grp = h5f.create_group(grp_name + '/bins')
                for k, v in bins_zip:
                    grp.create_dataset(str(k), data=v)
                seg_sums.append(arr_neg[0])
                valid_count += 1

        self.invalid_bins = np.array(invalid_bins)
        grp = 'dataset/' + self.step_name + '/invalid_bins'
        self.add_h5_dataset(grp, self.invalid_bins)
        data_size = np.array([self.col_count, self.row_count, self.attr_size])
        self.add_h5_dataset('dataset/size', data_size)
        self.seg_sums = np.array(seg_sums)
        grp = 'dataset/' + self.step_name + '/seg_sums'
        self.add_h5_dataset(grp, self.seg_sums)

        if valid_count < 3:
            self.no_bins = True
        else:
            self.seg_count = self.seg_sums[0].size
        h5f.close()
        gc.collect()

    def bin_rank(self, arr, step):
        n = self.attr_size
        lst_pos = []
        lst_neg = []
        lst_pos_sum = []
        lst_neg_sum = []
        with np.errstate(invalid='ignore'):
            for i in range(0, n, step):
                if i == 0:
                    bin_neg = arr < arr[:step, np.newaxis]
                    bin_pos = arr > arr[:step, np.newaxis]
                else:
                    if (i+step) < n:
                        bin_neg = arr < arr[i:(i+step), np.newaxis]
                        bin_pos = arr > arr[i:(i+step), np.newaxis]
                    else:
                        bin_neg = arr < arr[i:, np.newaxis]
                        bin_pos = arr > arr[i:, np.newaxis]
                lst_neg.append(bin_neg)
                lst_pos.append(bin_pos)
                lst_neg_sum.append(np.sum(bin_neg))
                lst_pos_sum.append(np.sum(bin_pos))
            sup_neg = float(np.sum(lst_neg_sum)) / float(n * (n - 1.0) / 2.0)
            sup_pos = float(np.sum(lst_pos_sum)) / float(n * (n - 1.0) / 2.0)
            if sup_neg < self.thd_supp:
                lst_neg = None
            else:
                lst_neg = [np.array(lst_neg_sum, dtype=int), lst_neg]
            if sup_pos < self.thd_supp:
                lst_pos = None
            else:
                lst_pos = [np.array(lst_pos_sum, dtype=int), lst_pos]
            return lst_pos, lst_neg

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

    def read_h5_dataset(self, group, seg=None):
        temp = np.array([])
        h5f = h5py.File(self.h5_file, 'r')
        if group in h5f:
            if seg is None:
                temp = h5f[group][:]
            else:
                temp = h5f[group][seg]
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

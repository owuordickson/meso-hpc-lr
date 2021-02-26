# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent"
@license: "MIT"
@version: "6.0"
@email: "owuordickson@gmail.com"
@created: "12 July 2019"
@modified: "17 Feb 2021"

Changes (Similar to v4.0)
-------
1. Fetch all binaries during initialization
2. Replaced loops for fetching binary rank with numpy function
3. Chunks binaries by segmenting length of data set tuples into groups

"""
import csv
from dateutil.parser import parse
import time
import numpy as np
import gc


class Dataset:

    def __init__(self, file_path, chunks, min_sup, eq=False):
        self.thd_supp = min_sup
        self.equal = eq
        self.chunks = chunks
        self.titles, self.data = Dataset.read_csv(file_path)
        self.row_count, self.col_count = self.data.shape
        self.time_cols = self.get_time_cols()
        self.attr_cols = self.get_attr_cols()
        self.valid_bins = np.array([])
        self.no_bins = False
        self.step_name = ''  # For T-GRAANK
        self.attr_size = 0  # For T-GRAANK
        # self.init_attributes()

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
            attr_data = self.data.T.copy()
            del self.data
            self.attr_size = self.row_count
        else:
            self.attr_size = len(attr_data[self.attr_cols[0]])

        # 2. Construct and store 1-item_set valid bins
        # execute binary rank to calculate support of pattern
        n = self.attr_size
        valid_bins = list()
        for col in self.attr_cols:
            col_data = np.array(attr_data[col], dtype=float)
            incr = np.array((col, '+'), dtype='i, S1')
            decr = np.array((col, '-'), dtype='i, S1')

            # 2a. Chunk col_data into segments
            col_segs = np.array_split(col_data, self.chunks)
            col_bins_pos = []
            col_bins_neg = []
            bin_sum = 0
            # print(col_segs)
            for i in range(self.chunks):
                for j in range(self.chunks):
                    with np.errstate(invalid='ignore'):
                        tmp_bin = col_segs[i] > col_segs[j][:, np.newaxis]
                        bin_sum += np.sum(tmp_bin)
                        col_bins_pos.append(tmp_bin)
                        tmp_bin = col_segs[i] < col_segs[j][:, np.newaxis]
                        col_bins_neg.append(tmp_bin)
            # print(col_bins_pos)
            # print(bin_sum)
            # print("---\n")

            # 2a. Generate 1-itemset gradual items
            # with np.errstate(invalid='ignore'):
            #    if not self.equal:
            #        temp_pos = col_data < col_data[:, np.newaxis]
            #    else:
            #        temp_pos = col_data <= col_data[:, np.newaxis]
            #        np.fill_diagonal(temp_pos, 0)

            # 2b. Check support of each generated itemset
            supp = float(bin_sum) / float(n * (n - 1.0) / 2.0)
            if supp >= self.thd_supp:
                valid_bins.append(np.array([incr.tolist(), col_bins_pos], dtype=object))
                valid_bins.append(np.array([decr.tolist(), col_bins_neg], dtype=object))
        self.valid_bins = np.array(valid_bins)
        # print(self.valid_bins)
        if len(self.valid_bins) < 3:
            self.no_bins = True
        del attr_data
        gc.collect()

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

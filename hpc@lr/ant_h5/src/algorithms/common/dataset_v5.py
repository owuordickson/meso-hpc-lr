# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent"
@license: "MIT"
@version: "5.0"
@email: "owuordickson@gmail.com"
@created: "22 Feb 2021"
@modified: "22 Feb 2021"

Changes
-------
1. uses an nxm matrix to store binary matrices (where n=size/2 * size - 1 && m = attributes * 2).
2. introduces fuzzy classification of gradual states

"""
import csv
from dateutil.parser import parse
import time
import numpy as np
import gc
from algorithms.common.gp_v4 import GI


class Dataset:

    def __init__(self, file_path, min_sup=0.5, eq=False):
        self.thd_supp = min_sup
        self.equal = eq
        self.titles, self.data = Dataset.read_csv(file_path)
        self.row_count, self.col_count = self.data.shape
        self.time_cols = self.get_time_cols()
        self.attr_cols = self.get_attr_cols()
        self.valid_items = []
        self.rank_matrix = None
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
        # 1. Transpose csv array data
        if attr_data is None:
            attr_data = self.data.T
            self.attr_size = self.row_count
        else:
            self.attr_size = len(attr_data[self.attr_cols[0]])

        # 2. Initialize (k x attr) matrix
        n = self.attr_size
        m = self.col_count
        k = int(n * (n - 1) / 2)
        self.rank_matrix = np.zeros((k, m), dtype=np.float16)

        # 3. Determine binary rank (fuzzy: 0, 0.5, 1) and calculate support of pattern
        valid_count = 0
        for col in self.attr_cols:
            col_data = np.array(attr_data[col], dtype=float)
            incr = GI(col, '+')
            decr = GI(col, '-')

            # 3a. Determine gradual ranks
            bin_sum = 0
            row = 0
            for i in range(n):
                for j in range(i + 1, n):
                    if col_data[i] > col_data[j]:
                        self.rank_matrix[row][col] = 1
                        bin_sum += 1
                    elif col_data[j] > col_data[i]:
                        self.rank_matrix[row][col] = 0.5
                        bin_sum += 1
                    row += 1

            # 3b. Check support of each generated item-set
            supp = float(np.sum(bin_sum)) / float(n * (n - 1.0) / 2.0)
            if supp >= self.thd_supp:
                self.valid_items.append(incr.as_string())
                self.valid_items.append(decr.as_string())
                valid_count += 2

        if valid_count < 3:
            self.no_bins = True
        del self.data
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

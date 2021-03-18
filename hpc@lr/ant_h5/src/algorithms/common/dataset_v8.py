# -*- coding: utf-8 -*-
"""
@author: "Dickson OWUOR"
@credits: "Anne LAURENT"
@license: "MIT"
@version: "8.0"
@email: "owuordickson@gmail.com"
@created: "12 July 2019"
@modified: "10 Mar 2021"

Changes
-------
1. Chunks CSV file read
2. Transfers calculations of Ranks to ACO_GRAD class

"""
import gc
import os
from pathlib import Path
from dateutil.parser import parse
import h5py
import time
import numpy as np
import pandas as pd


class Dataset:

    def __init__(self, file_path):
        self.h5_file = 'app_data/' + str(Path(file_path).stem) + str('.h5')
        skip_h5 = True
        # if os.path.exists(self.h5_file):
        if not skip_h5:
            print("Fetching data from h5 file")
            h5f = h5py.File(self.h5_file, 'r')
            self.titles = h5f['dataset/titles'][:]
            self.time_cols = h5f['dataset/time_cols'][:]
            self.attr_cols = h5f['dataset/attr_cols'][:]
            size = h5f['dataset/size_arr'][:]
            self.col_count = size[0]
            self.has_titles = size[1]
            h5f.close()
        else:
            self.has_titles, self.titles, self.time_cols = Dataset.read_csv_header(file_path)
            self.col_count = self.titles.shape[0]
            self.attr_cols = self.get_attr_cols()
        self.csv_file = file_path
        self.row_count = 0  # TO BE UPDATED in ACO_GRAD class
        self.used_chunks = 0
        self.skipped_chunks = 0
        # self.save_to_hdf5()

    def get_attr_cols(self):
        all_cols = np.arange(self.col_count)
        attr_cols = np.setdiff1d(all_cols, self.time_cols)
        return attr_cols

    def get_col_name(self, gi):
        if self.has_titles:
            col_name = self.titles[gi.attribute_col][1].decode()
        else:
            col_name = self.titles[gi.attribute_col][1]
        return col_name

    def print_header(self):
        str_header = "Header Columns/Attributes\n-------------------------\n"
        for txt in self.titles:
            str_header += (str(txt[0]) + '. ' + str(txt[1].decode()) + '\n')
        return str_header

    def save_to_hdf5(self):
        # 1. Initiate HDF5 file
        h5f = h5py.File(self.h5_file, 'w')
        h5f.create_dataset('dataset/titles', data=self.titles)
        h5f.create_dataset('dataset/time_cols', data=self.time_cols.astype('u1'))
        h5f.create_dataset('dataset/attr_cols', data=self.attr_cols.astype('u1'))
        h5f.create_dataset('dataset/size_arr', data=np.array([self.col_count, self.has_titles]))
        h5f.close()

    def read_csv_data(self, cols, c_size):
        if not self.has_titles:
            col_names = self.titles[:, 1]
            chunk = pd.read_csv(self.csv_file, sep="[;,' '\t]", usecols=cols, chunksize=c_size, names=col_names,
                                header=None, engine='python')
        else:
            chunk = pd.read_csv(self.csv_file, sep="[;,' '\t]", usecols=cols, chunksize=c_size, engine='python')
        return chunk

    @staticmethod
    def read_csv_header(file):
        try:
            has_titles = 0
            df = pd.read_csv(file, sep="[;,' '\t]", engine='python', nrows=1)
            header_row = df.columns.tolist()

            if len(header_row) <= 0:
                print("CSV file is empty!")
                raise Exception("CSV file read error. File has little or no data")
            else:
                print("Header titles fetched from CSV file")
                # 2. Get table headers
                keys = np.arange(len(header_row))
                if header_row[0].replace('.', '', 1).isdigit() or header_row[0].isdigit():
                    tmp_vals = ['column_'+str(x) for x in keys]
                    values = np.array(tmp_vals, dtype='S')
                else:
                    if header_row[1].replace('.', '', 1).isdigit() or header_row[1].isdigit():
                        tmp_vals = ['column_' + str(x) for x in keys]
                        values = np.array(tmp_vals, dtype='S')
                    else:
                        values = np.array(header_row, dtype='S')
                        has_titles = 1
                # titles = np.rec.fromarrays((keys, values), names=('key', 'value'))
                titles = np.column_stack((keys.astype(np.object), values))
                del header_row
                gc.collect()
                return has_titles, titles, Dataset.get_time_cols(df.values)
        except Exception as error:
            print("Unable to read 1st line of CSV file")
            raise Exception("CSV file read error. " + str(error))

    @staticmethod
    def get_time_cols(data):
        # Retrieve first column only
        time_cols = list()
        # n = len(data)
        for i in range(data.shape[1]):  # check every column/attribute for time format
            row_data = str(data[0][i])
            try:
                time_ok, t_stamp = Dataset.test_time(row_data)
                if time_ok:
                    time_cols.append(i)
            except ValueError:
                continue
        return np.array(time_cols)

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

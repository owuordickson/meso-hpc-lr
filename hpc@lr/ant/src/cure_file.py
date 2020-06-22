import sys
from optparse import OptionParser
import csv


def read_csv(file):
    # 1. retrieve data-set from file
    with open(file, 'r') as f:
        dialect = csv.Sniffer().sniff(f.readline(), delimiters=";,' '\t")
        f.seek(0)
        reader = csv.reader(f, dialect)
        temp = list(reader)
    for i in range(1, len(temp)):
        row = temp[i]
        for j in range(len(row)):
            try:
                x = float(temp[i][j])
            except ValueError:
                temp[i][j] = 0
    with open(file, 'w') as f:
        writer = csv.writer(f, delimiter=';')
        for line in temp:
            writer.writerow(line)
    return temp


if __name__ == "__main__":
    if not sys.argv:
        filePath = sys.argv[1]
    else:
        optparser = OptionParser()
        optparser.add_option('-f', '--inputFile',
                             dest='file',
                             help='path to file containing csv',
                             # default=None,
                             default='../data/FluTopicData-testsansdate-blank.csv',
                             type='string')
        (options, args) = optparser.parse_args()
        if options.file is None:
            print("Usage: $python init_acograd.py -f filename.csv ")
            sys.exit('System will exit')
        else:
            filePath = options.file


    res_text = read_csv(filePath)

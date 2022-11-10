# import so4gp as sgp
from .so4gp import get_num_cores, GRAANK


def execute(f_path, min_supp, cores, eq=False):
    try:
        mine_obj = GRAANK(data_source=f_path, min_sup=min_supp, eq=eq)
        mine_obj.discover()
        lst_gp = mine_obj.gradual_patterns

        if cores > 1:
            num_cores = cores
        else:
            num_cores = get_num_cores()

        wr_line = "Algorithm: GRAANK \n"
        wr_line += "No. of (dataset) attributes: " + str(mine_obj.col_count) + '\n'
        wr_line += "No. of (dataset) tuples: " + str(mine_obj.row_count) + '\n'
        wr_line += "Minimum support: " + str(min_supp) + '\n'
        wr_line += "Number of cores: " + str(num_cores) + '\n'
        wr_line += "Number of patterns: " + str(len(lst_gp)) + '\n\n'

        for txt in mine_obj.titles:
            wr_line += (str(txt[0]) + '. ' + str(txt[1].decode()) + '\n')

        wr_line += str("\nFile: " + f_path + '\n')
        wr_line += str("\nPattern : Support" + '\n')

        for gp in lst_gp:
            wr_line += (str(gp.to_string()) + ' : ' + str(gp.support) + '\n')

        return wr_line
    except ArithmeticError as error:
        wr_line = "Failed: " + str(error)
        print(error)
        return wr_line

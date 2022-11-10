# import so4gp as sgp
from .so4gp import get_num_cores, AntGRAANK


def execute(f_path, min_supp, cores,  evaporation_factor, max_iteration):
    try:
        if cores > 1:
            num_cores = cores
        else:
            num_cores = get_num_cores()

        mine_obj = AntGRAANK(f_path, min_supp, max_iter=max_iteration, e_factor=evaporation_factor)
        mine_obj.discover()
        lst_gp = mine_obj.gradual_patterns

        wr_line = "Algorithm: ACO-GRAANK (v4.0)\n"
        wr_line += "No. of (dataset) attributes: " + str(mine_obj.col_count) + '\n'
        wr_line += "No. of (dataset) tuples: " + str(mine_obj.row_count) + '\n'
        wr_line += "Evaporation factor: " + str(evaporation_factor) + '\n'
        wr_line += "Number of iterations: " + str(max_iteration) + '\n'

        wr_line += "Minimum support: " + str(min_supp) + '\n'
        wr_line += "Number of cores: " + str(num_cores) + '\n'
        wr_line += "Number of patterns: " + str(len(lst_gp)) + '\n'

        for txt in mine_obj.titles:
            try:
                wr_line += (str(txt.key) + '. ' + str(txt.value.decode()) + '\n')
            except AttributeError:
                wr_line += (str(txt[0]) + '. ' + str(txt[1].decode()) + '\n')

        wr_line += str("\nFile: " + f_path + '\n')
        wr_line += str("\nPattern : Support" + '\n')

        for gp in lst_gp:
            wr_line += (str(gp.to_string()) + ' : ' + str(round(gp.support, 3)) + '\n')

        return wr_line
    except ArithmeticError as error:
        wr_line = "Failed: " + str(error)
        print(error)
        return wr_line

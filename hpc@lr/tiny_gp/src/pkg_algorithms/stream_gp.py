
from .so4gp_update import ExtGP


class StreamGP(ExtGP):

    def __int__(self):
        super(StreamGP, self).__init__()
        self.appearance_count = 0
        """:type appearance_count: int"""
        # self.total_count = 0
        # """:type total_count: int"""


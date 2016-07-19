from .Cell import Cell
import time


class Cosmos:
    MINCOSMOS_X = 0
    MINCOSMOS_Y = 0
    MAXCOSMOS_X = 999
    MAXCOSMOS_Y = 999

    def __init__(self):
        self.name = 'cosmos'
        self.cosmos = dict()
        self.cosmostime = 0

    def cell_at_index(self, x, y) -> Cell:
        temp_cell = self.cosmos.get(x).get(y)
        return temp_cell

    def insert_cell(self, cell):
        y_dic = self.cosmos.get(cell.x)
        if y_dic is None:
            y_dic = dict()
        y_dic[cell.y] = cell
        self.cosmos[cell.x] = y_dic

    def kill_cell_index(self, x, y):
        aCell = self.cell_at_index(x, y)
        aCell.die()

    def cosmos_run_time(self):
        self.cosmostime += 1
        while True:
            time.sleep(1)

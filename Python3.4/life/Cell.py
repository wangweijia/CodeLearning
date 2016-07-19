from .Cosmos import Cosmos
import random


def cell_birth(x, y):
    new_cell = Cell(x, y)
    return new_cell


class Cell:
    def __init__(self, x, y, cosmos: Cosmos):
        self.name = 'cell'
        self.x = x
        self.y = y
        self.age = 1
        self.energy = 0
        self.cosmos = cosmos
        self.map = None

    def update_map(self):
        """
        (x,y)
        one tow three
        1.1  2.1  3.1 -x
        1.2  self 3.2
        1.3  2.3  3.3
        |
        y
        """
        minX = (self.x - 1 >= self.cosmos.MINCOSMOS_X)
        minY = (self.y - 1 >= self.cosmos.MINCOSMOS_Y)
        maxX = (self.x + 1 <= self.cosmos.MAXCOSMOS_X)
        maxY = (self.y + 1 <= self.cosmos.MAXCOSMOS_Y)
        self.energy = 0
        if minX and minY:
            self.one_one = self.cosmos.cell_at_index(self.x - 1, self.y - 1)
            self.energy += 1
        if minY:
            self.two_one = self.cosmos.cell_at_index(self.x, self.y - 1)
            self.energy += 1
        if maxX and minY:
            self.three_one = self.cosmos.cell_at_index(self.x + 1, self.y - 1)
            self.energy += 1

        if minX:
            self.one_two = self.cosmos.cell_at_index(self.x - 1, self.y)
            self.energy += 1
        if maxX and minY:
            self.three_two = self.cosmos.cell_at_index(self.x + 1, self.y)
            self.energy += 1

        if minX and maxY:
            self.one_three = self.cosmos.cell_at_index(self.x - 1, self.y + 1)
            self.energy += 1
        if maxY:
            self.thow_three = self.cosmos.cell_at_index(self.x, self.y + 1)
            self.energy += 1
        if maxX and maxY:
            self.three_three = self.cosmos.cell_at_index(self.x + 1, self.y + 1)
            self.energy += 1

    def live_or_die(self) -> bool:
        """
        :return: True->live    False->die
        """
        if self.energy == 8:
            return False
        elif self.energy == 0:
            return False

        r = random.random()
        if r < self.__survival_present():
            return True
        else:
            return False

    def __survival_present(self):
        persent = 1
        if (self.age <= 2) or (self.age > 8):
            persent -= 0.5
        else:
            persent -= 0.1

        if self.energy < 3:
            persent -= (0.1 + (3 - self.energy) * 0.01)
        elif self.energy > 5:
            persent -= (0.1 + (self.energy - 5) * 0.01)
        else:
            persent -= 0.05
        return persent

    def die(self):
        self.cosmos.cosmos.get(self.x).pop(self.y)


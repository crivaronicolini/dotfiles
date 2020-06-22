#!/home/marco/repos/miniconda3/bin/python3
import os
import curses
from random import randint


class Tetris():

    def __init__(self, height, width):
        self.width = width
        self.height = height
        self.cursor_pos = (24, 0)
        self.init_screen()
        self.current_piece = Piece(self.screen)

        num_rows, num_cols = self.screen.getmaxyx()
        self.middle_col = int(num_cols / 2)

        self.RUNNING = True
        self.DEBUG = True
        self.DROP = False
        self.SPAWN = True
        self.banner = '''
████████╗███████╗████████╗██████╗░██╗░██████╗
╚══██╔══╝██╔════╝╚══██╔══╝██╔══██╗██║██╔════╝
░░░██║░░░█████╗░░░░░██║░░░██████╔╝██║╚█████╗░
░░░██║░░░██╔══╝░░░░░██║░░░██╔══██╗██║░╚═══██╗
░░░██║░░░███████╗░░░██║░░░██║░░██║██║██████╔╝
░░░╚═╝░░░╚══════╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═════╝░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
'''
        self.BANNERHEIGHT = len(self.banner.split())

    def init_screen(self):
        self.screen = curses.initscr()
        print('init screen')
        curses.noecho()
        curses.cbreak()
        curses.curs_set(0)
        self.screen.keypad(True)

    def end_screen(self):
        curses.nocbreak()
        self.screen.keypad(False)
        curses.echo()
        curses.endwin()

    def print_center_col(self, y_pos, message):
        middle_message = int(len(message) / 2)
        x_pos = self.middle_col - middle_message
        self.screen.addstr(y_pos, x_pos, message)

    # def draw_board(self):
    #     PARED = '|'
    #     BASE = '‾'
    #     self.board = [['░░']+[PARED] + [' '] * (self.width - 1) + [PARED]+['░░']
    #                   for i in range(self.height)]
    #     self.board.append([' '] + [BASE] * (self.width - 1))
    #     # self.board = [['|', ' ', ' ', ' ', '|'], ['|', ' ', ' ', ' ', '|'], ['|', ' ', ' ', ' ', '|'], ['|', ' ', ' ', ' ', '|'], ['|', ' ', ' ', ' ', '|'], ['|', '_', '_', '_', '|'],

    #     for row, line in enumerate(self.banner.split()):
    #         self.print_center_col(row, line)
    #     for row, line in enumerate(self.board):
    #         self.print_center_col(row+self.BANNERHEIGHT,
    #                               ("".join((char for char in line))))

    def draw_board(self):
        PARED = '|'
        BASE = '‾'
        # BASE = '_'
        BLOCK = '░░'
        borde_izq = self.middle_col - self.width//2
        borde_der = self.middle_col + self.width//2

        for row, line in enumerate(self.banner.split()):
            self.print_center_col(row, line)
        for row in range(self.height):
            self.screen.addstr(row + self.BANNERHEIGHT,
                               borde_izq, PARED)
            self.screen.addstr(row + self.BANNERHEIGHT,
                               borde_der, PARED)
            self.screen.addstr(row + self.BANNERHEIGHT,
                               borde_izq - 2, BLOCK)
            self.screen.addstr(row + self.BANNERHEIGHT,
                               borde_der + 1, BLOCK)
        for col in range(self.width-1):
            self.screen.addstr(self.height + self.BANNERHEIGHT,
                               col+borde_izq+1, BASE)
        # for row, line in enumerate(self.board):
        #     self.print_center_col(row+self.BANNERHEIGHT,
        #                           ("".join((char for char in line))))

    # def draw_pieces(self):
    #     x, y = self.cursor_pos
    #     if self.current_piece.is_alive:
    #         for i, _ in enumerate(self.current_piece.current_piece):
    #             for j, char in enumerate(_):
    #                 # self.board[y+i][x+j] = char
    #                 self.screen.addstr(self.BANNERHEIGHT+y+i,
    #                                    self.middle_col + x+j, char)
    #     self.debug(f'{self.current_piece.current_piece}\n')

    def clean(self):
        pass

    def get_key(self):
        key = self.screen.getch()
        x, y = self.cursor_pos
        if key == 27:
            self.RUNNING = False
        if key == 64:
            self.current_piece.rotate(-1)
        if key == 61:
            self.current_piece.rotate(1)
        elif key == 110:
            self.current_piece = Piece(self.screen)
        elif key == curses.KEY_LEFT or key == 104:
            x, y = (x-1, y)
        elif key == curses.KEY_RIGHT or key == 108:
            x, y = (x + 1, y)
        elif key == curses.KEY_UP or key == 107:
            x, y = (x, y - 1)
        elif key == curses.KEY_DOWN or key == 106:
            x, y = (x, y + 1)
        x = self.check_move(x, (1, self.width+1))
        y = self.check_move(y, (-1, self.height))
        self.cursor_pos = x, y
        self.debug(0,
                   f'cur:{self.cursor_pos}, screen:({self.width},{self.height})')
        self.debug(1, self.current_piece.current_piece)

    def check_move(self, val, compare):
        _min, _max = compare
        if val == _min:
            val += 1
        if val == _max:
            val -= 1
        return val

    def debug(self, row, mes):
        if self.DEBUG == True:
            self.screen.addstr(row, 0, str(mes))

    def game(self):
        while self.RUNNING:
            self.screen.erase()
            self.draw_board()
            self.get_key()
            self.current_piece.draw_piece(*self.cursor_pos)
            # self.draw_pieces()
            curses.doupdate()
        self.end_screen()


class Piece(Tetris):
    def __init__(self, screen):
        self.piezas = {1: [[['#', '#', '#', '#']], [['#'], ['#'], ['#'], ['#']]],
                       2: [[['#', '#', '#'], [' ', ' ', '#']], [[' ', '#'], [' ', '#'], ['#', '#']], [['#', ' ', ' '], ['#', '#', '#']], [['#', '#'], [' ', '#'], [' ', '#']]],
                       # 'S': [['#', '#', ' ', ' ', ' ', ' '], [' ', '#', '#', '#', '#', ' '], [' ', ' ', ' ', ' ', '#', '#']],
                       3: [['#', '#', ' '], [' ', '#', '#', ]]
                       }

        # self.current_family = self.piezas[randint(1, len(self.piezas))]
        self.current_family = self.piezas[2][0]
        self.current_piece = self.current_family
        self.is_alive = True
        self.screen = screen
        self.o = 1

    def draw_piece(self, x, y):
        if self.is_alive:
            y += self.o
            for i, _ in enumerate(self.current_piece):
                for j, char in enumerate(_):
                    self.screen.addstr(5+y+i, 85 + x+j, char)
            # self.o = self.o+1

    def rotate(self, wise):
        self.wise += wise
        if self.wise < 0:
            self.wise = len[self.current_family]
        try:
            self.current_piece = self.current_family[self.wise]
        except IndexError:
            self.current_piece = self.current_family[0]


if __name__ == '__main__':
    try:
        game = Tetris(20, 40)
        game.game()
    except KeyboardInterrupt:
        game.end_screen()
        # os.system('exit')

#!/usr/bin/env python3.11

# I know this script is way too wacky and hacky, and probably there is
# a better way of doing what it's supposed to do, but, for now and
# for me, it worksTM. Maybe in the future a re-write will be made.

import curses

def main(stdscr):
    header = """ ██████╗██╗  ██╗███████╗ █████╗ ████████╗███████╗██╗  ██╗███████╗███████╗████████╗
██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔════╝╚══██╔══╝
██║     ███████║█████╗  ███████║   ██║   ███████╗███████║█████╗  █████╗     ██║
██║     ██╔══██║██╔══╝  ██╔══██║   ██║   ╚════██║██╔══██║██╔══╝  ██╔══╝     ██║
╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████║██║  ██║███████╗███████╗   ██║
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝"""

    help_text = [
        "This window contains all of my keybinds in a useful list-like display",
        "MOD = Super; LEADER = Space; PREFIX = CTRL+B",
        "Press any key to exit.\n"
    ]

    zsh_data = [
        ["  CTRL+H  ", "Opens this help menu\n"],
        ["  CTRL+F  ", "Show projects search\n"],
        ["  CTRL+E  ", "Edit .dotfiles\n"],
        ["  CTRL+Y  ", "Fetchs and install a package from the repos\n"],
        ["  CTRL+U  ", "Fetchs and unninstall any installed package\n"],
        ["  CTRL+P  ", "Opens the project creator\n"],
        ["  CTRL+N  ", "Opens the notes editor\n"],
    ]

    nvim_data = [
        ["  CTRL+F           ",   "Search for files                \t",     "     Telescope\n"],
        ["  CTRL+B           ",   "Search for Git files            \t",     "     Telescope\n"],
        ["  CTRL+G           ",   "Grep through project            \t",     "     Telescope\n"],
        ["  LEADER+Y         ",   "Copy undo additions             \t",     "Telescope Undo\n"],
        ["  LEADER+F         ",   "Toggles Harpoon menu            \t",     "       Harpoon\n"],
        ["  LEADER+A         ",   "Add current file to harpoon menu\t",     "       Harpoon\n"],
        ["  CTRL+W+{1..9}    ",   "Jump to a Harpoon file          \t",     "       Harpoon\n"],
        ["  TAB              ",   "Accepts completion              \t",     "           CMP\n"],
        ["  UP               ",   "Navigate up in completion list  \t",     "           CMP\n"],
        ["  DOWN             ",   "Navigate up down completion list\t",     "           CMP\n"],
        ["  CTRL+E           ",   "Abort completion                \t",     "           CMP\n"],
    ]

    tmux_data = [
        ["  PREFIX+C      ", "Create a window\n"],
        ["  PREFIX+W      ", "List windows\n"],
        ["  PREFIX+,      ", "Rename current window\n"],
        ["  PREFIX+%      ", "Horizontal split\n"],
        ["  PREFIX+\"      ", "Vertical split\n"],
        ["  PREFIX+UP     ", "Move To/Resize Window\n"],
        ["  PREFIX+DOWN   ", "Move To/Resize Window\n"],
        ["  PREFIX+LEFT   ", "Move To/Resize Window\n"],
        ["  PREFIX+RIGHT  ", "Move To/Resize Window\n"],
    ]

    wm_data = [
        ["  MOD+{0..1}       ", "Go to Workspace\n"],
        ["  MOD+SHIFT+{0..1} ", "Move window to workspace\n"],
        ["  MOD+SHIFT+ARROWS ", "Move window in direction\n"],
        ["  MOD+ENTER        ", "Opens a terminal\n"],
        ["  MOD+D            ", "Opens program launcher\n"],
        ["  MOD+SHIFT+Q      ", "Closes a window\n"],
        ["  MOD+SHIFT+SPACE  ", "Toggles Floating\n"]
    ]


    curses.initscr()
    curses.noecho()
    curses.curs_set(0)
    stdscr.keypad(True)
    stdscr.scrollok(True)
    curses.start_color()

    curses.init_pair(1, curses.COLOR_WHITE, 0)
    curses.init_pair(2, 4, 0)
    curses.init_pair(3, 2, 0)
    curses.init_pair(4, 1, 0)
    curses.init_pair(5, 3, 0)

    curses.init_pair(6, curses.COLOR_WHITE, 8)
    curses.init_pair(7, 2, 8)
    curses.init_pair(8, 1, 8)
    curses.init_pair(9, 3, 8)

    stdscr.bkgd(' ', curses.color_pair(1))
    stdscr.clear()

    _, screen_width = stdscr.getmaxyx()
    header_height = 7
    start_col = (screen_width - 84) // 2
    list_start_row = len(help_text) + 10
    header_rows = header.split('\n')

    header_win = stdscr.subwin(header_height, 84, 1, start_col)
    help_win = stdscr.subwin(20, 80, 8, ((screen_width - 84) // 2))
    zsh_win = stdscr.subwin(len(zsh_data)+4, 55, list_start_row, 10)
    nvim_win = stdscr.subwin(len(nvim_data)+4, 72, list_start_row, (screen_width - 82))
    tmux_win = stdscr.subwin(len(tmux_data)+4, 39, (list_start_row+len(zsh_data)+5), 10)
    wm_win = stdscr.subwin(len(wm_data)+4, 45, list_start_row, 66)


    zsh_win.bkgd(' ', curses.color_pair(6))
    nvim_win.bkgd(' ', curses.color_pair(6))
    tmux_win.bkgd(' ', curses.color_pair(6))
    wm_win.bkgd(' ', curses.color_pair(6))

    for i, r in enumerate(header_rows):
        header_win.addstr(i + 1, 1, r, curses.color_pair(2))

    for i, r in enumerate(help_text):
        x = i + 1
        help_win.addstr(i + 1, 1, r.center(80), curses.color_pair(1))

    zsh_win.addstr("\n")
    zsh_win.addstr("ZSH".center(60), curses.color_pair(8))
    zsh_win.addstr("\n")
    for i, r in enumerate(zsh_data):
        x = i + 1
        zsh_win.addstr(r[0], curses.color_pair(7))
        zsh_win.addstr(r[1], curses.color_pair(6))

    nvim_win.addstr("\n")
    nvim_win.addstr("NeoViM".center(70), curses.color_pair(8))
    nvim_win.addstr("\n\n")
    for i, r in enumerate(nvim_data):
        x = i + 1
        nvim_win.addstr(r[0], curses.color_pair(7))
        nvim_win.addstr(r[1], curses.color_pair(6))
        nvim_win.addstr(r[2], curses.color_pair(9))

    tmux_win.addstr("\n")
    tmux_win.addstr("TMUX".center(39), curses.color_pair(8))
    tmux_win.addstr("\n")
    for i, r in enumerate(tmux_data):
        x = i + 1
        tmux_win.addstr(r[0], curses.color_pair(7))
        tmux_win.addstr(r[1], curses.color_pair(6))


    wm_win.addstr("\n")
    wm_win.addstr("Window Manager".center(45), curses.color_pair(8))
    wm_win.addstr("\n")
    for i, r in enumerate(wm_data):
        x = i + 1
        wm_win.addstr(r[0], curses.color_pair(7))
        wm_win.addstr(r[1], curses.color_pair(6))


    stdscr.getch()
    curses.endwin()

curses.wrapper(main)

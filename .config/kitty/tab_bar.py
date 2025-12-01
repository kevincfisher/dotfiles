from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb
from kitty.utils import color_as_int


opts = get_options()
COLOR_1 = as_rgb(color_as_int(opts.color2))
COLOR_2 = as_rgb(color_as_int(opts.color5))
COLOR_3 = as_rgb(color_as_int(opts.color3))
ICON = "  "

def _draw_icon(screen: Screen, index: int) -> int:
    if index != 1:
        return 0

    fg, bg = screen.cursor.fg, screen.cursor.bg
    screen.cursor.fg = COLOR_3
    screen.cursor.bg = as_rgb(color_as_int(opts.color10))
    screen.draw(ICON)
    screen.cursor.x = len(ICON)
    return screen.cursor.x

def _draw_left_status(
        draw_data: DrawData,
        screen: Screen
        ) -> int:
    if draw_data.leading_spaces:
        screen.draw(" " * draw_data.leading_spaces)

    screen.cursor.bg = COLOR_1
    screen.cursor.fg = as_rgb(color_as_int(draw_data.default_bg))
    screen.draw(" hello ")
    return screen.cursor.x


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    _draw_icon(screen, index)
    _draw_left_status(draw_data, screen)
    
    
    return screen.cursor.x

#!/bin/env python

#
# Licensed under GPLv3, Copyright (c) 2020 Yui
#

import sys
import dbus

def cut_text_scrolling(text: str, offset: int, maxlen=20, sep=' :: ',
                       ellipsis=False) -> str:
    text_len = len(text)

    if text_len <= maxlen:
        return text
    
    offset %= len(sep) + text_len

    prepend_len = (offset - text_len) + 1

    offset %= text_len

    if prepend_len > 0:
        offset -= prepend_len
        
        sep = sep[prepend_len:]

    cut = text[offset:maxlen+offset]

    spare = (maxlen+1) - len(cut)
 
    if spare > 0:
        cut += sep
        cut += text[0:spare]

    cut = cut[0:maxlen]

    if ellipsis:
        cut = f'...{cut}...'

    return cut


if __name__ == '__main__':
    if len(sys.argv) < 3:
        raise Exception("Not enough arguments")

    player = sys.argv[1]
    maxlen = int(sys.argv[2])
    offset = int(sys.argv[3]) if len(sys.argv) > 3 else 0

    bus = dbus.SessionBus()

    mpris = bus.get_object(f'org.mpris.MediaPlayer2.{player}',
                           '/org/mpris/MediaPlayer2')

    meta = mpris.Get('org.mpris.MediaPlayer2.Player', 'Metadata',
                     dbus_interface='org.freedesktop.DBus.Properties')

    
    artist = ', '.join(meta['xesam:artist'])
    title = meta['xesam:title']

    track = f'{artist} - {title}'

    x = cut_text_scrolling(track, offset, maxlen=maxlen)

    assert len(x) <= maxlen
    
    print(x)

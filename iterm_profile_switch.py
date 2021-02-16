#!/usr/bin/env python3.7

import asyncio
import time
import subprocess
import iterm2

def is_dark_mode():
    cmd = 'defaults read -g AppleInterfaceStyle'
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE, shell=True)
    return bool(p.communicate()[0])

async def set_profile(connection):
    app = await iterm2.async_get_app(connection)

    profile = "Light"
    if is_dark_mode():
        profile = "Dark"

    partialProfiles = await iterm2.PartialProfile.async_query(connection)
    for partial in partialProfiles:
        if partial.name == profile:
            full = await partial.async_get_full_profile()
            # Set profile in _all_ sessions
            for window in app.terminal_windows:
                for tab in window.tabs:
                    for session in tab.sessions:
                        await session.async_set_profile(full)
            return

async def main(connection):
    await set_profile(connection)
    while True:
        time.sleep(1)
        await set_profile(connection)

iterm2.run_forever(main)

#!/usr/bin/env bash
# Searchable cheatsheet of the live Hyprland keybinds. Bound to SUPER + F1.
set -euo pipefail

hyprctl binds -j | python3 -c '
import json, sys

MODS = [(64, "SUPER"), (4, "CTRL"), (8, "ALT"), (1, "SHIFT")]

for b in json.load(sys.stdin):
    if b["submap"]:
        continue
    parts = [name for bit, name in MODS if b["modmask"] & bit]
    if b["key"]:
        parts.append(b["key"])
    elif b["keycode"]:
        parts.append("keycode " + str(b["keycode"]))
    combo = " + ".join(parts)
    action = b["description"] or (b["dispatcher"] + " " + b["arg"]).strip()
    print(f"{combo:<32} {action}")
' | wofi --show dmenu --insensitive --prompt keybinds --cache-file /dev/null > /dev/null

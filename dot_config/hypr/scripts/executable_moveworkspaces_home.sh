#!/usr/bin/bash
hyprctl eval 'dis = hl.dispatch move=hl.dsp.workspace.move for i = 1, 9 do dis(move({ workspace = i, monitor = 1 })) end'

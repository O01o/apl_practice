#!/usr/bin/dyalog -script

⍝ load csv data
x ← ⎕CSV './src/test_data/lights_out/case_1_cell/x.csv' '' 4
x ← x = 1
⎕ ← x
⎕ ← ''

y ← ⎕CSV './src/test_data/lights_out/case_1_cell/y.csv' '' 4
y ← y = 1
⎕ ← y
⎕ ← ''

s ← ⎕CSV './src/test_data/lights_out/case_1_cell/s.csv' '' 4
s ← s = 1
⎕ ← s
⎕ ← ''

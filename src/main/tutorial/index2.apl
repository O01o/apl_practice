#!/usr/bin/dyalog -script
MIDX ← ⍳2 4 3
⎕ ← ⍴MIDX
⎕ ← ''
⎕ ← MIDX
⎕ ← ''
MIDX[2;3;] ← 1 1 1
⎕ ← 1 1 1⍳MIDX


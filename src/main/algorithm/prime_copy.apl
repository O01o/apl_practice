#!/usr/bin/dyalog -script
N ← 1000
T ← 2
TM ← T
M ← 1+2×⍳(¯1+N÷2)
:While T < N*÷2
    T ← ⌊/M
    TM ← TM, T
    CM ← T×⍳⌊(N÷T)
    M ← M~CM
:EndWhile
TM ← TM, M
⎕ ← TM

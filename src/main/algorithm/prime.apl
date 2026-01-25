#!/usr/bin/dyalog -script
N ← 1000 ⍝ range
PMAX ← 2 ⍝ target prime number
PL ← PMAX ⍝ prime number list
NL ← 1+2×⍳(¯1+N÷2) ⍝ define only odds
:While PMAX < N*÷2
    PMAX ← ⌊/NL ⍝ next prime number
    PL ← PL, PMAX ⍝ append prime number
    NL ← NL~PMAX×⍳⌊(N÷PMAX) ⍝ sift numbers
:EndWhile
PL ← PL, NL ⍝ combine others
⎕ ← PL

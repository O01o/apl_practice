#!/usr/bin/dyalog -script

⍝ load csv data
X ← ⎕CSV './src/test_data/lights_out/case_1_cell/x.csv' '' 4
X ← X = 1
⎕ ← X
⎕ ← ''

Y ← ⎕CSV './src/test_data/lights_out/case_1_cell/y.csv' '' 4
Y ← Y = 1
⎕ ← Y
⎕ ← ''

S ← ⎕CSV './src/test_data/lights_out/case_1_cell/s.csv' '' 4
S ← S = 1
⎕ ← S
⎕ ← ''

⍝ check matrix dimentions
:If 1 ≠ ≢ ∪ ⍴¨ X Y S
    ⎕ ← 'Error: MatriX dimensions do not match!'
    ⎕ ← 'X:', (⍕⍴X), ', Y:', (⍕⍴Y), ', S:', (⍕⍴S) 
    ⎕OFF 1 
:EndIf

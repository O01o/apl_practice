#!/usr/bin/dyalog -script

⎕ ← 2 = 2

:If 1
    ⎕ ← 'hit one'
:EndIf

:If ∨/ 0 0 1 0
    ⎕ ← 'hit any'
:EndIf

ARRHIT ← 2 3 5 = 2 3 5
⎕ ← ARRHIT

:If ∧/ ARRHIT
    ⎕ ← 'hit array'
:EndIf


ARR ← 2 3 4

M1 ← ↑ (
    (1 2 3)
    (2 3 4)
    (3 4 5)
)

M2 ← ↑ (
    (1 2 3)
    (3 4 5)
    (4 5 6)
)

ARRM1ANYHIT ← (⊂ARR) ≡¨ ↓M1
⎕ ← ARRM1ANYHIT
⍝ ⎕ ← M1
⍝ ⎕ ← ⍴M1
⍝ ⎕ ← ↓M1
⍝ ⎕ ← ⍴↓M1

:If ∨/ ARRM1ANYHIT
    ⎕ ← 'anyhit arr mat'
:EndIf

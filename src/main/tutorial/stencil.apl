#!/usr/bin/dyalog -script
ARR ← 4 6⍴⍳24
⎕ ← ARR
⎕ ← ''
⎕ ← {⊂⍺ ⍵}⌺3 4⊢ARR
⎕ ← ''
⎕ ← {+/,⍵}⌺3 4⊢ARR

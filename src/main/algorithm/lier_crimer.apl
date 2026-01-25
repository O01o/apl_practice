#!/usr/bin/dyalog -script

SN ← 'MABEL' 'DOROTHY' 'JULIETTA' 'ISABELLA' 'MADELINE'
LN ← 'UNKNOWN' 'TRUTH-TELLER' 'LIER' 'CONFLICT'
CN ← 'UNKNOWN' 'CRIMER' 'INNOCENCE' 'CONFLICT'

SL ← 0 0 0 0 2 ⍝ 0:UNKNOWN 1:TRUTH-TELLER 2:LIER
SC ← 0 0 0 0 0 ⍝ 0:UNKNOWN 1:CRIMER 2:INNOCENCE

⍝ Sisters mention who truth-teller/lier is.
⍝ TARGET-LIER-STATE ← SLRM[SPEAKER-INDEX; TARGET-INDEX]
SLRM ← ↑ (
    (0 1 0 0 0)
    (0 0 2 0 0)
    (0 0 0 1 0)
    (0 0 0 0 2)
    (1 0 0 0 0)
)
⍝ Sister mention who crimer/innocence is.
⍝ TARGET-CRIMER-STATE ← SCRM[SPEAKER-INDEX; TARGET-INDEX]
SCRM ← ↑ (
    (0 0 0 0 1)
    (1 0 0 0 0)
    (0 2 0 0 0)
    (0 0 0 0 2)
    (0 0 1 0 0)
)
⍝ Lier-Lier-Map
⍝ TARGET-LIER-STATE ← LLM[SPEAKER-LIER-STATE; TARGET-LIER-STATE]
LLM ← ↑ (
    (0 0 0)
    (0 1 2)
    (0 2 1)
)
⍝ Lier-Crimer-Map
⍝ TARGET-CRIMER-STATE ← LCM[SPEAKER-CRIMER-STATE; TARGET-CRIMER-STATE]
LCM ← ↑ (
    (0 0 0)
    (0 1 2)
    (0 2 1)
)
⍝ Mask for avoiding self-referential paradox
MASK ← (⍳5) ∘.≠ ⍳5


⍝ Lier Update
ITER ← 0
:While (⌊/SL) = 0
    ITER ← ITER + 1
    LLMM ← {LLM[⍵[1]; ⍵[1+⍳5]]} ¨↓ 1+(SL,SLRM)
    LLMM ← MASK ×⍉↑ LLMM
    NSL ← ∊ 3 ⌊ +/ ↑∪¨↓ LLMM
    SL ← +/ ↑∪¨↓ ⍉ 2 5 ⍴ SL,NSL
    ⎕ ← 'Lier' ITER LLMM SL 
    ⎕ ← ''

    :If (⌈/SL) > 2
        ⎕ ← 'Error: Conflict State'
        ⎕OFF 1
    :EndIf 
:EndWhile

⍝ Crimer Update
LCMM ← {LCM[⍵[1]; ⍵[1+⍳5]]} ¨↓ 1+(SL,SCRM)
LCMM ← MASK ×⍉↑ LCMM
NSC ← ∊↓⍉↑ 3 ⌊ +/ ↑∪¨↓ LCMM
SC ← +/ ↑∪¨↓ ⍉ 2 5 ⍴ SC,NSC
⎕ ← 'Crimer' LCMM SC
⎕ ← ''

⍝ Print Result
NIM ← ⍉ 3 5 ⍴ (⍳5),(1+SL),(1+SC)
NMM ← {
    SI LI CI ← ⍵[1 2 3]
    (SN[SI]) (LN[LI]) (CN[CI])
}
NM ← ↑ NMM ¨↓ NIM
⎕ ← NM

: score
    dup -rot
    - 3 mod ( 0 Draw, 1 Loss, 2 Win )
    6 0 3 ( 2 -> 6, 1 -> 0, 0 -> 3 )
    3 roll pick
    nip nip nip
    + 1 + ( add own hand )
    ;
: A 0 ;
: B 1 ;
: C 2 ;
: X 0 score + ;
: Y 1 score + ;
: Z 2 score + ;
0
include /dev/stdin
.
bye

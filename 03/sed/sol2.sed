#!/usr/bin/env -S sed -nEf
# Put 0 into hold space
1{h;s/.*/0/;x;}

# On third line, run
1~3{
N;N
s/\n/|/g

:start

# Pull new item from bag1
s/([a-zA-Z])\|/|?\1/

# Find before bag2
:move
s/\?([a-zA-Z])\1/!\1/
s/\?([a-zA-Z])([a-zA-Z])/\2?\1/
s/!([a-zA-Z])([a-zA-Z])/\2!\1/
t move

# If unfound, del char and restart
s/\?[a-zA-Z]\|/|/
t start

# Find in bag3
s/!([a-zA-Z])\|/|?\1/
:next
s/\?([a-zA-Z])\1/!\1/
s/\?([a-zA-Z])([a-zA-Z])/\2?\1/
s/!([a-zA-Z])([a-zA-Z])/\2!\1/
t next

# If unfound, del char and restart
s/\?[a-zA-Z]$//
t start

# Found a character, delete rest of pattern
s/^.*!([a-zA-Z])$/\1/

# Bring in running total from hold space
x;G

# Generate pluses equiv to letter's score
s/([A-Z])/++++++++++++++++++++++++++\1/
s/([p-z])/++++++++++++++++\1/I
s/([h-ox-z])/++++++++\1/I
s/([d-gl-ot-w])/++++\1/I
s/([bcfgjknorsvwz])/++\1/I
s/([acegikmoqsuwy])/+\1/I
s/[a-zA-Z]$//I
s/\n//

# Run unary arithmetic
:incr
s/0\+/1/;s/1\+/2/;s/2\+/3/;s/3\+/4/;s/4\+/5/;s/5\+/6/;s/6\+/7/;s/7\+/8/;s/8\+/9/
s/9\+/\+0/
s/^\+/1/
t incr

# Save new running total
h
}

# Print final total
${H;p}

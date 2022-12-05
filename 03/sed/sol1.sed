#!/usr/bin/env -S sed -nEf
# Put 0 into hold space
1{h;s/.*/0/;x;}

# Count number of characters, div 2
s/^/:/
:count
s/:([a-zA-Z]{2})/_\1:/
t count
:count1
s/([a-zA-Z])_/_\1/
t count1
s/://

# Place pivot at middle
s/^/:/
:pivot
s/([^[a-zA-Z])_([a-zA-Z])/\1\2_/
s/:([a-zA-Z])_([a-zA-Z])/\1:\2/
t pivot

# Delete characters behind the pivot from after the pivot
:start

s/([a-zA-Z]):/:-\1/
:dedupe
s/^.*-([a-zA-Z])\1.*$/\1/
s/-([a-zA-Z])([a-zA-Z])/\2-\1/
t dedupe

s/-.$//
t start

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

# Print final total
${H;p}

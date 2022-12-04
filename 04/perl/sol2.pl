#!/usr/bin/env -S perl -n
/(\d+)-(\d+),(\d+)-(\d+)/;
$total += $1 <= $3 && $2 >= $3 || $3 <= $1 && $4 >= $1;
END { print "$total\n" }

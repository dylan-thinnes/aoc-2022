#!/usr/bin/env -S perl -n
/(\d+)-(\d+),(\d+)-(\d+)/;
$total += $1 <= $3 && $2 >= $4 || $3 <= $1 && $4 >= $2;
END { print "$total\n" }

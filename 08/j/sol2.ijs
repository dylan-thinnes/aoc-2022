#!/usr/bin/env jconsole
input =: (1!:1) 3
parsed =: _48 + a. i. }: [;._1 LF , input

map =: i. 10
taller_mask =: map >"1 0 ]
update_distances =: [: >: *
running_distances =: [: }. [: update_distances/\. 0 ,~ taller_mask

distances_n =: {"0 1 running_distances
distances_ns =: distances_n * distances_n&.|.
distances_all =: distances_ns * distances_ns&.|:

answer =: >./ >./ distances_all parsed
(LF ,~ ": answer) (1!:2) 4
exit 0

#!/usr/bin/env jconsole
input =: (1!:1) 3
parsed =: _48 + a. i. }: [;._1 LF , input

vis_n =: [: (> _1 , }:) >./\
vis_ns =: vis_n +. vis_n&.|.
vis_all =: vis_ns +. vis_ns&.|:

answer =: +/ +/ vis_all parsed
(LF ,~ ": answer) (1!:2) 4
exit 0

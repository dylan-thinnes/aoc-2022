+-> # initialize running index to 0
+-> # initialize running total to 0
+-> # initialize uniqueness
++>> # init history of 4 twos, all with no uniqueness
++>>
++>>
++>>

# Ready at new history element
<< << << << << ----
[
  ++++
  >> >> >> >>
  >>,
  # Drop oldest element from history
  << << << <<
  >[<<<->>>[-]]<[-]
  <<<[->>+<<]>>+> # increment running index
  <<[->>+<<]>>
  <[->>+<<]>
  >> >> >> >>

  # Duplicate history w/ 1-offsets
  << << <<
  [->>>>>>>>+>+<<<<<<<<<]>>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]<<<<<<<<<
  >>
  [->>>>>>>+>+<<<<<<<<]>>>>>>>>[-<<<<<<<<+>>>>>>>>]<<<<<<<<
  >>
  [->>>>>>+>+<<<<<<<]>>>>>>>[-<<<<<<<+>>>>>>>]<<<<<<<
  >>

  # Subtract new element from history
  [->>->->->+<<<<<]>>>>>[-<<<<<+>>>>>]<<<<<

  # Set unique bit, increment uniqueness count
  <<<<<<<<+>>>>>>>> >+

  # Do triple element check, copy differences as 0 (meaning zero) or 1 (meaning non-zero)
  >>>>+++<<<<<
  >>[
   >>>-<<<
   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[-]
   >>>>>+<<<<<
  ]
  >[
   >>-<<
   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[-]
   >>>>>+<<<<<
  ]
  >[
   >-<
   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[-]
   >>>>>+<<<<<
  ]

  # If any three elements aren't different, unset the unique bit, return uniqueness count to orig
  >[<<<<- <<<<<<<<<->>>>>>>>> >>>>[-]]<<<<<

  # If any historical element is no longer unique (difference not-one,
  # historical unique bit one), transfer its uniqueness to the new element
  >>>>>>>-[<<<<<<< <<<<<< >[>>>>>>[-]+<<<<<<[-]]< >>>>>> >>>>>>>+]<<<<<<<
  >>>>>>>>-[<<<<<<<< <<<< >[>>>>[-]+<<<<[-]]< >>>> >>>>>>>>+]<<<<<<<<
  >>>>>>>>>-[<<<<<<<<< << >[>>[-]+<<[-]]< >> >>>>>>>>>+]<<<<<<<<<

  # Set up for next
  << << << << ----
]
>.

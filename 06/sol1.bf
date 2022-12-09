+-> # initialize uniqueness
+-> # initialize running total
++>> # init history of 4 twos, all with no uniqueness
++>>
++>>
++>>

# Ready at new history element
<< << << << << ----
[
  ++++.>.<
  >> >> >> >>
  >>,
  # Drop oldest element from history
  << << << <<
  >[<<<->>>[-]]<[-]
  <+[->>+<<]>
  <<[->>+<<]>>
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

  # Do 3 element check, copy differences as 0 (meaning zero) or 1 (meaning non-zero)
  >>>>+++<<<<
  >[
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

  # If any 3 elements aren't different, unset the unique bit, return uniqueness count to orig
  >[<<<<- <<<<<<<<<->>>>>>>>> >>>>[-]]<<<<
  <

  # If any historical element is no longer unique (difference not-one,
  # historical unique bit one), transfer its uniqueness to the new element
  >>>>>>>-[+ <<<<<<< >[-]+< <<<<<< >[-]< >>>>>> >>>>>>>]<<<<<<<
  >>>>>>>>-[+ <<<<<<<< >[-]+< <<<< >[-]< >>>> >>>>>>>>]<<<<<<<<
  >>>>>>>>>-[+ <<<<<<<<< >[-]+< << >[-]< >> >>>>>>>>>]<<<<<<<<<

  # Set up for next
  << << << << ----
]
>.

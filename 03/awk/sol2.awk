#!/usr/bin/env -S awk -f
BEGIN {
  for (n = 0; n < 256; n++)
    ascii[sprintf("%c", n)] = n
}

NR % 3 == 1 { elf1 = $0 }
NR % 3 == 2 { elf2 = $0 }
NR % 3 == 0 {
  $0 = gensub("[^" elf1 "]", "", "g") # remove elf3 \ elf1
  $0 = gensub("[^" elf2 "]", "", "g") # remove elf3 \ elf2

  value = ascii[substr($0, 0, 1)] - 96
  if (value < 0) value += 58
  total += value
}

END {
  print total
}

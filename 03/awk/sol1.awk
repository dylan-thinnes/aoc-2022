#!/usr/bin/env -S awk -f
BEGIN {
  for (n = 0; n < 256; n++)
    ascii[sprintf("%c", n)] = n
}

{
  l = length($0)
  bag1 = substr($0, 0, l / 2)
  bag2 = substr($0, l / 2 + 1, l)
  match(bag1, "[" bag2 "]", m) # Find common item

  value = ascii[m[0]] - 96
  if (value < 0) value += 58
  total += value
}

END {
  print total
}

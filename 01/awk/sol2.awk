#!/usr/bin/env -S awk -f
/^$/{
  totals[NR] = total
  total = 0
}
{
  total += $0
}
END {
  count = asort(totals)
  print(totals[count]+totals[count-1]+totals[count-2])
}

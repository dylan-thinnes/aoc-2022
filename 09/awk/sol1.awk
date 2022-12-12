#!/usr/bin/env -S awk -f
function sign(v) { return v < 0 ? -1 : v == 0 ? 0 : 1 }
function abs(v) { return v * sign(v) }

BEGIN { depth = 2 }

/U/ { dx =  0; dy =  1 }
/D/ { dx =  0; dy = -1 }
/R/ { dx =  1; dy =  0 }
/L/ { dx = -1; dy =  0 }

{
  count = $2
  for (j = 0; j < count; j++) {
    lx = x[0] += dx
    ly = y[0] += dy

    for (i = 1; i < depth; i++) {
      diffx = lx - x[i]
      diffy = ly - y[i]
      diff_gt_2 = abs(diffx) > 1 || abs(diffy) > 1
      lx = x[i] += sign(diffx) * diff_gt_2
      ly = y[i] += sign(diffy) * diff_gt_2
    }

    if (!visited[lx,ly]) visit_count++
    visited[lx,ly]++
  }
}

END { print visit_count }

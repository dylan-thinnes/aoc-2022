#!/usr/bin/env -S awk -f
/A X/ { t += 3 }
/A Y/ { t += 4 }
/A Z/ { t += 8 }
/B X/ { t += 1 }
/B Y/ { t += 5 }
/B Z/ { t += 9 }
/C X/ { t += 2 }
/C Y/ { t += 6 }
/C Z/ { t += 7 }
END { print t }

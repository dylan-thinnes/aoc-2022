#!/usr/bin/env -S awk -f
/A X/ { t += 4 }
/A Y/ { t += 8 }
/A Z/ { t += 3 }
/B X/ { t += 1 }
/B Y/ { t += 5 }
/B Z/ { t += 9 }
/C X/ { t += 7 }
/C Y/ { t += 2 }
/C Z/ { t += 6 }
END { print t }

mkdir -p fs
cd fs

tail -n+2 | while read line; do
  set -- $line
  case "$line" in
    *" cd "*)
      mkdir -p $3
      cd $3
      ;;
    "$ ls")
      ;;
    "dir "*)
      ;;
    *)
      echo "$line $2 $1"
      dd if=/dev/zero of=$2 bs=$1 count=1
      ;;
  esac
done

find -type d -exec sh -c 'du -bc $(find {} -type f)' \; |\
  grep total | cut -f1 |\
  grep -E '^(100000|[0-9]{1,5})$' |\
  (tr '\n' +; echo 0) | bc

rm -r fs

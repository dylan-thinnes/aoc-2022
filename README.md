Advent of Code, 2022

# aoc-2022
Advent of Code, 2022

These are my advent of code solutions.
In the same way as [last year](https://github.com/dylan-thinnes/aoc-2021) and
[the year before that](https://github.com/dylan-thinnes/aoc-2020), I do every
day in a different language.

## Rules

1. Must do all days in different languages, except those days which continue
   from other days' solutions (e.g. IntCode computer, 2019)
2. If I do a day in multiple different languages, I can "pick" the language for
   that day, as long as the resulting picks adhere to rule 1.
3. If I wish to use a language that I have already used, I can go back and redo
   the day that language was previously used for (in a different language),
   thus freeing it up for the new day.
4. Languages cannot be too similar, keeping in spirit of the rules (e.g.
   bash/zsh, typescript/javascript, haskell/purescript [controversial, I know])
5. I may write preprocessors to transform the input into something palatable to
   the language, but generally this is discouraged.

## Summary (spoilers!)

Languages and solutions so far can be got by running `./summarize`.

```
        |1|2|3|4|
awk     |█|█|█| |
dc      |█| | | |
forth   | |█| | |
haskell | |█| | |
perl    | | | |█|
sed     | | |█| |
sh      |█|█| | |
```

In my summaries, I will go over the solutions I find more interesting, rather
than detailing each language for each day.

### Day 1: Awk

Day 1 was in Awk, which is a pretty decent language for this sort of thing -
running totals and matching on empty lines is a breeze, letting me write a
solution with no overhead.

### Day 2: Forth

Forth is a really fun fit. We can create 6 functions, A B C and X Y Z, and then
evaluate the input as code!

### Day 3: Sed

Writing a solution in GNU Sed is tough, but still fun - one can think of it as
an [L-system](https://en.wikipedia.org/wiki/L-system) with a few bells and
whistles. Since it just rewrites strings, we have to reimplement addition via
carries, and splitting a string into two pieces is actually the most
complicated part.

### Day 4: Perl

Perl has excellent matching utilities, and with the -n flag and END blocks, it
can behave like a sophisticated form of Awk. Perl is probably the first "real"
language I've used as my primary for a day.

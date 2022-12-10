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
          |1|2|3|4|5|6|7|
awk       |█|█|█| | | | |
brainfuck | | | | | |█| |
dc        |█| | | | | | |
forth     | |█| | | | | |
haskell   | |█| | | | | |
perl      | | | |█| | | |
sed       | | |█| | | | |
sh        |█|█| | | | |█|
vim       | | | | |█| | |
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

### Day 5: Vim Macros

No vimscript, just vim macros. The core of this solution is the `*` key - using
it, we can implement branching, which can be coupled with macros to make a
fairly turing complete system. I learned a lot about how to break out of
macros, and wrote some truly ugly, unreadable line noise to boot. All in all a
good day.

### Day 6: Brainfuck

An ideal day for brainfuck: a growing stack and a fixed-size state within that
stack. Still extremely slow, of course.

### Day 7: Bash

Why not simulate a shell in a shell? I feel a bit icky about the amount of
logic in the awk component for part 2, but a trick using `bc` would be no
better.

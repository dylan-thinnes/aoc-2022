module Main where

main = interact $ show . sum . map (score . map convert) . lines

data Throw = Rock | Paper | Scissors
  deriving (Show, Eq, Ord, Enum)

score [opp, _, self] = value self + self `against` opp

convert 'A' = Rock
convert 'B' = Paper
convert 'C' = Scissors

convert 'X' = Rock
convert 'Y' = Paper
convert 'Z' = Scissors

against Paper Rock = 6
against Scissors Paper = 6
against Rock Scissors = 6
against x y
  | x == y = 3
  | otherwise = 0

value Rock = 1
value Paper = 2
value Scissors = 3

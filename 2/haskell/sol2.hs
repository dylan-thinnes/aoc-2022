module Main where

main = interact $ show . sum . map score . lines

data Throw = Rock | Paper | Scissors
  deriving (Show, Eq, Ord, Enum)

score [oppCode, _, outcome] =
  let opp = convert oppCode
      self = rotateWith outcome opp
  in
  value self + self `against` opp

convert 'A' = Rock
convert 'B' = Paper
convert 'C' = Scissors

rotateWith 'X' throw = toEnum $ (fromEnum throw + 2) `mod` 3
rotateWith 'Y' throw = throw
rotateWith 'Z' throw = toEnum $ (fromEnum throw + 1) `mod` 3

against Paper Rock = 6
against Scissors Paper = 6
against Rock Scissors = 6
against x y
  | x == y = 3
  | otherwise = 0

value Rock = 1
value Paper = 2
value Scissors = 3

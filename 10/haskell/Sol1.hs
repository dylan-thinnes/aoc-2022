import Control.Monad

main = interact $ show . f . concatMap parse . lines

parse :: String -> [Int]
parse ('a':'d':'d':'x':' ':rest) = [0,read rest]
parse _ = [0]

f :: [Int] -> Int
f inps = sum $ do
  (ii, val) <- [1..] `zip` scanl (+) 1 inps
  guard $ ii `mod` 40 == 20
  pure $ ii * val

import Control.Monad

main = interact $ f . concatMap parse . lines

parse :: String -> [Int]
parse ('a':'d':'d':'x':' ':rest) = [0,read rest]
parse _ = [0]

f :: [Int] -> String
f inps = do
  (ii, val) <- [1..] `zip` scanl (+) 1 inps
  let nl = ['\n' | ii `mod` 40 == 0]
  let insight = (val - (ii - 1) `mod` 40) `elem` [-1,0,1]
  (if insight then "#" else " ") ++ nl

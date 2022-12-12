{-# LANGUAGE MultiWayIf #-}

import qualified Data.Set as S
import Data.List

main = interact $ f . map parse . lines

data Dir = U | R | D | L
type Position = (Int, Int)
type State = [Position]

next :: Dir -> State -> State
next d (x:rest) = scanl synchronize (apply d x) rest

apply :: Dir -> Position -> Position
apply U (x, y) = (x, y + 1)
apply R (x, y) = (x + 1, y)
apply D (x, y) = (x, y - 1)
apply L (x, y) = (x - 1, y)

synchronize :: Position -> Position -> Position
synchronize h@(hx, hy) t@(tx, ty) =
  let dx = hx - tx
      dy = hy - ty
  in
  if | abs dx `elem` [0,1] && abs dy `elem` [0,1]
     -> (tx, ty)
     | abs dx /= 0 && abs dy == 0
     -> (tx + dx - signum dx, ty)
     | abs dx == 0 && abs dy /= 0
     -> (tx, ty + dy - signum dy)
     | abs dx >= 2, abs dy >= 2
     -> (tx + dx - signum dx, ty + dy - signum dy)
     | abs dx >= 2
     -> (tx + dx - signum dx, ty + dy)
     | abs dy >= 2
     -> (tx + dx, ty + dy - signum dy)

parse :: String -> (Dir, Int)
parse ('U':_:str) = (U, read str)
parse ('R':_:str) = (R, read str)
parse ('D':_:str) = (D, read str)
parse ('L':_:str) = (L, read str)

dedupe :: Eq a => [a] -> [a]
dedupe (x:xs) = x : go x xs
  where
    go x (y:ys)
      | x == y = go x ys
      | otherwise = y : go y ys
    go _ [] = []

f :: [(Dir, Int)] -> String
f inputs = show $ S.size $ S.fromList $ map last $ scanl (\state dir -> next dir state) (replicate 10 (0,0)) $ concatMap (uncurry $ flip replicate) inputs
  {-
f inputs = print $ dedupe $ map last $ scanl (\state dir -> next dir state) (replicate 10 (0,0)) $ concatMap (uncurry $ flip replicate) inputs
  where
  print poses =
    let minx = minimum $ fst <$> poses
        maxx = maximum $ fst <$> poses
        miny = minimum $ snd <$> poses
        maxy = maximum $ snd <$> poses
    in
    unlines
      [ [ if (x, y) `elem` poses then '#' else '.' | x <- [minx..maxx] ]
      | y <- [maxy,maxy-signum maxy..miny]
      ]
f inputs = unlines $ map print $ scanl (\state dir -> next dir state) (replicate 10 (0,0)) $ concatMap (uncurry $ flip replicate) inputs
  where
  print poses =
    let minx = 0
        maxx = 4
        miny = 0
        maxy = 4
    in
    unlines
      [ [ maybe '.' (head . show) (elemIndex (x, y) poses) | x <- [minx..maxx] ]
      | y <- [maxy,maxy-signum maxy..miny]
      ]
  -}

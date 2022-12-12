{-# LANGUAGE MultiWayIf #-}

import qualified Data.Set as S

main = interact $ show . f . map parse . lines

data Dir = U | R | D | L
data State = State { h :: (Int, Int), t :: (Int, Int) }
  deriving (Show, Eq, Ord)

apply :: Dir -> State -> State
apply dir state = state { h = go dir (h state) }
  where
  go U (x, y) = (x, y + 1)
  go R (x, y) = (x + 1, y)
  go D (x, y) = (x, y - 1)
  go L (x, y) = (x - 1, y)

synchronize :: State -> State
synchronize state@State { h = (hx, hy), t = (tx, ty) } =
  let dx = hx - tx
      dy = hy - ty
      t' =
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
  in
  state { t = t' }

parse :: String -> (Dir, Int)
parse ('U':_:str) = (U, read str)
parse ('R':_:str) = (R, read str)
parse ('D':_:str) = (D, read str)
parse ('L':_:str) = (L, read str)

f :: [(Dir, Int)] -> Int
f inputs = S.size $ S.fromList $ map t $ scanl (\state dir -> synchronize $ apply dir state) (State (0,0) (0,0)) $ concatMap (uncurry $ flip replicate) inputs

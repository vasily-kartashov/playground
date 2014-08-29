module Problem081 where

import Data.Function
import Data.List (delete, intersect, map, minimumBy)
import Data.Map ((!), empty, insert, insertWith, member, Map)

type Node = (Int, Int)
type Matrix = [[Int]]

readMatrix :: String -> Matrix
readMatrix = map (\s -> read ("[" ++ s ++ "]")) . lines

neighbours :: Node -> [Node]
neighbours (i, j) = [(i + 1, j), (i, j + 1)]

main = do
  s <- readFile "problem-081.txt"
  let m = readMatrix s
  print $ dijkstra m neighbours

dijkstra :: Matrix -> (Node -> [Node]) -> Int
dijkstra m n = iter vs0 qs0
  where weight (i, j) = m !! i !! j
        penalty = sum (map sum m)
        corner = (length m - 1, length (m !! 0) - 1)
        qs0 = [(i, j) | i <- [0 .. fst corner], j <- [0 .. snd corner]]
        vs0 = insert (0, 0) (weight (0, 0)) empty
        iter vs [] = vs ! corner
        iter vs qs = let distance i = if i `member` vs then vs ! i else penalty
                         u = minimumBy (compare `on` distance) qs
                         d = distance u
                         ns = (neighbours u) `intersect` qs
                         qs' = u `delete` qs
                         vs' = foldl (\m v -> insertWith min v (weight v + d) m) vs ns in
                     iter vs' qs'


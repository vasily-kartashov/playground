module Problem079 where

import Data.Char
import Data.List

main = do
  s <- readFile "problem-079.txt"
  let es = edges s
  let vs = vertices s
  print $ head $ generate es vs

edges = nub . concatMap e . lines
  where e l = let l' = map digitToInt l in
              zipWith (,) l' (tail l')

vertices = nub . concat . (map . map) digitToInt . lines

generate es vs = filter (\p -> null (vs \\ p)) $ expand es ps
  where ps = map (\v -> [v]) (vs \\ map snd es)
        expand es ps = ps ++ expand es (concatMap cont ps)
          where cont p = [ p ++ [b] | (a, b) <- es, a == last p]

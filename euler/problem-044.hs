module Problem044 where

import qualified Data.Set as Set

main =
  print $ head $ concatMap check $ map fst pents 

check d = [(c, x, d) | c <- cs,
                       let x = c + d,
                       let y = x + c,
                       isPent x && isPent y]
  where cs = map fst $ takeWhile (\i -> snd i <= d) pents

isPent = (`Set.member` Set.fromAscList (map fst pents))

pents = map (\n -> (n * (3 * n - 1) `div` 2, 3 * n + 1)) [1..10000]



module Problem044 where

import qualified Data.Set as Set

main =
  print $ concatMap check $ map fst pents 

check d = [(fst c, d) | c <- takeWhile (\i -> snd i <= d) pents,
                        let x = (fst c) + d,
                        let y = x + d,
                        isPent x && isPent y]

isPent = (`Set.member` Set.fromList (map fst pents))

pents = map (\n -> (n * (3 * n - 1) `div` 2, 3 * n + 1)) [1..5000]



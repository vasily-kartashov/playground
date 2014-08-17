module Problem061 where 

import Data.List

main = 
  print $ concatMap evolve (permutations pairs)

pairs :: [[(Int, Int)]]
pairs = map f [ (\n -> n * (n + 1) `div` 2)
              , (\n -> n * n)
              , (\n -> n * (3 * n - 1) `div` 2)
              , (\n -> n * (2 * n - 1))
              , (\n -> n * (5 * n - 3) `div` 2)
              , (\n -> n * (3 * n - 2))
              ]
  where f gen = map (`quotRem` 100) $ takeWhile (< 10000) $ dropWhile (< 1000) $ map gen [1 ..]

evolve (p:ps) = evolve' ms ps
  where ms = map (\i -> [fst i, snd i]) p
        evolve' ms (p:ps) = evolve' [m ++ [snd n] | m <- ms, n <- p, last m == fst n] ps
        evolve' ms [] = filter (\m -> head m == last m) ms


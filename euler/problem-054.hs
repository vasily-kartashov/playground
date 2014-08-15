module Problem054 where

import Data.Char
import Data.List

main = do
  c <- readFile "problem-054.txt"
  let hands = map readHands $ lines c
  print $ sum [1 | (a, b) <- hands, rank a > rank b]

rank cards = rank' : concat groups
  where groups = group' cards
        values = sort $ map fst $ cards
        highestValue = last values
        flash = same $ map snd cards
        straight = map (subtract (head values)) values == [0 .. 4]
        group1size = length (groups !! 0)
        group2size = length (groups !! 1)
        rank'
          | straight && flash && highestValue == 14 = 9
          | straight && flash                       = 8
          | group1size == 4                         = 7
          | group1size == 3 && group2size == 2      = 6
          | flash                                   = 5
          | straight                                = 4
          | group1size == 3                         = 3
          | group1size == 2 && group2size == 2      = 2
          | group1size == 2                         = 1
          | otherwise                               = 0

readHands line = (map card as, map card bs)
  where ws = words line
        as = take 5 ws
        bs = drop 5 ws
        card (v:s:[])
          | v == 'T'  = (10, s)
          | v == 'J'  = (11, s)
          | v == 'Q'  = (12, s)
          | v == 'K'  = (13, s)
          | v == 'A'  = (14, s)
          | otherwise = (digitToInt v, s)
        

group' = (sortBy f) . group . sort . (map fst)
  where f a b = case compare (length b) (length a) of
                  EQ -> compare (head b) (head a)
                  LT -> LT
                  GT -> GT

same [] = True
same (a:as) = all (== a) as

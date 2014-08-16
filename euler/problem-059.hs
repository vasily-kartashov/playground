module Problem059 where

import Data.Bits
import Data.Char
import Data.List

main = do
  t <- readFile "problem-059.txt"
  let cs = read ("[" ++ t ++ "]") :: [Int]
  let key = findKey cs
  print $ map chr key
  print $ map chr $ decrypt cs key
  print $ sum $ decrypt cs key

findKey cs = snd $ foldl1' min [(d, key) | a <- ['a' .. 'z'], b <- ['a' .. 'z'], c <- ['a' .. 'z'],
                                           let key = map ord [a, b, c],
                                           let cs' = decrypt cs key,
                                           let d = distance freq (stat cs')]

-- http://en.wikipedia.org/wiki/Letter_frequency
freq = [ ('a', 0.08167)
       , ('b', 0.01492)
       , ('c', 0.02782)
       , ('d', 0.04253)
       , ('e', 0.13000)
       , ('f', 0.02228)
       , ('g', 0.02015)
       , ('h', 0.06094)
       , ('i', 0.06966)
       , ('j', 0.00153)
       , ('k', 0.00772)
       , ('l', 0.04025)
       , ('m', 0.02406)
       , ('n', 0.06749)
       , ('o', 0.07507)
       , ('p', 0.01929)
       , ('q', 0.00095)
       , ('r', 0.05987)
       , ('s', 0.06327)
       , ('t', 0.09056)
       , ('u', 0.02758)
       , ('v', 0.00978)
       , ('w', 0.02360)
       , ('x', 0.00150)
       , ('y', 0.01974)
       , ('z', 0.00074)
       ]

distance = distance' 0.0
  where distance' n [] _ = n
        distance' n _ [] = n
        distance' n (a:as) (b:bs)
          | fst a < fst b = distance' n as (b:bs)
          | fst a > fst b = distance' n (a:as) bs
          | otherwise = distance' (n + (snd a - snd b) ^ 2) as bs      

stat cs = map (\g -> (head g, fromIntegral (length g) / fromIntegral n)) $ group cs'
  where cs' = sort $ map (toLower . chr) cs 
        n = length cs'        

decrypt cs ks = zipWith xor cs (cycle ks)

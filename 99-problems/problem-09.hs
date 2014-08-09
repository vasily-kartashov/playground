module Problem09 where

main =
  print $ pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 
                'a', 'd', 'e', 'e', 'e', 'e']

pack [] = []
pack (a:as) = pack' as [a]
  where pack' [] gs = [gs]
        pack' (a:as) g'@(g:gs)
          | a == g    = pack' as (a:g')
          | otherwise = g' : pack' as [a]



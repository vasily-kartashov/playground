module Problem19 where

main = do
  putStrLn $ show $ rotate ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] 3
  putStrLn $ show $ rotate ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] (-2)

rotate as n = ys ++ xs
  where n' = if n < 0 then (length as + n) else n
        (xs, ys) = split as n'

split [] _ = error "Empty list"
split as 0 = ([], as)
split (a:as) n = (a:xs, ys)
  where (xs, ys) = split as (n - 1)

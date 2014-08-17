module Problem066 where

main =
  print $ maximum [(pell n, n) | n <- [1 .. 1000]]

pell n
  | s * s == n = 0
  | otherwise = pell' (0, 1, s) (s, 1) (1, 0)
  where s = sqrt' n
        pell' (m, d, a) (n0, n1) (d0, d1)
          | n0 * n0 - n * d0 * d0 == 1 = abs n0
          | otherwise = let m' = d * a - m
                            d' = (n - m' * m') `div` d
                            a' = (s + m') `div` d'
                            n0' = a' * n0 + n1
                            d0' = a' * d0 + d1 in
                        pell' (m', d', a') (n0', n0) (d0', d0)

sqrt' = round . sqrt . fromIntegral

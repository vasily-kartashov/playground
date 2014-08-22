module Problem071 where

data Ratio = Ratio Int Int

instance Eq Ratio where
  (Ratio a b) == (Ratio c d) = (a * d) == (b * c)

instance Ord Ratio where
  (Ratio a b) `compare` (Ratio c d) = (b * c) `compare` (a * d)

instance Show Ratio where
  show (Ratio a b) = show (a `div` f) ++ "/" ++ show (b `div` f)
                     where f = gcd a b

main = 
  print $ minimum $ filter (> x) $ map (nom x) [2 .. (10 ^ 6)] 
  where x = Ratio 3 7

nom :: Ratio -> Int -> Ratio
nom (Ratio a b) q = let p = (a * q - 1) `div` b in Ratio p q


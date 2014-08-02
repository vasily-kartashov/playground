module Problem019 where

main =
  print $ length $ f (Day 1 1 1901 1) []
    where f day@(Day d m y w) c
             | d == 1 && m == 1 && y == 2000  = c
             | d == 1 && w == 7                = f (next day) (day:c)
             | otherwise                       = f (next day) c

data Day d = Day { day :: Int
                 , month :: Int
                 , year :: Int
                 , dayOfWeek :: Int 
                 } deriving (Show)
 
next (Day d m y w)
  | d == 30 && (m == 4 || m == 6 || m == 9 || m == 11)                     = Day 1 (m + 1) y w'
  | d == 31 && (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10) = Day 1 (m + 1) y w'
  | d == 31 && m == 12                                                     = Day 1 1 (y + 1) w'
  | d == 28 && m == 2 && not (leap y)                                      = Day 1 3 y w'
  | d == 29 && m == 2                                                      = Day 1 3 y w'
  | otherwise                                                              = Day (d + 1) m y w'
  where w' = w `mod` 7 + 1
        leap y
          | y `rem`   4 /= 0 = False
          | y `rem` 100 /= 0 = True
          | y `rem` 400 /= 0 = False
          | otherwise        = True

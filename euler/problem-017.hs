module Problem017 where

import Data.Char (digitToInt, isLetter)

main =
  print $ sum $ map (length' . spell) [1..1000]

length' = length . filter isLetter

spell n
  | n ==    1                    = "one"
  | n ==    2                    = "two"
  | n ==    3                    = "three"
  | n ==    4                    = "four"
  | n ==    5                    = "five"
  | n ==    6                    = "six"
  | n ==    7                    = "seven"
  | n ==    8                    = "eight"
  | n ==    9                    = "nine"
  | n ==   10                    = "ten"
  | n ==   11                    = "eleven"
  | n ==   12                    = "tvelve"
  | n ==   13                    = "thirteen"
  | n ==   14                    = "fourteen"
  | n ==   15                    = "fifteen"
  | n ==   16                    = "sixteen"
  | n ==   17                    = "seventeen"
  | n ==   18                    = "eighteen"
  | n ==   19                    = "nineteen"
  | n ==   20                    = "twenty"
  | n ==   30                    = "thirty"
  | n ==   40                    = "forty"
  | n ==   50                    = "fifty"
  | n ==   60                    = "sixty"
  | n ==   70                    = "seventy"
  | n ==   80                    = "eighty"
  | n ==   90                    = "ninety"
  | n == 1000                    = "one thousand"
  | n < 1000 && n `mod` 100 == 0 = spell h ++ " hundred"
  | 100 < n && n < 1000          = spell h ++ " hundred and " ++ spell (n - 100 * h)
  |  19 < n && n <  100          = spell (10 * h) ++ " " ++ spell (n - 10 * h)                                     
  where h  = digitToInt . head . show $ n

module Problem036 where 

import Data.Char
import Numeric

main =
  print $ sum $ [x | x <- [1, 3 .. 1000000], isPalindrome (show x), isPalindrome (show2 x)]

show2 = flip (showIntAtBase 2 intToDigit) ""

isPalindrome x = x == reverse x

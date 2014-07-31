module Problem004 where

main = 
    print $ maximum [p | x <- [100..999], y <- [100..999], let p = x * y, let s = show p, s == reverse s]

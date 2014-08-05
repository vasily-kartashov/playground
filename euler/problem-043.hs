module Problem043 where

import Data.List

main = do
  putStrLn $ show ns
  putStrLn $ show $ sum ns
  where ns = map (read . fst) $ foldl (\s d -> concatMap (evolve d) s) start [13, 11, 7, 5, 3, 2, 1]

evolve d (s, cs) = [(s', cs') | c <- cs, 
                                let s' = (c:s), 
                                read (take 3 s') `rem` d == 0, 
                                let cs' = delete c cs] 

start = map (compl . pad) $ filter unique $ map show $ takeWhile (< 1000) $ map (17 *) [1..]
  where unique s = length s == length (nub s)
        compl s = (s, ['0'..'9'] \\ s)
        pad s = if length s < 3 then ('0' : s)
                                else s


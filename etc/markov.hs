module Main where

import qualified Control.Monad.Random as R
import qualified Data.List as L
import qualified Data.Map as M

type TransitionMap = M.Map (String, String) Rational
type MarkovChain = M.Map String [(String, Rational)]

addTransition :: TransitionMap -> (String, String) -> TransitionMap
addTransition m k = M.insertWith (+) k 1 m

fromTransitionMap :: TransitionMap -> MarkovChain
fromTransitionMap m =
  M.fromList [(k, frequencies k) | k <- ks]
  where ks = L.nub $ map fst $ M.keys m
        frequencies a = map reduce $ filter (outboundFor a) $ M.toList m
        outboundFor a k = fst (fst k) == a
        reduce e = (snd (fst e), snd e)

generateSequence :: (R.MonadRandom m) => MarkovChain -> String -> m String
generateSequence m s
  | not (null s) && last s == '.' = return s
  | otherwise = do
                s' <- R.fromList $ m M.! s
                ss <- generateSequence m s'
                return $ if null s then ss else s ++ " " ++ ss

fromSample :: [String] -> MarkovChain
fromSample ss = fromTransitionMap $ foldl addTransition M.empty $ concatMap pairs ss
  where pairs s = let ws = words s in zipWith (,) ("":ws) ws

sample :: [String]
sample = [ "I am a monster."
         , "I am a rock star."
         , "I want to go to Hawaii."
         , "I want to eat a hamburger."
         , "I have a really big headache."
         , "Haskell  is a fun language."
         , "Go eat a big hamburger."
         , "Markov chains are fun to use."
         ]

main = do
  s <- generateSequence (fromSample sample) ""
  print s

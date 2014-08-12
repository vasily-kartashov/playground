{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import qualified Control.Monad.Random as R
import           Data.List (foldl')
import           Data.Hashable
import qualified Data.HashMap.Lazy as M
import           Data.Ratio
import qualified Data.Text as T
import           System.Random.Mersenne.Pure64

type MarkovI a = M.HashMap a (Maybe [(a, Rational)])

newtype Markov g a = Markov { getMarkov :: M.HashMap a (Maybe (R.Rand g a)) }

type Err = String
data Outcome g a = Error Err
                 | Val a g
                 | End
                   deriving (Show, Eq)

main :: IO ()
main = print 2

insertMarkovI :: (Hashable a, Eq a) => Rational -> a -> a -> MarkovI a -> MarkovI a
insertMarkovI r k v mv = M.insert k (Just e) mv
  where e = case M.lookup k mv of 
            Nothing -> [(v, r)]
            Just xs -> case xs of 
                       Nothing -> [(v, r)]
                       Just ys -> (v, r) : ys

insertEnd :: (Hashable a, Eq a) => a -> MarkovI a -> MarkovI a
insertEnd k = M.insert k Nothing

fromMarkovI :: R.RandomGen g => MarkovI a -> Markov g a
fromMarkovI = Markov . M.map (R.fromList <$>)

runMarkov1 :: (R.RandomGen g, Hashable a, Eq a) => Markov g a -> g -> a -> Outcome g a
runMarkov1 mv gen x = case M.lookup x (getMarkov mv) of
                      Nothing -> Error "Cannot find value"
                      Just rs -> case flip R.runRand gen <$> rs of
                                 Nothing -> End
                                 Just (a, g) -> Val a g

runMarkov :: (R.RandomGen g, Hashable a, Eq a) => Int -> Markov g a -> g -> a -> Either Err [a]
runMarkov n mv gen x = go n
  where go m
          | m <= 0 = Right []
          | otherwise = (x:) <$> case runMarkov1 mv gen x of
                                 Val a g -> runMarkov (n - 1) mv g a
                                 End -> Right []
                                 Error err -> Left err

fromList :: (Hashable a, Eq a, R.RandomGen g) => [(a, [(a, Rational)])] -> Markov g a
fromList = Markov . foldl' (flip $ uncurry ins) M.empty
  where ins a b m = case b of
                    [] -> M.insert a Nothing m
                    _ -> M.insert a (Just $ R.fromList b) m

insertMarkovPairsInto :: (Hashable a, Eq a) => MarkovI a -> [(a, a)] -> MarkovI a
insertMarkovPairsInto mv [] = mv
insertMarkovPairsInto mv ps = insertEnd lst $ foldl' (flip (uncurry (insertMarkovI 1))) mv ps
  where lst = snd $ last ps

wordPairs :: T.Text -> [(T.Text, T.Text)]
wordPairs = (zip <*> tail) . T.words

insertSentense :: MarkovI T.Text -> T.Text -> MarkovI T.Text
insertSentense mv = insertMarkovPairsInto mv . wordPairs

fromSentences :: R.RandomGen g => [T.Text] -> Markov g T.Text
fromSentences = fromMarkovI . foldl' insertSentense M.empty

runFromSentences :: Int -> [T.Text] -> IO (Either Err T.Text)
runFromSentences n sentences = do
  g <- newPureMT
  let hds = map (head . T.words) sentences
  seed <- R.uniform hds
  return $ T.unwords <$> runMarkov n (fromSentences sentences) g seed

test :: [T.Text]
test = [ "I am a monster."
       , "I am a rock star."
       , "I want to go to Hawaii."
       , "I want to eat a hamburger."
       , "I have a really big headache."
       , "Haskell is a fun language!"
       , "Go eat a big hamburger!"
       , "Markov chains are fun to use!"
       ]

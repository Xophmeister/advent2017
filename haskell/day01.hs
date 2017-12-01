module Day01 where

import Data.Char (digitToInt)

rotateList :: Int -> [a] -> [a]
rotateList _ [] = []
rotateList 0 l = l
rotateList offset (x:xs) = rotateList (offset - 1) (xs ++ [x])

inverseCaptcha :: Int -> String -> Int
inverseCaptcha offset string = 
  sum $ map (digitToInt . fst) $ filter matched $ zip string rotated
  where rotated = rotateList offset string
        matched (a, b) = a == b

rotateOne :: String -> Int
rotateOne = inverseCaptcha 1

rotateHalf :: String -> Int
rotateHalf = inverseCaptcha =<< flip div 2 . length

-- this computes projecteuler.net problem 022

import Data.Char
import Data.List

import System.IO

split :: String -> [String]
split "" = [""]
split (',':cs) = "" : split cs
split (c:cs) = (c:cellCompletion) : otherCells
 where cellCompletion : otherCells = split cs

count_chars :: String -> Int -> Int
count_chars [] ssum = ssum
count_chars (x:xs) ssum | x == '"' = count_chars xs ssum
count_chars (x:xs) ssum = count_chars xs ((ssum - 64) + ord x)

count_words :: [String] -> Int -> Int -> Int
count_words [] index ssum = ssum
count_words (x:xs) index ssum = count_words xs (index + 1) (ssum + ((index + 1) * (count_chars x 0)))

pe022 :: IO ()
pe022 = do
  fileHandle <- openFile "../names.txt" ReadMode
  contents <- hGetContents fileHandle
  let sorted = sort (split contents)
  print (count_words sorted 0 0)
  hClose fileHandle

main = pe022

-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- PreferOne

module PreferOne (makeMyReverse,
                  preferOne) where

import System.IO
import Data.List

import Unique

makeMyReverse :: String -> Int -> String -> String
makeMyReverse string n alphabet = ((reverse (take (n - 1) (reverse string))) ++ alphabet)

preferOne :: String -> Int -> String -> Int -> IO()
preferOne string n alphabet index
    | (length string) == ((length alphabet) ^ n) = putStrLn string
    | otherwise = if ((length alphabet) - 1) == index then do
                    preferOne (string ++ [(alphabet !! index)]) n alphabet 0
                    else if myUniqueBool string (makeMyReverse string n [(alphabet !! index)]) (length string) n == True
                        then preferOne string n alphabet (index + 1)
                        else preferOne (string ++ [(alphabet !! index)]) n alphabet 0

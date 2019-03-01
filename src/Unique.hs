-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Unique

module Unique (myUnique,
               myUniqueBool) where

import Data.List
import Utils

myUnique :: String -> String -> Int -> String -> IO()
myUnique a b 0 alphabet = if myAlpha alphabet a && myAlpha alphabet b then putStrLn "OK" else putStrLn "KO"
myUnique a b c alphabet = if a == b then putStrLn "KO"
                else myUnique a (last b : init b) (c - 1) alphabet

myUniqueBool :: String -> String -> Int -> Int -> Bool
myUniqueBool a b 0 n = False
myUniqueBool a b c n = if (take n a) == b then True
                        else myUniqueBool (last a : init a) b (c - 1) n

-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Unique

module Unique (myUnique,
               myUniqueBool) where

import Data.List

myUnique :: String -> String -> Int -> IO()
myUnique a b 0 = putStrLn "OK"
myUnique a b c = if a == b then putStrLn "KO"
                else myUnique a (last b : init b) (c - 1)

myUniqueBool :: String -> String -> Int -> Int -> Bool
myUniqueBool a b 0 n = False
myUniqueBool a b c n = if (take n a) == b then True
                        else myUniqueBool (last a : init a) b (c - 1) n

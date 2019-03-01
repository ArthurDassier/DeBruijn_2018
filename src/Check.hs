-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Check

module Check (myCheck,
              myCheckBool) where

import Data.List

myCheck :: String -> Int -> [String] -> Int -> IO()
myCheck string a tab 0 = putStrLn "OK"
myCheck string a tab c = if find (== (take a string)) tab == Nothing then do
                            myCheck (last string : init string) a ((take a string) : tab) (c - 1)
                            else putStrLn "KO"

myCheckBool :: String -> Int -> [String] -> Int -> Bool
myCheckBool string a tab 0 = True
myCheckBool string a tab c = if find (== (take a string)) tab == Nothing then do
                                myCheckBool (last string : init string) a ((take a string) : tab) (c - 1)
                                else False
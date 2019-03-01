-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Check

module Check (myCheck,
              myCheckBool) where

import Data.List
import Utils

myCheck :: String -> Int -> [String] -> Int -> String -> IO()
myCheck string a tab 0 alphabet = if myAlpha alphabet string then putStrLn "OK" else putStrLn "KO"
myCheck string a tab c alphabet = if find (== (take a string)) tab == Nothing then do
                                    myCheck (last string : init string) a ((take a string) : tab) (c - 1) alphabet
                                    else putStrLn "KO"

myCheckBool :: String -> Int -> [String] -> Int -> String -> Bool
myCheckBool string a tab 0 alphabet = if myAlpha alphabet string then True else False
myCheckBool string a tab c alphabet = if find (== (take a string)) tab == Nothing then do
                                        myCheckBool (last string : init string) a ((take a string) : tab) (c - 1) alphabet
                                        else False
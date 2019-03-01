-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Calculs

module Calculs (myUnique,
                myUniqueN,
                makeMyReverse,
                preferOne,
                myCheck,
                rInt,
                myFill) where

import System.Console.GetOpt
import System.Environment
import System.Exit
import System.IO

import Debug.Trace
import Data.Char
import Data.List

import Control.Monad
import Text.Printf

myUnique :: String -> String -> Int -> IO()
myUnique a b 0 = putStrLn "OK"
myUnique a b c = if a == b then putStrLn "KO"
                else myUnique a (last b : init b) (c - 1)

myUniqueN :: String -> String -> Int -> Int -> Bool
myUniqueN a b 0 n = False
myUniqueN a b c n = if (take n a) == b then True
                        else myUniqueN (last a : init a) b (c - 1) n

makeMyReverse :: String -> Int -> String -> String
makeMyReverse string n alphabet = ((reverse (take (n - 1) (reverse string))) ++ alphabet)

preferOne :: String -> Int -> String -> Int -> IO()
preferOne string n alphabet index
    | (length string) == ((length alphabet) ^ n) = putStrLn string
    | otherwise = if ((length alphabet) - 1) == index then do
                    preferOne (string ++ [(alphabet !! index)]) n alphabet 0
                    else if myUniqueN string (makeMyReverse string n [(alphabet !! index)]) (length string) n == True
                        then preferOne string n alphabet (index + 1)
                        else preferOne (string ++ [(alphabet !! index)]) n alphabet 0

myCheck :: String -> Int -> [String] -> Int -> IO()
myCheck string a tab 0 = putStrLn "OK"
myCheck string a tab c = if find (== (take a string)) tab == Nothing then do
                            myCheck (last string : init string) a ((take a string) : tab) (c - 1)
                            else putStrLn "KO"

rInt :: String -> Int
rInt = read

myFill :: Int -> String -> String
myFill 1 string = string
myFill a string = myFill (a - 1) (string ++ [(head string)])

-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Unique

module Clean (ultimateUnique) where

import Check
import Unique

import Data.List
import Debug.Trace

myCheckPartout :: [String] -> Int -> Int -> Int -> String -> [String] -> [String]
myCheckPartout list 0 nb max alphabet final = final
myCheckPartout list len nb max alphabet final = do
    if myCheckBool (head list) nb [] max alphabet == True
        then do
            myCheckPartout (tail list) (len - 1) nb max alphabet (final ++ [(head list)])
        else myCheckPartout (tail list) (len - 1) nb max alphabet final

myUniquePartout :: [String] -> Int -> Int -> Int -> String -> [String] -> [String]
myUniquePartout [] len nb max alphabet final = []
myUniquePartout list 0 nb max alphabet final = final
myUniquePartout list len nb max alphabet final = do
    if myUltimateUniqueBool (head list) (list !! 2) max alphabet == True
        then do
            myUniquePartout (tail list) (len - 1) nb max alphabet (final ++ [(head list)])
        else myUniquePartout (tail list) (len - 1) nb max alphabet final

ultimateUnique :: String -> [String] -> Int -> Int -> String -> IO()
ultimateUnique "END" list nb max alphabet = mapM_ putStrLn (myUniquePartout (myCheckPartout (tail list) ((length list) - 1) nb max alphabet []) (length list) nb max alphabet [])
ultimateUnique input list nb max alphabet = do
    user <- getLine
    ultimateUnique user (list ++ [input]) nb max alphabet
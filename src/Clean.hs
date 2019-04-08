-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Unique

module Clean (ultimateUnique) where

import Check
import Unique

import Data.List
import Debug.Trace

myCheckAll :: [String] -> Int -> Int -> Int -> String -> [String] -> [String]
myCheckAll [] len nb max alphabet final = final
myCheckAll list 0 nb max alphabet final = final
myCheckAll list len nb max alphabet final = do
    if myCheckBool (head list) nb [] max alphabet == True
        then do
            myCheckAll (tail list) (len - 1) nb max alphabet (final ++ [(head list)])
        else myCheckAll (tail list) (len - 1) nb max alphabet final

myUniqueAll :: [String] -> Int -> Int -> Int -> String -> [String] -> [String]
myUniqueAll [] len nb max alphabet final = final
myUniqueAll list 1 nb max alphabet final = (final ++ [(head list)])
myUniqueAll list len nb max alphabet final = do
    if myUltimateUniqueBool (head list) (list !! 1) max alphabet == True
        then do
            myUniqueAll (tail list) (len - 1) nb max alphabet (final ++ [(head list)])
        else myUniqueAll (tail list) (len - 1) nb max alphabet final

ultimateUnique :: String -> [String] -> Int -> Int -> String -> IO()
ultimateUnique "END" list nb max alphabet = do 
    let tmp = (myCheckAll (tail list) ((length list) - 1) nb max alphabet [])
    mapM_ putStrLn (myUniqueAll tmp ((length tmp) - 1) nb max alphabet [])
ultimateUnique input list nb max alphabet = do
    user <- getLine
    if user == "" then ultimateUnique user list nb max alphabet else ultimateUnique user (list ++ [input]) nb max alphabet

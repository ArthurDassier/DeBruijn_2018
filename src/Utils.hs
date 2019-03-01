-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Utils

module Utils (rInt,
              myAlpha,
              myFill,
              printHelp) where

import System.Exit

rInt :: String -> Int
rInt = read

myAlpha :: String -> String -> Bool
myAlpha alphabet string = if filter (\ x -> elem x alphabet) string == string && filter (\ x -> elem x string) alphabet == alphabet
                            then True
                            else False

myFill :: Int -> String -> String
myFill 1 string = string
myFill a string = myFill (a - 1) (string ++ [(head string)])


printHelp :: IO()
printHelp = do
    putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]"
    putStrLn ""
    putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
    putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
    putStrLn "\t--clean\t\tlist cleaning"
    putStrLn "\tn\t\torder of the sequence"
    putStrLn "\ta\t\talphabet [def: “01”]"
    exitWith (ExitFailure 84)

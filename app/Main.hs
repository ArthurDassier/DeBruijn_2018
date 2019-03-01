-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Main

module Main (main) where

import System.Console.GetOpt
import System.Environment
import System.Exit
import System.IO

import Debug.Trace
import Data.Char
import Data.List

import Control.Monad
import Text.Printf

import Calculs

data Flag
    = Check
    | Clean
    | Unique
    deriving (Eq,Ord,Enum,Show,Bounded)

flags =
    [Option [] ["check"] (NoArg Check) "check if check",
    Option [] ["clean"] (NoArg Clean) "check if clean",
    Option [] ["unique"] (NoArg Unique) "check if unique"
    ]


printHelp :: IO ()
printHelp = do
    putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]"
    putStrLn ""
    putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
    putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
    putStrLn "\t--clean\t\tlist cleaning"
    putStrLn "\tn\t\torder of the sequence"
    putStrLn "\ta\t\talphabet [def: “01”]"
    exitWith (ExitFailure 84)

main :: IO()
main = do
    av <- getArgs
    case getOpt Permute flags av of
        ([], [], []) -> printHelp
        ([], args, []) -> do
            if length args > 2 || length args < 1 then printHelp
                else if length args == 2 then do
                    preferOne (myFill (rInt (head args)) [(last (last args))]) (rInt (head args)) (last args) 0
                    else do
                        preferOne (myFill (rInt (head args)) "0") (rInt (head args)) "10" 0
        (flags, [], []) -> printHelp
        (flags, args, []) -> do
            if length args > 2 || length args < 1 then printHelp
                else if length args == 2 then case flags of
                    [Check] -> putStrLn "OK check"
                    [Unique] -> putStrLn "OK unique"
                    [Clean] -> putStrLn "OK clean"
                    else case flags of
                            [Check] -> myCheck "10111000" 3 [] 8
                            [Unique] -> do
                                a <- getLine
                                b <- getLine
                                myUnique a b (length a)
                            [Clean] -> putStrLn "OK clean"

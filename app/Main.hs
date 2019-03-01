-- EPITECH PROJECT, 2019
-- FUN_deBruijn_2019
-- File description:
-- Main

module Main (rInt,
             myFill,
             printHelp,
             main) where

import System.Console.GetOpt
import System.Environment
import System.Exit
import System.IO

import Debug.Trace
import Data.List

import Utils
import Check
import Unique
import PreferOne

data Flag
    = Check
    | Clean
    | Unique
    deriving (Eq,Ord,Enum,Show,Bounded)

flags =
    [Option [] ["check"] (NoArg Check) "check if check",
    Option [] ["clean"] (NoArg Clean) "check if clean",
    Option [] ["unique"] (NoArg Unique) "check if unique"]

main :: IO()
main = do
    av <- getArgs
    case getOpt Permute flags av of
        ([], [], []) -> printHelp
        ([], args, []) -> do
            if length args > 2 || length args < 1 then printHelp
                else if length args == 2 then do
                    preferOne (myFill (rInt (head args)) [(last (last args))]) (rInt (head args)) (last args) 0
                    exitWith ExitSuccess
                    else do
                        preferOne (myFill (rInt (head args)) "0") (rInt (head args)) "10" 0
                        exitWith ExitSuccess
        (flags, [], []) -> printHelp
        (flags, args, []) -> do
            if length args > 2 || length args < 1 then printHelp
                else if length args == 2 then case flags of
                    [Check] -> do
                        a <- getLine
                        myCheck a (rInt (head args)) [] ((length (last args)) ^ (rInt (head args))) (last args)
                        exitWith ExitSuccess
                    [Unique] -> do
                        a <- getLine
                        b <- getLine
                        myUnique a b ((length (last args)) ^ (rInt (head args))) (last args)
                        exitWith ExitSuccess
                    [Clean] -> do
                        putStrLn "OK clean"
                        exitWith ExitSuccess
                    else case flags of
                            [Check] -> do
                                a <- getLine
                                myCheck a (rInt (head args)) [] (2 ^ (rInt (head args))) "01"
                                exitWith ExitSuccess
                            [Unique] -> do
                                a <- getLine
                                b <- getLine
                                myUnique a b (2 ^ (rInt (head args))) "01"
                                exitWith ExitSuccess
                            [Clean] -> do
                                putStrLn "OK clean"
                                exitWith ExitSuccess

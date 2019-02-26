import System.Environment
import System.Exit
import Debug.Trace

myUnique :: String -> String -> Int -> IO()
myUnique a b 0 = putStrLn "OK"
myUnique a b c = if a == b then putStrLn "KO"
                else myUnique a (last b : init b) (c - 1)

myPrint :: Int -> IO()
myPrint a = print a

myPrintNul :: String -> IO()
myPrintNul a = print a

myUniqueN :: String -> String -> Int -> Int -> Bool
myUniqueN a b 0 n = False
myUniqueN a b c n = if (take n a) == b then True
                        else myUniqueN (last a : init a) b (c - 1) n

makeMyReverse :: String -> Int -> String -> String
makeMyReverse string n alphabet = ((reverse (take (n - 1) (reverse string))) ++ alphabet)

preferOne :: String -> Int -> String -> Int -> IO()
preferOne string n alphabet index
    | (length string) == ((length alphabet) ^ n) = putStrLn string
    | otherwise = if ((length alphabet) - 1) == index then preferOne (string ++ [(alphabet !! index)]) n alphabet 0
                    else if myUniqueN string (makeMyReverse string n [(alphabet !! index)]) (length string) n == True
                        then preferOne string n alphabet (index + 1)
                        else preferOne (string ++ [(alphabet !! index)]) n alphabet 0

rInt :: String -> Int
rInt = read

myFill :: Int -> String -> String
myFill 1 string = string
myFill a string = myFill (a - 1) (string ++ [(head string)])

myMain :: [String] -> IO()
myMain argv
    | argv == ["--unique"] = do
        a <- getLine
        b <- getLine
        myUnique a b (length a)
    | argv == ["--check"] = do
        putStrLn ""
    | argv == ["--clean"] = do
        putStrLn ""
    | (length argv) == 1 = do
        preferOne (myFill (rInt (head argv)) "0") (rInt (head argv)) "10" 0
    | (length argv) == 2 = do
        preferOne (myFill (rInt (head argv)) [(last (last argv))]) (rInt (head argv)) (last argv) 0
    | argv == [] = preferOne "000" 3 "01" 0

main = do
    argv <- getArgs
    myMain argv
            -- putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]"
            -- putStrLn ""
            -- putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
            -- putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
            -- putStrLn "\t--clean\t\tlist cleaning"
            -- putStrLn "\tn\t\torder of the sequence"
            -- putStrLn "\ta\t\talphabet [def: “01”]"

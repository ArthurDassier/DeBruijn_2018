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
    | (length string) == ((length alphabet) ^ n) = putStrLn (reverse string)
    | otherwise = if ((length alphabet) - 1) == index then preferOne (string ++ [(alphabet !! index)]) n alphabet 0
                    else if myUniqueN string (makeMyReverse string n [(alphabet !! index)]) (length string) n == True
                        then preferOne string n alphabet (index + 1)
                        else preferOne (string ++ [(alphabet !! index)]) n alphabet 0

main = do
    toto <- getArgs
    if toto == ["--check"] then do
        a <- getLine
        b <- getLine
        myUnique a b (length a)
        else do
            preferOne "000" 3 "10" 0
            -- putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]"
            -- putStrLn ""
            -- putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
            -- putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
            -- putStrLn "\t--clean\t\tlist cleaning"
            -- putStrLn "\tn\t\torder of the sequence"
            -- putStrLn "\ta\t\talphabet [def: “01”]"

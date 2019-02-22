import System.Environment
import System.Exit

myBaro :: String -> String -> Int -> IO()
myBaro [] [] _ = putStrLn "the fuck ?"
myBaro a b 0 = putStrLn "OK"
myBaro a b c = if a == b then putStrLn "KO"
                else myBaro a (last b : init b) (c - 1)

main = do
    toto <- getArgs
    if toto == ["--check"] then do
        a <- getLine
        b <- getLine
        myBaro a b (length a)
        else do
            putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]"
            putStrLn ""
            putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
            putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
            putStrLn "\t--clean\t\tlist cleaning"
            putStrLn "\tn\t\torder of the sequence"
            putStrLn "\ta\t\talphabet [def: “01”]"
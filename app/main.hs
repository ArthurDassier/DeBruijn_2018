import System.Environment
import System.Exit

main = do
    toto <- getArgs
    if toto == [] then do
            putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]"
            putStrLn ""
            putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
            putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
            putStrLn "\t--clean\t\tlist cleaning"
            putStrLn "\tn\t\torder of the sequence"
            putStrLn "\ta\t\talphabet [def: “01”]"
        else putStrLn "OK"

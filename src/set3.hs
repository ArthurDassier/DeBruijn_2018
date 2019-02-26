

import Data.Array
import Data.List(isInfixOf)

type Bit = Bool

preferOne :: Int -> IO()
preferOne n =
    let upB = 2^n
        arr = listArray (1, upB) (replicate n False ++ rest)

        -- since we use Bool for bits, we can say (not.alreadySeen):  
        rest = map (not . alreadySeen) [n+1 .. upB]
        alreadySeen i = or $
            do let range = [ arr!i' | i' <- [i-n+1 .. i-1]] ++ [True]
               i1 <- [1..i-n]
               let rangeP = [ arr!i' | i' <- [i1 .. i1+n-1] ]
               return (range == rangeP)
     -- an infinite stream is returned... because I can:   
     in cycle (elems arr)

main = do 
    preferOne 5
module Main where

import System.Environment   
import Data.List  

--Returns string with corrected syntax
syntaxCorrection :: [Char] -> [Char]
syntaxCorrection  x = ("'" ++ x ++ "',")

--Returns input list with last element omitted
pop :: [a] -> [a]
pop [] = []
pop xs = init xs

main :: IO ()
main = do
    --Get command line arguments
    [input_string] <- getArgs    
    --Split string by whitespace
    let l = words input_string
    --Modify each element to correct syntax e.g. 82886000 -> '82886000',
    let lsc = map syntaxCorrection l
    --Pop last element from list
    let lscwle = pop lsc
    --Print list with last element omitted
    mapM_ putStrLn lscwle
    --Pop last character of the last element in out syntax corrected list e.g. '82886000', -> '82886000'
    let le = pop (last lsc)
    --Print the corrected last element
    putStrLn le

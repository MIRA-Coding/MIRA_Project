module Main where

--OVERVIEW OF PROJECT: 
  --this project apply the haskell to perform the Luhn algorithm of validating the credit card number.

--toList FUNCTION__________________________
toList :: Integer -> [Integer]
toList num =
  if num <= 0 
  then []
  else toList (div num 10) ++ [mod num 10] 
  -- RECURSION: div pass num without last digit ++ (concatenation) % mod take the last num put it list [].
  
--doubleEverySecond FUNCTION_______________
doubleEverySecond :: [Integer] -> [Integer]
doubleEverySecond list = reverse (zipWith ($) (cycle [id, (*2)]) (reverse list))
  --zipWith: combain the [id, (*2)] with reverse list=> [unchanged,doubled,unchanged,...] list will generated.
  -- $ shortcut for function application.

--sumDigits FUNCTION_______________________
sumDigits :: [Integer] -> Integer
sumDigits numbers = sum (concatMap toList numbers) -- couse toList take one num so concatMap divide the list and send one by one element then combain every returned lists to one list 

--validate FUNCTION________________________
validate :: Integer -> Bool
validate card = 
  if mod (sumDigits (doubleEverySecond (toList card))) (10) == 0
  then True --sum of the doubled Second Element list % 10 == 0 because sum must end with 0 to be divisible by 10. 
  else False

main :: IO ()
main = do --here start run
  print (validate 3345675543133000)  -- this is True
  print (validate 4444455635362782)  -- this is False
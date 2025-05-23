-- Efficient power computation, basic idea: x²ᵏ = (x²)ᵏ

power :: Double -> Integer -> Double
power x k | k == 1    = x
          | even k    = power (x * x) (halve k)
          | otherwise = x * power (x * x) (halve k)
  where
    even n  = n `mod` 2 == 0
    halve n = n `div` 2

main :: IO ()
main = print $ power 2 16

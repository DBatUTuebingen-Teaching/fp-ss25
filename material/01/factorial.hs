-- n!
-- fac :: Integer -> Integer
-- fac n = if n <= 1 then 1 else n * fac (n - 1)

fac :: Integer -> Integer
fac n | n <= 1    = 1
      | otherwise = n * fac (n - 1)

main :: IO ()
main = print $ fac 10

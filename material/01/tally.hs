sum' :: [Integer] -> Integer
sum' xs | xs == []  = 0
        | otherwise = head xs + sum' (tail xs)

sum'' :: [Integer] -> Integer
sum'' []     = 0
sum'' (x:xs) = x + sum'' xs

main :: IO ()
main = print $ sum'' [1..100]

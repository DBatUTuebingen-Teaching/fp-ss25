import SetLanguageShallow1
-- import SetLanguageShallow2
-- import SetLanguageShallow2Card

-- The following is impossible
-- (since SetLanguageShallow1/2 do not export data constructor IS):
{-

union :: IntegerSet -> IntegerSet -> IntegerSet
union (IS xs) (IS ys) = IS (xs ++ ys)

union :: IntegerSet -> IntegerSet -> IntegerSet
union (IS f) (IS g) = IS (\y -> f y || g y)

-}

set12 :: IntegerSet
set12 = (((empty `insert` 3) `insert` 2) `delete` 3) `insert` 1

main :: IO ()
main = print $ set12 `member` 3

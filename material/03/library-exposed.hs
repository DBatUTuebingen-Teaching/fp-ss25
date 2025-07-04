import Data.List (nub)

-- A library of functions on integer sets,
-- implementation fully exposed

-----------------------------------------------------------------------

type IntegerSet = [Integer] -- unsorted, duplicates allowed

empty :: IntegerSet
empty = []

insert :: Integer -> IntegerSet -> IntegerSet
insert x xs = x:xs

delete :: Integer -> IntegerSet -> IntegerSet
delete x xs = filter (/= x) xs

(∊) :: Integer -> IntegerSet -> Bool
x ∊ xs = elem x xs

-----------------------------------------------------------------------

-- "Extending" the library, relying on the exposed
-- implementation.  Now we're doomed to stick the
-- list-based representation...

(⊆) :: IntegerSet -> IntegerSet -> Bool
xs ⊆ ys = all (\x -> x ∊ ys) xs

card :: IntegerSet -> Int
card xs = length (nub xs)

-----------------------------------------------------------------------
-- DSL programs below

s1, s2 :: IntegerSet
s1 = insert 1 (insert 2 (insert 3 empty))
s2 = foldr insert empty [1..10]

prog :: Bool
prog = s1 ⊆ s2

main :: IO ()
main = print $ prog

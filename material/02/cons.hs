-- Our own formulation of cons lists
data List a = Nil
            | Cons a (List a)
  deriving (Show)

-- Haskell's builtin type [a] and List a are isomorphic:
--         toList . fromList = id
--   and   fromList . toList = id
toList :: [a] -> List a
toList []     = Nil
toList (x:xs) = Cons x (toList xs)

fromList :: List a -> [a]
fromList Nil         = []
fromList (Cons x xs) = x:fromList xs



-- The family of well-known list functions (combinators) can be
-- reformulated for List a:
mapList :: (a -> b) -> List a -> List b
mapList f Nil         = Nil
mapList f (Cons x xs) = Cons (f x) (mapList f xs)


main :: IO ()
main = do
  print $ mapList odd $ toList [1..5]

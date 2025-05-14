-- A product type (single constructor)

data Sequence a = S Int [a]
  deriving (Eq, Show)

fromList :: [a] -> Sequence a
fromList xs = S (length xs) xs

(+++) :: Sequence a -> Sequence a -> Sequence a
S lx xs +++ S ly ys = S (lx + ly) (xs ++ ys)

len :: Sequence a -> Int
len (S l _) = l

main :: IO ()
main = print $ len (fromList ['a'..'m'] +++ fromList ['n'..'z'])

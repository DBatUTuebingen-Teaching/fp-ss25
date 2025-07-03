-- A deep embedding of simple Boolean expressions with variables
data Pred i a = T                         -- true
              | F                         -- false
              | Var i a                   -- variable (position in environment + name)
              | And (Pred i a) (Pred i a) -- ∧
              | Or (Pred i a) (Pred i a)  -- ∨
  deriving (Eq, Show)

-- Evaluate Boolean expression, given an environment (= list of
-- variable bindings)
eval :: [Bool] -> Pred Int a -> Bool
eval _   T           = True
eval _   F           = False
eval env (Var n _)   = env !! n
eval env (And p1 p2) = eval env p1 && eval env p2
eval env (Or p1 p2)  = eval env p1 || eval env p2


-----------------------------------------------------------------------

-- Make predicate data type an instance of functor
instance Functor (Pred i) where
  fmap _ T           = T  -- oops: F
  fmap _ F           = F  -- oops: T
  fmap f (Var n v)   = Var n (f v)
  fmap f (And p1 p2) = And (fmap f p1) (fmap f p2)
  fmap f (Or p1 p2)  = Or (fmap f p1) (fmap f p2)

-- Note:
-- - fmap essentially performs variable renaming
-- - Implementation fully generic, could be automatically derived
--   (see language extension -XDeriveFunctor)

-- One sample variable renaming (n → vₙ)
name :: Show a => String -> a -> String
name n v = n ++ show v

-- Another sample variable renaming (x → x')
quote :: String -> String
quote v = v ++ "'"

-----------------------------------------------------------------------

-- v0 ∧ (v1 ∨ F)
expr :: Pred Int Int
expr = And (Var 0 0) (Or (Var 1 1) F)

main :: IO ()
main = do
  print $ eval [True, False] expr
  print $ fmap (quote . name "v") expr

  -- Test the functor laws
  print $ fmap id expr                 == id expr
  print $ fmap (quote . name "v") expr == (fmap quote . fmap (name "v")) expr

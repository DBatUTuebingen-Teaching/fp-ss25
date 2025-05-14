-- Abstract syntax tree for arithmetic expressions of literals
data Exp a = Lit a                  -- c
           | Add (Exp a) (Exp a)    -- e1 + e2
           | Sub (Exp a) (Exp a)    -- e1 - e2
           | Mul (Exp a) (Exp a)    -- e1 × e2
  deriving (Show)

-- Two sample expressions
ex1 :: Exp Integer
ex1 = Add (Mul (Lit 5) (Lit 8)) (Lit 2)  -- (5 × 8) + 2

ex2 :: Exp Float
ex2 = Sub (Lit 42.1) (Lit 0.1)           -- 42.1 - 0.1


-- Interpreter for arithmetic expressions
eval :: Num a => Exp a -> a
eval = undefined


-- The instruction set of a super-simple stack machine
data Instr a = Push a  -- place literal a on stack top
             | DoAdd   -- add the two top-most stack entries, result at stack top
             | DoSub
             | DoMul
  deriving (Show)

-- A program is a sequence of instructions
type Program a = [Instr a]
-- A stack is a sequence of values (stack top = head)
type Stack a = [a]


main :: IO ()
main = do
  print $ ex1
  print $ ex2

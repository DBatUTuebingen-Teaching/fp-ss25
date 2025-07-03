{-# LANGUAGE GADTs #-}

module ExprDeepGADTUntyped (Expr(..),
                            eval) where

-- Use Haskell's "GADTs" language feature to explicitly
-- write down the types of the Expr constructors.
-- Problem: Expr is untyped (or rather: uni-typed):

data Expr where
  ValI   :: Integer              -> Expr
  ValB   :: Bool                 -> Expr
  Add    :: Expr -> Expr         -> Expr
  And    :: Expr -> Expr         -> Expr
  EqZero :: Expr                 -> Expr
  If     :: Expr -> Expr -> Expr -> Expr


instance Show Expr where
  show (ValI n)     = show n
  show (ValB b)     = show b
  show (Add e1 e2)  = show e1 ++ " + " ++ show e2
  show (And e1 e2)  = show e1 ++ " ∧ " ++ show e2
  show (EqZero e)   = show e  ++ " == 0"
  show (If p e1 e2) = "if " ++ show p ++ " then " ++ show e1 ++ " else " ++ show e2


eval :: Expr -> Either Integer Bool
eval (ValI n)     = Left n
eval (ValB b)     = Right b
eval (Add e1 e2)  = case (eval e1, eval e2) of
                      (Left n1, Left n2) -> Left (n1 + n2)
eval (And e1 e2)  = case (eval e1, eval e2) of
                      (Right b1, Right b2) -> Right (b1 && b2)
eval (EqZero e)   = case eval e of
                      Left n -> Right (n == 0)
eval (If p e1 e2) = case eval p of
                      Right b -> if b then eval e1 else eval e2

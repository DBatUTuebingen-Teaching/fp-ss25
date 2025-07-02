{-# LANGUAGE GADTs #-}

module DeepWhile (Expr(..),
                  eval) where

import Data.Map as M

-- Expr a: an expression that, if evaluated, will yield a value of type a
data Expr a where
  ValI   :: Int                           -> Expr Int
  ValB   :: Bool                          -> Expr Bool
  Add    :: Expr Int -> Expr Int          -> Expr Int
  And    :: Expr Bool -> Expr Bool        -> Expr Bool
  If     :: Expr Bool -> Expr a -> Expr a -> Expr a
  EqZero :: Expr Int                      -> Expr Bool

instance Show (Expr a) where
  show (ValI n)     = show n
  show (ValB b)     = show b
  show (Add e1 e2)  = show e1 ++ " + " ++ show e2
  show (And e1 e2)  = show e1 ++ " ∧ " ++ show e2
  show (If p e1 e2) = "if " ++ show p ++ " then " ++ show e1 ++ " else " ++ show e2
  show (EqZero e)   = show e  ++ " == 0"

type Env b = M.Map String b

-- Typed evaluation of expressions
eval :: Expr a -> a
eval (ValI n)     = n
eval (ValB b)     = b
eval (Add e1 e2)  = eval e1 + eval e2
eval (And e1 e2)  = eval e1 && eval e2
eval (If p e1 e2) = if eval p then eval e1 else eval e2
eval (EqZero e)   = eval e == 0
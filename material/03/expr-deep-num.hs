import ExprDeepNum

-- e1 = 8 * 7 - 14
e1 :: Expr
-- e1 = Sub (Mul (Val 8) (Val 7)) (Val 14)
e1 = 8 * 7 - 14

main :: IO ()
main = print $ eval e1

import ExprDeepGADTTyped

e1 :: Expr Integer
e1 = If (EqZero (Add (ValI 0) (ValI 0))) (ValI 42) (ValI 43)

--e2 :: Expr Bool
--e2 = EqZero (ValB True)

main :: IO ()
main = do
  print $ e1
  print $ eval e1

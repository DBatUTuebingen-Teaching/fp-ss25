-- (Excerpt of) characters in "The Force Awakens"
tfa :: [(String, Maybe String)]
tfa = [("Rey" , Nothing),
       ("Han" , Just "Solo"),
       ("Finn", Nothing),
       ("Kylo", Just "Ren")   -- ≡ ("Ben", Just "Solo")
      ]

-- Turn argument into 0
zap :: a -> Int
zap = const 0

-- Note: can also write these as
--
--       (fmap . ⋯ . fmap) zap tfa
--       \_______________/
--               |
-- (0 ... depth of functor stack) ⨉

main :: IO ()
main = do
  print $ zap tfa                              -- ➊
  print $ fmap zap tfa                         -- ➋
  print $ fmap (fmap zap) tfa                  -- ➌
  print $ fmap (fmap (fmap zap)) tfa           -- ➍
  print $ fmap (fmap (fmap (fmap zap))) tfa    -- ➎
--               ↑     ↑     ↑
--               |     |     :: (Char -> Int) -> [Char] -> [Int]
--               |     :: ([Char] -> [Int]) -> Maybe [Char] -> Maybe [Int]
--               :: (Maybe [Char] -> Maybe [Int]) -> (String, Maybe [Char]) -> (String, Maybe [Int])

  -- error when exceeding depth of functor stack:
  --        type Char does not have the required
  --        functorial structure (f a)
  -- print $ fmap (fmap (fmap (fmap (fmap zap)))) tfa

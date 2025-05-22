-- Use deriving the obtain the standard interpretation for the type classes
-- Eq, Ord, Enum, Bounded, Show, Read

-- The classic rock/paper/scissor game

data Outcome = Lose | Tie | Win
  deriving (Eq, Ord, Enum, Bounded, Show, Read)


-----------------------------------------------------------------------------


data Move = Rock | Paper | Scissor
  deriving (Eq, Enum, Read)     -- Ord, Show defined below; Bounded makes little sense

instance Show Move where
  show Rock    = "\xF255 "
  show Paper   = "\xF256 "
  show Scissor = "\xF257 "

instance Ord Move where         -- NB: non-conventional, encodes game rules
  Rock    <= Rock    = True
  Rock    <= Paper   = True
  Paper   <= Paper   = True
  Paper   <= Scissor = True
  Scissor <= Scissor = True
  Scissor <= Rock    = True
  _       <= _       = False


-----------------------------------------------------------------------------


outcome :: Move -> Move -> Outcome
outcome m1 m2 | m1 == m2  = Tie
              | m1 <  m2  = Lose
              | otherwise = Win

main :: IO ()
main = do
  print $ outcome Paper Scissor
  print $ [Rock .. Scissor]
  print $ (read "Scissor" :: Move)

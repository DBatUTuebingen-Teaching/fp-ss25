module PatternMatch (Pattern,
                     module Prelude,
                     lit, empty, fail,
                     alt, seq, rep) where

import Prelude hiding (seq, fail)

-- Given a string, a pattern returns the (possibly empty) list of
-- possible matches.  A match consists of a match value (e.g., matched
-- the matched character(s), token, or parse tree) and the residual string
-- left to match:

type Pattern a = String -> [(a, String)]

-- BASIC PATTERNS

-- match character c, returning the matched character
lit :: Char -> Pattern Char
lit = undefined

-- match the empty string, return v
empty :: a -> Pattern a
empty = undefined

-- fail always (yields empty list of matches)
fail :: Pattern a
fail = undefined

-- COMBINE PATTERNS

-- match p or q
alt :: Pattern a -> Pattern a -> Pattern a
alt = undefined

-- match p and q in sequence (use f to combine match values)
seq :: (a -> b -> c) -> Pattern a -> Pattern b -> Pattern c
seq = undefined

-- match p repeatedly (including 0 times)
rep :: Pattern a -> Pattern [a]
rep = undefined

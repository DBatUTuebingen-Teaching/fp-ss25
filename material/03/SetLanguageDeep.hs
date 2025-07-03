module SetLanguageDeep (IntegerSet(Empty, Insert, Delete),
                        member) where

-- constructors

data IntegerSet =
    Empty
  | Insert IntegerSet Integer
  | Delete IntegerSet Integer
  deriving (Show)

-- [todo] Build a suitable Show instance for IntegerSet


-- observer

member :: IntegerSet -> Integer -> Bool
member Empty         _ = False
member (Insert xs x) y = x == y || member xs y
member (Delete xs x) y = x /= y && member xs y

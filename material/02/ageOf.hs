-- A dictionary that maps a to b values
type Dictionary a b = [(a,b)]

type Person = String
type Age = Integer

-- Given dictionary pas, what is the age of person p?
ageOf :: Dictionary Person Age -> Person -> Maybe Age
ageOf []           _             = Nothing
ageOf ((p',a):pas) p | p == p'   = Just a
                     | otherwise = ageOf pas p

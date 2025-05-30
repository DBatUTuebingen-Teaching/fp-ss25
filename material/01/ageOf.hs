-- A dictionary that maps a to b values
type Dictionary a b = [(a,b)]

type Person = String
type Age = Integer

-- A dictionary of people and their age
people :: Dictionary Person Age
people = [("Darth", 46), ("Chewie", 200), ("Yoda", 902)]

-- Given dictionary pas, what is the age of person p?
ageOf :: Dictionary Person Age -> Person -> Age
ageOf pas p | fst (head pas) == p = snd (head pas)
            | otherwise           = ageOf (tail pas) p

ageOf' :: Dictionary Person Age -> Person -> Maybe Age
ageOf' []           _             = Nothing
ageOf' ((p',a):pas) p | p == p'   = Just a
                      | otherwise = ageOf' pas p


main :: IO ()
main = print $ ageOf' people "Chewie"

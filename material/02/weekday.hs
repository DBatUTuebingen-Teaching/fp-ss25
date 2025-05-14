-- A sum type (enumeration)

data Weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun

-- Is this day on a weekend?
weekend :: Weekday -> Bool
weekend Sat = True
weekend Sun = True
weekend _   = False

main :: IO ()
main = print (weekend Thu, weekend Sat)

import Data.List (nub)
import Network.HTTP.Types

-- Flagged has kind * -> *
type Flagged = (,) Bool                   -- Flagged a ≡ (Bool, a)

-- does HTTP status code s indicate an error condition?
okStatus :: Status -> Flagged Status
okStatus s = (s < status400, s)

main :: IO ()
main = print $ nub [ m | (True, Status _ m) <- map okStatus [status200..status501] ]

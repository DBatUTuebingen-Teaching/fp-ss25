module Monoid where

import Data.Monoid

data Tree a = Node a [Tree a]

-- 1P
treeSum :: Num a => Tree a -> a
treeSum (Node a cs) = a + sum (map treeSum cs)

-- 1P
treeLabels :: Tree a -> [a]
treeLabels (Node a cs) = [a] ++ concat (map treeLabels cs)

-- 2P
foldTree :: Monoid m => (a -> m) -> Tree a -> m
foldTree f (Node a cs) = f a <> mconcat (map (foldTree f) cs)

-- 1P
treeLabels' :: Num a => Tree a -> [a]
treeLabels' = foldTree (:[])

treeSum' :: Num a => Tree a -> a
treeSum' = getSum . foldTree Sum

-- 1 P
allNodes :: (a -> Bool) -> Tree a -> Bool
allNodes p = getAll . foldTree (All . p)

someNode :: (a -> Bool) -> Tree a -> Bool
someNode p = getAny . foldTree (Any . p)

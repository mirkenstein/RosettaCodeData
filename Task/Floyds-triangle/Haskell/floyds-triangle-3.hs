import Data.List (mapAccumL)

floyd :: Int -> [[Int]]
floyd n =
  snd $
  mapAccumL
    (\a x ->
        let m = a + x
        in (succ m, [a .. m]))
    1
    [0 .. pred n]

-- TEST -------------------------------------
showFloyd :: [[Int]] -> String
showFloyd xs =
  let padRight n = length >>= (<$> mappend (replicate n ' ')) . drop
  in unlines $
     (concat .
      zipWith ((. show) . padRight) ((succ . length . show) <$> last xs)) <$>
     xs

main :: IO ()
main = mapM_ putStrLn $ (showFloyd . floyd) <$> [5, 14]

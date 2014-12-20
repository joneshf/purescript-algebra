module Test.Data.Algebra where

  import Test.Data.Semigroup
  import Test.QuickCheck

  main = do
    quickCheck \a b c -> a + (b + c) == ((a + b) + c :: Number)

module Data.Semigroup where

  import qualified Prelude as P

  infixl 7 *
  infixl 6 +

  -- | `<>` should satisfy associativity.
  --   a <> (b <> c) == (a <> b) <> c
  class Semigroup s where
  -- class (Eq s) <= Semigroup s where
    (<>) :: s -> s -> s

  -- | `+` should satisfy associativity.
  --   a + (b + c) == (a + b) + c
  class AdditiveSemigroup s where
    (+) :: s -> s -> s

  -- | `*` should satisfy associativity.
  --   a * (b * c) == (a * b) * c
  class (AdditiveSemigroup s) <= MultiplicativeSemigroup s where
    (*) :: s -> s -> s

  -- | `<>` should satisfy commutativity.
  --   a <> b == b <> a
  class (Semigroup s) <= AbelianSemigroup s

  -- | `+` should satisfy commutativity.
  --   a + b == b + a
  class (AdditiveSemigroup s) <= AbelianAdditiveSemigroup s

  -- | `*` should satisfy commutativity.
  --   a * b == b * a
  class (MultiplicativeSemigroup s) <= AbelianMultiplicativeSemigroup s

  instance additiveNumber :: AdditiveSemigroup Number where
    (+) = numPlus

  instance multiplicativeNumber :: MultiplicativeSemigroup Number where
    (*) = numTimes

  instance abelianAdditiveSemigroup :: AbelianAdditiveSemigroup Number
  instance abelianMultiplicativeSemigroup :: AbelianMultiplicativeSemigroup Number

  instance semigroupString :: Semigroup String where
    (<>) = strConcat

  foreign import numPlus
    "function numPlus(n) {\
    \  return function(m) {\
    \    return n + m;\
    \  }\
    \}" :: Number -> Number -> Number

  foreign import numTimes
    "function numTimes(n) {\
    \  return function(m) {\
    \    return n * m;\
    \  }\
    \}" :: Number -> Number -> Number

  foreign import strConcat
    "function strConcat(s) {\
    \  return function(t) {\
    \    return s + t;\
    \  }\
    \}" :: String -> String -> String

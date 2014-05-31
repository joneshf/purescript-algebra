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
  class AddSemigroup s where
    (+) :: s -> s -> s

  -- | `*` should satisfy associativity.
  --   a * (b * c) == (a * b) * c
  class (AddSemigroup s) <= MultSemigroup s where
    (*) :: s -> s -> s

  -- | `<>` should satisfy commutativity.
  --   a <> b == b <> a
  class (Semigroup s) <= AbelianSemigroup s

  -- | `+` should satisfy commutativity.
  --   a + b == b + a
  class (AddSemigroup s) <= AbelianAddSemigroup s

  -- | `*` should satisfy commutativity.
  --   a * b == b * a
  class (MultSemigroup s) <= AbelianMultSemigroup s

  instance additiveNumber :: AddSemigroup Number where
    (+) = numPlus

  instance multiplicativeNumber :: MultSemigroup Number where
    (*) = numTimes

  instance abelianAddSemigroup :: AbelianAddSemigroup Number
  instance abelianMultSemigroup :: AbelianMultSemigroup Number

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

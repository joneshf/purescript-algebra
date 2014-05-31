module Data.Group where

  import qualified Prelude as P

  import Data.Monoid

  -- | `inverse` should provide an element such that
  --   a ++ (inverse a) == mempty == (inverse a) ++ a
  class (Monoid g) <= Group g where
    inverse :: g -> g

  -- | `negate` should provide an element such that
  --   a + (negate a) == zero == (negate a) + a
  --   This can also be rewritten
  --   a - a == zero == a - a
  class (AddMonoid g) <= AddGroup g where
    negate :: g -> g
    (-) :: g -> g -> g

  -- | `recip` should provide an element such that
  --   a * (recip a) == one == (recip a) * a
  --   This can also be rewritten
  --   a / a == one == a / a
  class (MultMonoid g) <= MultGroup g where
    recip :: g -> g
    (/) :: g -> g -> g

  -- | The Group should preserve commutativity.
  class (AbelianMonoid g, Group g) <= AbelianGroup g

  -- | The Group should preserve commutativity.
  class (AbelianAddMonoid g, AddGroup g) <= AbelianAddGroup g

  -- | The Group should preserve commutativity.
  class (AbelianMultMonoid g, MultGroup g) <= AbelianMultGroup g

  instance additiveNumber :: AddGroup Number where
    negate x = zero - x
    (-) = numMinus

  instance multiplicativeNumber :: MultGroup Number where
    recip x = one / x
    (/) = numDivide

  instance abelianAddGroup :: AbelianAddGroup Number
  instance abelianMultGroup :: AbelianMultGroup Number

  foreign import numMinus
    "function numMinus(n) {\
    \  return function(m) {\
    \    return n - m;\
    \  }\
    \}" :: Number -> Number -> Number

  foreign import numDivide
    "function numDivide(n) {\
    \  return function(m) {\
    \    return n / m;\
    \  }\
    \}" :: Number -> Number -> Number

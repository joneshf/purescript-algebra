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
  class (AdditiveMonoid g) <= AdditiveGroup g where
    negate :: g -> g
    (-) :: g -> g -> g

  -- | `recip` should provide an element such that
  --   a * (recip a) == one == (recip a) * a
  --   This can also be rewritten
  --   a / a == one == a / a
  class (MultiplicativeMonoid g) <= MultiplicativeGroup g where
    recip :: g -> g
    (/) :: g -> g -> g

  -- | The Group should preserve commutativity.
  class (AbelianMonoid g, Group g) <= AbelianGroup g

  -- | The Group should preserve commutativity.
  class (AbelianAdditiveMonoid g, AdditiveGroup g) <= AbelianAdditiveGroup g

  -- | The Group should preserve commutativity.
  class (AbelianMultiplicativeMonoid g, MultiplicativeGroup g) <= AbelianMultiplicativeGroup g

  instance additiveNumber :: AdditiveGroup Number where
    negate x = zero - x
    (-) = numMinus

  instance multiplicativeNumber :: MultiplicativeGroup Number where
    recip x = 1 / x
    (/) = numDivide

  instance abelianAdditiveGroup :: AbelianAdditiveGroup Number
  instance abelianMultiplicativeGroup :: AbelianMultiplicativeGroup Number

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

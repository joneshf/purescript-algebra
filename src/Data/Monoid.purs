module Data.Monoid where

  import qualified Prelude as P

  import Data.Semigroup

  -- | `mempty` should be a left and right identity for the underlying `Semigroup`.
  --   a + mempty == a == mempty + a
  class (Semigroup m) <= Monoid m where
    mempty :: m

  -- | `zero` should be a left and right identity for the underlying `Semigroup`.
  --   a + zero == a == zero + a
  class (AdditiveSemigroup m) <= AdditiveMonoid m where
    zero :: m

  -- | `one` should be a left and right identity for the underlying `Semigroup`.
  --   a + one == a == one + a
  class (AdditiveMonoid m) <= MultiplicativeMonoid m where
    one :: m

  -- | The Monoid preserves commutativity for the underlying `Semigroup`.
  class (AbelianSemigroup m, Monoid m) <= AbelianMonoid m

  -- | The Monoid preserves commutativity for the underlying `Semigroup`.
  class (AbelianAdditiveSemigroup m, AdditiveMonoid m) <= AbelianAdditiveMonoid m

  -- | The Monoid preserves commutativity for the underlying `Semigroup`.
  class (AbelianMultiplicativeSemigroup m, MultiplicativeMonoid m) <= AbelianMultiplicativeMonoid m

  instance additiveNumber :: AdditiveMonoid Number where
    zero = 0

  instance multiplicativeNumber :: MultiplicativeMonoid Number where
    one = 1

  instance abelianAdditiveMonoid :: AbelianAdditiveMonoid Number
  instance abelianMultiplicativeMonoid :: AbelianMultiplicativeMonoid Number

  instance monoidString :: Monoid String where
    mempty = ""

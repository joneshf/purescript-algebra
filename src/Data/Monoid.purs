module Data.Monoid where

  import qualified Prelude as P

  import Data.Semigroup

  -- | `mempty` should be a left and right identity for the underlying `Semigroup`.
  --   a + mempty == a == mempty + a
  class (Semigroup m) <= Monoid m where
    mempty :: m

  -- | `zero` should be a left and right identity for the underlying `Semigroup`.
  --   a + zero == a == zero + a
  class (AddSemigroup m) <= AddMonoid m where
    zero :: m

  -- | `one` should be a left and right identity for the underlying `Semigroup`.
  --   a + one == a == one + a
  class (AddMonoid m) <= MultMonoid m where
    one :: m

  -- | The Monoid preserves commutativity for the underlying `Semigroup`.
  class (AbelianSemigroup m, Monoid m) <= AbelianMonoid m

  -- | The Monoid preserves commutativity for the underlying `Semigroup`.
  class (AbelianAddSemigroup m, AddMonoid m) <= AbelianAddMonoid m

  -- | The Monoid preserves commutativity for the underlying `Semigroup`.
  class (AbelianMultSemigroup m, MultMonoid m) <= AbelianMultMonoid m

  instance additiveNumber :: AddMonoid Number where
    zero = 0

  instance multiplicativeNumber :: MultMonoid Number where
    one = 1

  instance abelianAddMonoid :: AbelianAddMonoid Number
  instance abelianMultMonoid :: AbelianMultMonoid Number

  instance monoidString :: Monoid String where
    mempty = ""

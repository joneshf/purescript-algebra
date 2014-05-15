module Data.Ring where

  import qualified Prelude as P

  import Data.Group
  import Data.Monoid
  import Data.Semigroup

  -- | `*` should distribute over `+`.
  --   a * (b + c) == (a * b) + (a * c)
  --   (b + c) * a == (b * a) + (c * a)
  class (AbelianAdditiveGroup r, MultiplicativeSemigroup r) <= Rng r

  -- | `*` should distribute over `+`.
  --   a * (b + c) == (a * b) + (a * c)
  --   (b + c) * a == (b * a) + (c * a)
  class (AbelianAdditiveMonoid r, MultiplicativeMonoid r) <= Rig r

  -- | `*` should distribute over `+`.
  --   a * (b + c) == (a * b) + (a * c)
  --   (b + c) * a == (b * a) + (c * a)
  class (AbelianAdditiveGroup r, MultiplicativeMonoid r) <= Ring r

  instance ringNumber :: Ring Number

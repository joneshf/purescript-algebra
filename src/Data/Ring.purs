module Data.Ring where

  import qualified Prelude as P

  import Data.Group
  import Data.Monoid
  import Data.Semigroup

  -- | `*` should distribute over `+`.
  --   a * (b + c) == (a * b) + (a * c)
  --   (b + c) * a == (b * a) + (c * a)
  class (AbelianAddGroup r, MultSemigroup r) <= Rng r

  -- | `*` should distribute over `+`.
  --   a * (b + c) == (a * b) + (a * c)
  --   (b + c) * a == (b * a) + (c * a)
  class (AbelianAddMonoid r, MultMonoid r) <= Rig r

  -- | `*` should distribute over `+`.
  --   a * (b + c) == (a * b) + (a * c)
  --   (b + c) * a == (b * a) + (c * a)
  class (AbelianAddGroup r, MultMonoid r) <= Ring r

  instance ringNumber :: Ring Number

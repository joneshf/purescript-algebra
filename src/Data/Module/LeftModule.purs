module Data.Module.LeftModule where

  import qualified Prelude as P

  import Data.Group
  import Data.Ring
  import Data.Semigroup

  -- | The following should hold
  --   forall r, s in Ring and m, n in Group
  --   r *< (m + n) == (r *< m) + (r *< n)
  --   (r + s) *< m == (r *< m) + (s *< m)
  --   (r * s) *< m == r * (s *< m)
  --   one *< m == m
  class (AbelianAdditiveGroup m, Ring r) <= LeftModule m r where
    (*<) :: r -> m -> m

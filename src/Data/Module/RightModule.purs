module Data.Module.RightModule where

  import qualified Prelude as P

  import Data.Group
  import Data.Ring

  -- | The following should hold
  --   forall r, s in Ring and m, n in Group
  --   (m + n) >* r == (m >* r) + (n >* r)
  --   m >* (r + s) == (m >* r) + (m >* s)
  --   m >* (r * s) == (m >* r) * s
  --   m >* one == m
  class (AbelianAdditiveGroup m, Ring r) <= RightModule m r where
    (>*) :: m -> r -> m

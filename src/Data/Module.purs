module Data.Module where

  import Data.Module.LeftModule
  import Data.Module.RightModule

    -- | Combines both a left and right module.
  class (LeftModule m r, RightModule m r) <= Module m r

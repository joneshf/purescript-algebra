module Data.BoundedSemilattice where

  import Data.Semilattice

  class (JoinSemilattice l) <= LowerSemilattice l where
    bottom :: l

  class (MeetSemilattice l) <= UpperSemilattice l where
    top :: l

  instance lowerSemilatticeBoolean :: LowerSemilattice Boolean where
    bottom = false

  instance upperSemilatticeBoolean :: UpperSemilattice Boolean where
    top = true

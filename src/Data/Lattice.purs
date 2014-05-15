module Data.Lattice where

  import Data.BoundedSemilattice

  class (LowerSemilattice l, UpperSemilattice l) <= Lattice l

  instance latticeBoolean :: Lattice Boolean

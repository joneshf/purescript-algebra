module Data.Semilattice where

  infixr 2 \/
  infixr 3 /\

  class JoinSemilattice j where
    (\/) :: j -> j -> j

  class MeetSemilattice m where
    (/\) :: m -> m -> m

  instance joinSemilatticeBoolean :: JoinSemilattice Boolean where
    (\/) = booleanOr

  foreign import booleanOr
    "function booleanOr(b1) {\
    \  return function(b2) {\
    \    return b1 || b2;\
    \  };\
    \}" :: Boolean -> Boolean -> Boolean

  instance meetSemilatticeBoolean :: MeetSemilattice Boolean where
    (/\) = booleanAnd

  foreign import booleanAnd
    "function booleanAnd(b1) {\
    \  return function(b2) {\
    \    return b1 && b2;\
    \  };\
    \}" :: Boolean -> Boolean -> Boolean

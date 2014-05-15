module Data.BooleanAlgebra where

  import qualified Prelude as P

  import Data.Lattice

  class (Lattice a) <= BooleanAlgebra a where
    complement :: a -> a

  instance booleanBoolean :: BooleanAlgebra Boolean where
    complement = booleanNegate

  foreign import booleanNegate
    "function booleanNegate(b) {\
    \  return !b;\
    \}" :: Boolean -> Boolean

  not :: forall b. (BooleanAlgebra b) => b -> b
  not = complement

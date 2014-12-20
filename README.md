# Module Documentation

## Module Data.BooleanAlgebra

### Type Classes

    class (Lattice a) <= BooleanAlgebra a where
      complement :: a -> a


### Type Class Instances

    instance booleanBoolean :: BooleanAlgebra Boolean


### Values

    booleanNegate :: Boolean -> Boolean

    not :: forall b. (BooleanAlgebra b) => b -> b


## Module Data.BoundedSemilattice

### Type Classes

    class (JoinSemilattice l) <= LowerSemilattice l where
      bottom :: l

    class (MeetSemilattice l) <= UpperSemilattice l where
      top :: l


### Type Class Instances

    instance lowerSemilatticeBoolean :: LowerSemilattice Boolean

    instance upperSemilatticeBoolean :: UpperSemilattice Boolean


## Module Data.Group

### Type Classes

    class (AbelianAddMonoid g, AddGroup g) <= AbelianAddGroup g where

    class (AbelianMonoid g, Group g) <= AbelianGroup g where

    class (AbelianMultMonoid g, MultGroup g) <= AbelianMultGroup g where

    class (AddMonoid g) <= AddGroup g where
      negate :: g -> g
      (-) :: g -> g -> g

    class (Monoid g) <= Group g where
      inverse :: g -> g

    class (MultMonoid g) <= MultGroup g where
      recip :: g -> g
      (/) :: g -> g -> g


### Type Class Instances

    instance abelianAddGroup :: AbelianAddGroup Number

    instance abelianMultGroup :: AbelianMultGroup Number

    instance additiveNumber :: AddGroup Number

    instance multiplicativeNumber :: MultGroup Number


### Values

    numDivide :: Number -> Number -> Number

    numMinus :: Number -> Number -> Number


## Module Data.Lattice

### Type Classes

    class (LowerSemilattice l, UpperSemilattice l) <= Lattice l where


### Type Class Instances

    instance latticeBoolean :: Lattice Boolean


## Module Data.Module

### Type Classes

    class (LeftModule m r, RightModule m r) <= Module m r where


## Module Data.Monoid

### Type Classes

    class (AbelianAddSemigroup m, AddMonoid m) <= AbelianAddMonoid m where

    class (AbelianSemigroup m, Monoid m) <= AbelianMonoid m where

    class (AbelianMultSemigroup m, MultMonoid m) <= AbelianMultMonoid m where

    class (AddSemigroup m) <= AddMonoid m where
      zero :: m

    class (Semigroup m) <= Monoid m where
      mempty :: m

    class (MultSemigroup m) <= MultMonoid m where
      one :: m


### Type Class Instances

    instance abelianAddMonoid :: AbelianAddMonoid Number

    instance abelianMultMonoid :: AbelianMultMonoid Number

    instance additiveNumber :: AddMonoid Number

    instance monoidString :: Monoid String

    instance multiplicativeNumber :: MultMonoid Number


## Module Data.Ring

### Type Classes

    class (AbelianAddMonoid r, MultMonoid r) <= Rig r where

    class (AbelianAddGroup r, MultMonoid r) <= Ring r where

    class (AbelianAddGroup r, MultSemigroup r) <= Rng r where


### Type Class Instances

    instance ringNumber :: Ring Number


## Module Data.Semigroup

### Type Classes

    class (AddSemigroup s) <= AbelianAddSemigroup s where

    class (MultSemigroup s) <= AbelianMultSemigroup s where

    class (Semigroup s) <= AbelianSemigroup s where

    class AddSemigroup s where
      (+) :: s -> s -> s

    class MultSemigroup s where
      (*) :: s -> s -> s

    class Semigroup s where
      (<>) :: s -> s -> s


### Type Class Instances

    instance abelianAddSemigroup :: AbelianAddSemigroup Number

    instance abelianMultSemigroup :: AbelianMultSemigroup Number

    instance additiveNumber :: AddSemigroup Number

    instance multiplicativeNumber :: MultSemigroup Number

    instance semigroupString :: Semigroup String


### Values

    numPlus :: Number -> Number -> Number

    numTimes :: Number -> Number -> Number

    strConcat :: String -> String -> String


## Module Data.Semilattice

### Type Classes

    class JoinSemilattice j where
      (\/) :: j -> j -> j

    class MeetSemilattice m where
      (/\) :: m -> m -> m


### Type Class Instances

    instance joinSemilatticeBoolean :: JoinSemilattice Boolean

    instance meetSemilatticeBoolean :: MeetSemilattice Boolean


### Values

    booleanAnd :: Boolean -> Boolean -> Boolean

    booleanOr :: Boolean -> Boolean -> Boolean


## Module Data.Module.LeftModule

### Type Classes

    class (AbelianAddGroup m, Ring r) <= LeftModule m r where
      (*<) :: r -> m -> m


## Module Data.Module.RightModule

### Type Classes

    class (AbelianAddGroup m, Ring r) <= RightModule m r where
      (>*) :: m -> r -> m




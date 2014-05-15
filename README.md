# Module Documentation

## Module Data.BooleanAlgebra

### Type Classes

    class (Lattice a) <= BooleanAlgebra a where
      complement :: a -> a


### Type Class Instances

    instance booleanBoolean :: BooleanAlgebra Prim.Boolean


### Values

    booleanNegate :: Prim.Boolean -> Prim.Boolean

    not :: forall b. (BooleanAlgebra b) => b -> b


## Module Data.BoundedSemilattice

### Type Classes

    class (JoinSemilattice l) <= LowerSemilattice l where
      bottom :: l

    class (MeetSemilattice l) <= UpperSemilattice l where
      top :: l


### Type Class Instances

    instance lowerSemilatticeBoolean :: LowerSemilattice Prim.Boolean

    instance upperSemilatticeBoolean :: UpperSemilattice Prim.Boolean


## Module Data.Group

### Type Classes

    class (AbelianAdditiveMonoid g, AdditiveGroup g) <= AbelianAdditiveGroup g where

    class (AbelianMonoid g, Group g) <= AbelianGroup g where

    class (AbelianMultiplicativeMonoid g, MultiplicativeGroup g) <= AbelianMultiplicativeGroup g where

    class (AdditiveMonoid g) <= AdditiveGroup g where
      negate :: g -> g
      (-) :: g -> g -> g

    class (Monoid g) <= Group g where
      inverse :: g -> g

    class (MultiplicativeMonoid g) <= MultiplicativeGroup g where
      recip :: g -> g
      (/) :: g -> g -> g


### Type Class Instances

    instance abelianAdditiveGroup :: AbelianAdditiveGroup Prim.Number

    instance abelianMultiplicativeGroup :: AbelianMultiplicativeGroup Prim.Number

    instance additiveNumber :: AdditiveGroup Prim.Number

    instance multiplicativeNumber :: MultiplicativeGroup Prim.Number


### Values

    numDivide :: Prim.Number -> Prim.Number -> Prim.Number

    numMinus :: Prim.Number -> Prim.Number -> Prim.Number


## Module Data.Lattice

### Type Classes

    class (LowerSemilattice l, UpperSemilattice l) <= Lattice l where


### Type Class Instances

    instance latticeBoolean :: Lattice Prim.Boolean


## Module Data.Module.LeftModule

### Type Classes

    class (AbelianAdditiveGroup m, Ring r) <= LeftModule m r where
      (*<) :: r -> m -> m


## Module Data.Module

### Type Classes

    class (LeftModule m r, RightModule m r) <= Module m r where


## Module Data.Module.RightModule

### Type Classes

    class (AbelianAdditiveGroup m, Ring r) <= RightModule m r where
      (>*) :: m -> r -> m


## Module Data.Monoid

### Type Classes

    class (AbelianAdditiveSemigroup m, AdditiveMonoid m) <= AbelianAdditiveMonoid m where

    class (AbelianSemigroup m, Monoid m) <= AbelianMonoid m where

    class (AbelianMultiplicativeSemigroup m, MultiplicativeMonoid m) <= AbelianMultiplicativeMonoid m where

    class (AdditiveSemigroup m) <= AdditiveMonoid m where
      zero :: m

    class (Semigroup m) <= Monoid m where
      mempty :: m

    class (AdditiveMonoid m) <= MultiplicativeMonoid m where
      one :: m


### Type Class Instances

    instance abelianAdditiveMonoid :: AbelianAdditiveMonoid Prim.Number

    instance abelianMultiplicativeMonoid :: AbelianMultiplicativeMonoid Prim.Number

    instance additiveNumber :: AdditiveMonoid Prim.Number

    instance monoidString :: Monoid Prim.String

    instance multiplicativeNumber :: MultiplicativeMonoid Prim.Number


## Module Data.Ring

### Type Classes

    class (AbelianAdditiveMonoid r, MultiplicativeMonoid r) <= Rig r where

    class (AbelianAdditiveGroup r, MultiplicativeMonoid r) <= Ring r where

    class (AbelianAdditiveGroup r, MultiplicativeSemigroup r) <= Rng r where


### Type Class Instances

    instance ringNumber :: Ring Prim.Number


## Module Data.Semigroup

### Type Classes

    class (AdditiveSemigroup s) <= AbelianAdditiveSemigroup s where

    class (MultiplicativeSemigroup s) <= AbelianMultiplicativeSemigroup s where

    class (Semigroup s) <= AbelianSemigroup s where

    class AdditiveSemigroup s where
      (+) :: s -> s -> s

    class (AdditiveSemigroup s) <= MultiplicativeSemigroup s where
      (*) :: s -> s -> s

    class Semigroup s where
      (<>) :: s -> s -> s


### Type Class Instances

    instance abelianAdditiveSemigroup :: AbelianAdditiveSemigroup Prim.Number

    instance abelianMultiplicativeSemigroup :: AbelianMultiplicativeSemigroup Prim.Number

    instance additiveNumber :: AdditiveSemigroup Prim.Number

    instance multiplicativeNumber :: MultiplicativeSemigroup Prim.Number

    instance semigroupString :: Semigroup Prim.String


### Values

    numPlus :: Prim.Number -> Prim.Number -> Prim.Number

    numTimes :: Prim.Number -> Prim.Number -> Prim.Number

    strConcat :: Prim.String -> Prim.String -> Prim.String


## Module Data.Semilattice

### Type Classes

    class JoinSemilattice j where
      (\/) :: j -> j -> j

    class MeetSemilattice m where
      (/\) :: m -> m -> m


### Type Class Instances

    instance joinSemilatticeBoolean :: JoinSemilattice Prim.Boolean

    instance meetSemilatticeBoolean :: MeetSemilattice Prim.Boolean


### Values

    booleanAnd :: Prim.Boolean -> Prim.Boolean -> Prim.Boolean

    booleanOr :: Prim.Boolean -> Prim.Boolean -> Prim.Boolean




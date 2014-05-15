module Test.Data.Monoid where

  import qualified Prelude as P

  import Data.Monoid
  import Data.Semigroup
  import Test.QuickCheck

  prop_Monoid :: forall m. (Arbitrary m, P.Eq m, Semigroup m, Monoid m) => m -> QC {}
  prop_Monoid m = do
    quickCheck (prop_left_identity  (<>) mempty m)
    quickCheck (prop_right_identity (<>) mempty m)

  prop_AdditiveMonoid :: forall m. (Arbitrary m, P.Eq m, AdditiveSemigroup m, AdditiveMonoid m) => m -> QC {}
  prop_AdditiveMonoid m = do
    quickCheck (prop_left_identity  (+) zero m)
    quickCheck (prop_right_identity (+) zero m)

  prop_MultiplicativeMonoid :: forall m. (Arbitrary m, P.Eq m, MultiplicativeSemigroup m, MultiplicativeMonoid m) => m -> QC {}
  prop_MultiplicativeMonoid m = do
    quickCheck (prop_left_identity  (*) one m)
    quickCheck (prop_right_identity (*) one m)

  prop_left_identity :: forall m. (Arbitrary m, P.Eq m) => (m -> m -> m) -> m -> m -> m -> Boolean
  prop_left_identity (<.>) ident _ a = (ident <.> a) P.== a

  prop_right_identity :: forall m. (Arbitrary m, P.Eq m) => (m -> m -> m) -> m -> m -> m -> Boolean
  prop_right_identity (<.>) ident _ a = (a <.> ident) P.== a

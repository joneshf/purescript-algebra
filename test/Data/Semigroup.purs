module Test.Data.Semigroup where

  import qualified Prelude as P

  import Data.Semigroup
  import Test.QuickCheck

  prop_Semigroup :: forall s. (Arbitrary s, P.Eq s, Semigroup s) => s -> QC {}
  prop_Semigroup = quickCheck P.<<< prop_associativity (<>)

  prop_AdditiveSemigroup :: forall s. (Arbitrary s, P.Eq s, AdditiveSemigroup s) => s -> QC {}
  prop_AdditiveSemigroup = quickCheck P.<<< prop_associativity (+)

  prop_MultiplicativeSemigroup :: forall s. (Arbitrary s, P.Eq s, MultiplicativeSemigroup s) => s -> QC {}
  prop_MultiplicativeSemigroup = quickCheck P.<<< prop_associativity (*)

  prop_AbelianSemigroup :: forall s. (Arbitrary s, P.Eq s, Semigroup s) => s -> QC {}
  prop_AbelianSemigroup = quickCheck P.<<< prop_commutativity (<>)

  prop_AbelianAdditiveSemigroup :: forall s. (Arbitrary s, P.Eq s, AbelianAdditiveSemigroup s) => s -> QC {}
  prop_AbelianAdditiveSemigroup = quickCheck P.<<< prop_commutativity (+)

  prop_AbelianMultiplicativeSemigroup :: forall s. (Arbitrary s, P.Eq s, AbelianMultiplicativeSemigroup s) => s -> QC {}
  prop_AbelianMultiplicativeSemigroup = quickCheck P.<<< prop_commutativity (*)

  prop_associativity :: forall s. (Arbitrary s, P.Eq s) => (s -> s -> s) -> s -> s -> s -> s -> Boolean
  prop_associativity (<.>) _ a b c = (a <.> (b <.> c)) P.== ((a <.> b) <.> c)

  prop_commutativity :: forall s. (Arbitrary s, P.Eq s) => (s -> s -> s) -> s -> s -> s -> Boolean
  prop_commutativity (<.>) _ a b = (a <.> b) P.== (b <.> a)

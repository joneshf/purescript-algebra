module Test.Data.Semigroup where

  import qualified Prelude as P

  import Data.Semigroup
  import Test.QuickCheck

  prop_Semigroup :: forall s. (Arbitrary s, P.Eq s, Semigroup s) => s -> QC {}
  prop_Semigroup = quickCheck P.<<< prop_associativity (<>)

  prop_AddSemigroup :: forall s. (Arbitrary s, P.Eq s, AddSemigroup s) => s -> QC {}
  prop_AddSemigroup = quickCheck P.<<< prop_associativity (+)

  prop_MultSemigroup :: forall s. (Arbitrary s, P.Eq s, MultSemigroup s) => s -> QC {}
  prop_MultSemigroup = quickCheck P.<<< prop_associativity (*)

  prop_AbelianSemigroup :: forall s. (Arbitrary s, P.Eq s, Semigroup s) => s -> QC {}
  prop_AbelianSemigroup = quickCheck P.<<< prop_commutativity (<>)

  prop_AbelianAddSemigroup :: forall s. (Arbitrary s, P.Eq s, AbelianAddSemigroup s) => s -> QC {}
  prop_AbelianAddSemigroup = quickCheck P.<<< prop_commutativity (+)

  prop_AbelianMultSemigroup :: forall s. (Arbitrary s, P.Eq s, AbelianMultSemigroup s) => s -> QC {}
  prop_AbelianMultSemigroup = quickCheck P.<<< prop_commutativity (*)

  prop_associativity :: forall s. (Arbitrary s, P.Eq s) => (s -> s -> s) -> s -> s -> s -> s -> Boolean
  prop_associativity (<.>) _ a b c = (a <.> (b <.> c)) P.== ((a <.> b) <.> c)

  prop_commutativity :: forall s. (Arbitrary s, P.Eq s) => (s -> s -> s) -> s -> s -> s -> Boolean
  prop_commutativity (<.>) _ a b = (a <.> b) P.== (b <.> a)

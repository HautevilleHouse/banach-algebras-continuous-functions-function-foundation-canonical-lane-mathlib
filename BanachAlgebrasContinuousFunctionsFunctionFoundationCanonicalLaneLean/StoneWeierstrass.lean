import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.ContinuousFunctionAlgebra

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure StoneWeierstrassPackage (X : Type u) [TopologicalSpace X] [CompactSpace X] where
  subalgebra : Set (ContinuousFunctionAlgebra X).carrier
  subalgebraIsSubalgebra : Subalgebra ℝ (ContinuousFunctionAlgebra X).carrier subalgebra
  subalgebraSeparatesPoints : ∀ x ≠ y, ∃ f ∈ subalgebra, f x ≠ f y
  subalgebraContainsConstant : ∀ r : ℝ, (fun _ : X => r) ∈ subalgebra
  subalgebraIsClosedUnderComplexConjugate : Prop -- if complex, but we use real
  closureIsWholeAlgebra : closure subalgebra = Set.univ

structure StoneWeierstrassEvidence {X : Type u} [TopologicalSpace X] [CompactSpace X] (S : StoneWeierstrassPackage X) where
  subalgebraIsSubalgebra_closed : S.subalgebraIsSubalgebra
  subalgebraSeparatesPoints_closed : S.subalgebraSeparatesPoints
  subalgebraContainsConstant_closed : S.subalgebraContainsConstant
  closureIsWholeAlgebra_closed : S.closureIsWholeAlgebra

def StoneWeierstrassClosed {X : Type u} [TopologicalSpace X] [CompactSpace X] (S : StoneWeierstrassPackage X) : Prop :=
  S.subalgebraIsSubalgebra ∧ S.subalgebraSeparatesPoints ∧ S.subalgebraContainsConstant ∧ S.closureIsWholeAlgebra

theorem stone_weierstrass_closed_from_evidence {X : Type u} [TopologicalSpace X] [CompactSpace X] (S : StoneWeierstrassPackage X) (E : StoneWeierstrassEvidence S) : StoneWeierstrassClosed S := by
  exact And.intro E.subalgebraIsSubalgebra_closed (And.intro E.subalgebraSeparatesPoints_closed (And.intro E.subalgebraContainsConstant_closed E.closureIsWholeAlgebra_closed))

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
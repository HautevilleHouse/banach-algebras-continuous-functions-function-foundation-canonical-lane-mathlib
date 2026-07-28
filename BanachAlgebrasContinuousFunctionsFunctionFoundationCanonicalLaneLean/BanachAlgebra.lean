import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure BanachAlgebraPackage where
  carrier : Type u
  norm : carrier → ℝ
  algebra : Algebra ℝ carrier
  normedAlgebra : NormedAlgebra ℝ carrier
  complete : CompleteSpace carrier
  norm_mul : ∀ x y, norm (x * y) ≤ norm x * norm y
  norm_one : norm (1 : carrier) = 1

structure BanachAlgebraEvidence (B : BanachAlgebraPackage) where
  norm_mul_closed : B.norm_mul
  norm_one_closed : B.norm_one
  complete_closed : B.complete

def BanachAlgebraClosed (B : BanachAlgebraPackage) : Prop :=
  B.norm_mul ∧ B.norm_one ∧ B.complete

theorem banach_algebra_closed_from_evidence (B : BanachAlgebraPackage) (E : BanachAlgebraEvidence B) : BanachAlgebraClosed B := by
  exact And.intro E.norm_mul_closed (And.intro E.norm_one_closed E.complete_closed)

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
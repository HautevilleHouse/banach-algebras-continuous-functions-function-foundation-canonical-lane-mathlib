import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure BanachAlgebraPackage where
  carrier : Type u
  norm : carrier → ℝ
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  normedAddCommGroup : NormedAddCommGroup carrier
  normedRing : NormedRing carrier
  norm_mul : ∀ x y : carrier, norm (mul x y) ≤ norm x * norm y
  complete : CompleteSpace carrier

structure BanachAlgebraEvidence (A : BanachAlgebraPackage) where
  norm_mul_closed : A.norm_mul
  complete_closed : A.complete

def BanachAlgebraClosed (A : BanachAlgebraPackage) : Prop :=
  A.norm_mul ∧ A.complete

theorem banach_algebra_closed_from_evidence (A : BanachAlgebraPackage) (E : BanachAlgebraEvidence A) :
    BanachAlgebraClosed A := by
  exact And.intro E.norm_mul_closed E.complete_closed

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure BanachAlgebraPackage where
  normedAlgebra : Prop
  completeness : Prop
  multiplicativeIdentity : Prop
  submultiplicativity : Prop
  propertiesClosed : normedAlgebra ∧ completeness ∧ multiplicativeIdentity ∧ submultiplicativity

structure BanachAlgebraEvidence (B : BanachAlgebraPackage) where
  normedAlgebraClosed : B.normedAlgebra
  completenessClosed : B.completeness
  multiplicativeIdentityClosed : B.multiplicativeIdentity
  submultiplicativityClosed : B.submultiplicativity

def BanachAlgebraClosed (B : BanachAlgebraPackage) : Prop :=
  B.normedAlgebra ∧ B.completeness ∧ B.multiplicativeIdentity ∧ B.submultiplicativity

theorem banach_algebra_closed_from_evidence (B : BanachAlgebraPackage) (E : BanachAlgebraEvidence B) :
  BanachAlgebraClosed B := by
  exact And.intro E.normedAlgebraClosed
    (And.intro E.completenessClosed
      (And.intro E.multiplicativeIdentityClosed E.submultiplicativityClosed))

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
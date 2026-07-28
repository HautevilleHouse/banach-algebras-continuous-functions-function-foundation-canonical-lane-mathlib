import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure BanachAlgebraPackage where
  algebra : BanachAlgebra
  submultiplicative : ∀ x y : algebra.carrier, algebra.norm (algebra.mul x y) ≤ algebra.norm x * algebra.norm y
  unital : ∃ e : algebra.carrier, ∀ x : algebra.carrier, algebra.mul e x = x ∧ algebra.mul x e = x

default

structure BanachAlgebraEvidence (P : BanachAlgebraPackage) where
  submultiplicativeClosed : P.submultiplicative
  unitalClosed : P.unital

default

def BanachAlgebraClosed (P : BanachAlgebraPackage) : Prop :=
  P.submultiplicative ∧ P.unital

theorem banach_algebra_closed_from_evidence (P : BanachAlgebraPackage) (E : BanachAlgebraEvidence P) :
    BanachAlgebraClosed P :=
  by
    exact And.intro E.submultiplicativeClosed E.unitalClosed

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
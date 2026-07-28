import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.ContinuousFunctionAlgebra
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.SpectrumPackage

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure CStarAlgebra (A : BanachAlgebraPackage) where
  involution : A.carrier → A.carrier
  cstarProperty : ∀ x, A.norm (A.mul x (involution x)) = (A.norm x)^2

structure ContinuousFunctionalCalculusPackage (A : CStarAlgebra) (x : A.carrier) where
  spectrum : Set ℂ
  calculus : ContinuousFunctionAlgebra (SpectrumPackage.carrier (some)) → A.carrier
  homomorphism : ∀ f g, calculus (f + g) = calculus f + calculus g ∧ calculus (f * g) = calculus f * calculus g
  spectralMapping : ∀ f, Spectrum.carrier (calculus f) = f '' Spectrum.carrier x

structure FunctionalCalculusEvidence {A : CStarAlgebra} {x : A.carrier} (F : ContinuousFunctionalCalculusPackage A x) where
  homomorphism_closed : F.homomorphism
  spectralMapping_closed : F.spectralMapping

def FunctionalCalculusClosed {A : CStarAlgebra} {x : A.carrier} (F : ContinuousFunctionalCalculusPackage A x) : Prop :=
  F.homomorphism ∧ F.spectralMapping

theorem functional_calculus_closed_from_evidence {A : CStarAlgebra} {x : A.carrier} (F : ContinuousFunctionalCalculusPackage A x) (E : FunctionalCalculusEvidence F) :
    FunctionalCalculusClosed F := by
  exact And.intro E.homomorphism_closed E.spectralMapping_closed

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse

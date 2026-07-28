import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.BanachAlgebraFoundation

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure SpectrumPackage (A : BanachAlgebraPackage) where
  carrier : A.carrier → Set ℂ
  spectralRadius : (A.carrier → ℝ) := λ x => sup { |z| | z ∈ carrier x }
  spectralRadiusFormula : ∀ x, spectralRadius x = liminf (n→∞) (A.norm (A.mul x (A.mul x ... )))^(1/n)  -- placeholder

structure SpectrumEvidence {A : BanachAlgebraPackage} (S : SpectrumPackage A) where
  spectralRadiusFormula_closed : S.spectralRadiusFormula

def SpectrumClosed {A : BanachAlgebraPackage} (S : SpectrumPackage A) : Prop :=
  S.spectralRadiusFormula

theorem spectrum_closed_from_evidence {A : BanachAlgebraPackage} (S : SpectrumPackage A) (E : SpectrumEvidence S) :
    SpectrumClosed S := by
  exact E.spectralRadiusFormula_closed

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse

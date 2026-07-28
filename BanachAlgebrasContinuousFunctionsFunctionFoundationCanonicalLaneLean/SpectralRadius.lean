import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.BanachAlgebra

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure SpectralRadiusPackage (B : BanachAlgebraPackage) where
  spectralRadius : B.carrier → ℝ
  spectralRadiusFormula : ∀ a, spectralRadius a = ⨅ n : ℕ, (B.norm (a ^ (2^n))) ^ (1 / (2^n : ℝ))
  spectralRadiusSubadditive : ∀ a b, spectralRadius (a + b) ≤ spectralRadius a + spectralRadius b
  spectralRadiusMultiplicative : ∀ a b, spectralRadius (a * b) ≤ spectralRadius a * spectralRadius b

structure SpectralRadiusEvidence {B : BanachAlgebraPackage} (S : SpectralRadiusPackage B) where
  spectralRadiusFormula_closed : S.spectralRadiusFormula
  spectralRadiusSubadditive_closed : S.spectralRadiusSubadditive
  spectralRadiusMultiplicative_closed : S.spectralRadiusMultiplicative

def SpectralRadiusClosed {B : BanachAlgebraPackage} (S : SpectralRadiusPackage B) : Prop :=
  S.spectralRadiusFormula ∧ S.spectralRadiusSubadditive ∧ S.spectralRadiusMultiplicative

theorem spectral_radius_closed_from_evidence {B : BanachAlgebraPackage} (S : SpectralRadiusPackage B) (E : SpectralRadiusEvidence S) : SpectralRadiusClosed S := by
  exact And.intro E.spectralRadiusFormula_closed (And.intro E.spectralRadiusSubadditive_closed E.spectralRadiusMultiplicative_closed)

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
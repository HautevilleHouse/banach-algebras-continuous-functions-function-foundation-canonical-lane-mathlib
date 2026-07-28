import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.BanachAlgebraStructure

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure GelfandTransformPackage (A : BanachAlgebraPackage) where
  characterSpace : Set (A.algebra.carrier → ℂ)
  gelfandTransform : A.algebra.carrier → (characterSpace → ℂ)
  isometric : ∀ x : A.algebra.carrier, ‖gelfandTransform x‖ = ‖x‖
  spectrumIncluded : ∀ x : A.algebra.carrier, spectrum A x ⊆ Set.range (gelfandTransform x)

default

structure GelfandTransformEvidence {A : BanachAlgebraPackage} (G : GelfandTransformPackage A) where
  isometricClosed : ∀ x : A.algebra.carrier, ‖G.gelfandTransform x‖ = ‖x‖
  spectrumIncludedClosed : ∀ x : A.algebra.carrier, spectrum A x ⊆ Set.range (G.gelfandTransform x)

default

def GelfandTransformClosed {A : BanachAlgebraPackage} (G : GelfandTransformPackage A) : Prop :=
  (∀ x : A.algebra.carrier, ‖G.gelfandTransform x‖ = ‖x‖) ∧
  (∀ x : A.algebra.carrier, spectrum A x ⊆ Set.range (G.gelfandTransform x))

theorem gelfand_transform_closed_from_evidence {A : BanachAlgebraPackage}
    (G : GelfandTransformPackage A) (E : GelfandTransformEvidence G) : GelfandTransformClosed G :=
  by
    exact And.intro E.isometricClosed E.spectrumIncludedClosed

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
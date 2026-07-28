import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure GelfandTransformPackage {X : Type} [TopologicalSpace X] [CompactSpace X]
  (A : BanachAlgebraPackage) (C : ContinuousFunctionAlgebraPackage X) where
  isometricIsomorphism : Prop
  preservesSpectrum : Prop
  mapsToContinuousFunctions : Prop
  inverseExists : Prop
  propertiesClosed : isometricIsomorphism ∧ preservesSpectrum ∧ mapsToContinuousFunctions ∧ inverseExists

structure GelfandTransformEvidence {X : Type} [TopologicalSpace X] [CompactSpace X]
  {A : BanachAlgebraPackage} {C : ContinuousFunctionAlgebraPackage X}
  (G : GelfandTransformPackage A C) where
  isometricIsomorphismClosed : G.isometricIsomorphism
  preservesSpectrumClosed : G.preservesSpectrum
  mapsToContinuousFunctionsClosed : G.mapsToContinuousFunctions
  inverseExistsClosed : G.inverseExists

def GelfandTransformClosed {X : Type} [TopologicalSpace X] [CompactSpace X]
  {A : BanachAlgebraPackage} {C : ContinuousFunctionAlgebraPackage X}
  (G : GelfandTransformPackage A C) : Prop :=
  G.isometricIsomorphism ∧ G.preservesSpectrum ∧ G.mapsToContinuousFunctions ∧ G.inverseExists

theorem gelmand_transform_closed_from_evidence {X : Type} [TopologicalSpace X] [CompactSpace X]
  {A : BanachAlgebraPackage} {C : ContinuousFunctionAlgebraPackage X}
  (G : GelfandTransformPackage A C) (E : GelfandTransformEvidence G) :
  GelfandTransformClosed G := by
  exact And.intro E.isometricIsomorphismClosed
    (And.intro E.preservesSpectrumClosed
      (And.intro E.mapsToContinuousFunctionsClosed E.inverseExistsClosed))

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
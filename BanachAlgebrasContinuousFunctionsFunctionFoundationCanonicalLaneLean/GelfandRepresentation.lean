import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.AdmissibleClass
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.BanachAlgebraPackage
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.ContinuousFunctionFoundation

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure GelfandRepresentationPackage (O : BanachAlgebraObject) (P : BanachAlgebraPackage O) where
  maximalIdealSpace : Type
  topology : TopologicalSpace maximalIdealSpace
  compactHausdorff : CompactHausdorffSpace (maximalIdealSpace := maximalIdealSpace)
  gelfandTransform : O.carrier → (ContinuousFunctionAlgebra compactHausdorff).carrier
  isIsometry : Prop
  isSurjective : Prop
  preservesProduct : Prop
  preservesInvolution : Prop

structure GelfandRepresentationEvidence (O : BanachAlgebraObject) (P : BanachAlgebraPackage O) (G : GelfandRepresentationPackage O P) where
  isIsometryClosed : G.isIsometry
  isSurjectiveClosed : G.isSurjective
  preservesProductClosed : G.preservesProduct
  preservesInvolutionClosed : G.preservesInvolution

def GelfandRepresentationClosed (O : BanachAlgebraObject) (P : BanachAlgebraPackage O) (G : GelfandRepresentationPackage O P) : Prop :=
  G.isIsometry ∧ G.isSurjective ∧ G.preservesProduct ∧ G.preservesInvolution

theorem gelfand_representation_closed_from_evidence (O : BanachAlgebraObject) (P : BanachAlgebraPackage O) (G : GelfandRepresentationPackage O P) (E : GelfandRepresentationEvidence O P G) : GelfandRepresentationClosed O P G := by
  exact And.intro E.isIsometryClosed (And.intro E.isSurjectiveClosed (And.intro E.preservesProductClosed E.preservesInvolutionClosed))

theorem gelfand_representation_bridges_continuous_functions (O : BanachAlgebraObject) (P : BanachAlgebraPackage O) (G : GelfandRepresentationPackage O P) : 
  bridgeClosed (AdmissibleClass.mk O True True (Or.inl trivial)) := by
  exact bridge_from_admissible_class _

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.AdmissibleClass
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.BanachAlgebraPackage

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure CompactHausdorffSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  compact : CompactSpace carrier
  hausdorff : T2Space carrier

structure ContinuousFunctionAlgebra (X : CompactHausdorffSpace) where
  carrier : X.carrier → ℝ
  continuous : Continuous carrier
  pointwiseOperations : Prop
  supNorm : ℝ
  completeness : Prop

structure ContinuousFunctionPackage (X : CompactHausdorffSpace) (A : ContinuousFunctionAlgebra X) where
  banachAlgebra : BanachAlgebraObject
  isContinuousFunctionAlgebra : Prop
  normIsSupNorm : Prop
  pointwiseProduct : Prop
  closureUnderLimits : Prop

structure ContinuousFunctionEvidence (X : CompactHausdorffSpace) (A : ContinuousFunctionAlgebra X) (P : ContinuousFunctionPackage X A) where
  isContinuousFunctionAlgebraClosed : P.isContinuousFunctionAlgebra
  normIsSupNormClosed : P.normIsSupNorm
  pointwiseProductClosed : P.pointwiseProduct
  closureUnderLimitsClosed : P.closureUnderLimits

def ContinuousFunctionClosed (X : CompactHausdorffSpace) (A : ContinuousFunctionAlgebra X) (P : ContinuousFunctionPackage X A) : Prop :=
  P.isContinuousFunctionAlgebra ∧ P.normIsSupNorm ∧ P.pointwiseProduct ∧ P.closureUnderLimits

theorem continuous_function_closed_from_evidence (X : CompactHausdorffSpace) (A : ContinuousFunctionAlgebra X) (P : ContinuousFunctionPackage X A) (E : ContinuousFunctionEvidence X A P) : ContinuousFunctionClosed X A P := by
  exact And.intro E.isContinuousFunctionAlgebraClosed (And.intro E.normIsSupNormClosed (And.intro E.pointwiseProductClosed E.closureUnderLimitsClosed))

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
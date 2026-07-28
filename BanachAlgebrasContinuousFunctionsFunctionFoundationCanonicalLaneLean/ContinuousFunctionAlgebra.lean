import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure ContinuousFunctionAlgebraPackage (X : Type) [TopologicalSpace X] [CompactSpace X] where
  uniformNorm : Prop
  starAlgebra : Prop
  gelmandTransform : Prop
  commutative : Prop
  propertiesClosed : uniformNorm ∧ starAlgebra ∧ gelmandTransform ∧ commutative

structure ContinuousFunctionAlgebraEvidence {X : Type} [TopologicalSpace X] [CompactSpace X]
  (C : ContinuousFunctionAlgebraPackage X) where
  uniformNormClosed : C.uniformNorm
  starAlgebraClosed : C.starAlgebra
  gelmandTransformClosed : C.gelmandTransform
  commutativeClosed : C.commutative

def ContinuousFunctionAlgebraClosed {X : Type} [TopologicalSpace X] [CompactSpace X]
  (C : ContinuousFunctionAlgebraPackage X) : Prop :=
  C.uniformNorm ∧ C.starAlgebra ∧ C.gelmandTransform ∧ C.commutative

theorem continuous_function_algebra_closed_from_evidence {X : Type} [TopologicalSpace X] [CompactSpace X]
  (C : ContinuousFunctionAlgebraPackage X) (E : ContinuousFunctionAlgebraEvidence C) :
  ContinuousFunctionAlgebraClosed C := by
  exact And.intro E.uniformNormClosed
    (And.intro E.starAlgebraClosed
      (And.intro E.gelmandTransformClosed E.commutativeClosed))

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure ContinuousFunctionsPackage (X : Type u) [TopologicalSpace X] [CompactSpace X] where
  algebra : BanachAlgebraPackage
  isCofX : Prop
  pointwiseOperationsDefined : Prop
  supNormDefined : Prop

structure ContinuousFunctionsEvidence {X : Type u} [TopologicalSpace X] [CompactSpace X] (P : ContinuousFunctionsPackage X) where
  isCofXClosed : P.isCofX
  pointwiseOperationsDefinedClosed : P.pointwiseOperationsDefined
  supNormDefinedClosed : P.supNormDefined

def ContinuousFunctionsClosed {X : Type u} [TopologicalSpace X] [CompactSpace X] (P : ContinuousFunctionsPackage X) : Prop :=
  P.isCofX ∧ P.pointwiseOperationsDefined ∧ P.supNormDefined

theorem continuous_functions_closed_from_evidence {X : Type u} [TopologicalSpace X] [CompactSpace X] (P : ContinuousFunctionsPackage X) (E : ContinuousFunctionsEvidence P) : ContinuousFunctionsClosed P :=
  And.intro E.isCofXClosed (And.intro E.pointwiseOperationsDefinedClosed E.supNormDefinedClosed)

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
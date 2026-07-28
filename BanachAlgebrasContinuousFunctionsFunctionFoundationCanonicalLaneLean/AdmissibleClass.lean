import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

structure BanachAlgebraObject where
  carrier : Type
  norm : carrier → ℝ
  algebraStructure : Prop
  completeness : Prop
  continuousFunctions : Prop

structure AdmissibleClass where
  object : BanachAlgebraObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BanachAlgebraWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
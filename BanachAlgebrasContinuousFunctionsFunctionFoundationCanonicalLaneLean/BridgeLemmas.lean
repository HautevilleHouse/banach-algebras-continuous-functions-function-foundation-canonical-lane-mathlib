import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

def BanachAlgebraWitnessClosed (O : BanachAlgebraObject) : Prop :=
  O.algebraStructure ∧ O.completeness ∧ O.continuousFunctions

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BanachAlgebraWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.gateWitness.elim (fun h => h) (fun h => h)

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
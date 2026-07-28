import BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BanachSpace where
  carrier : Type
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier

default

structure BanachAlgebra where
  carrier : Type
  norm : carrier → ℝ
  mul : carrier → carrier → carrier
  normedRing : NormedRing carrier
  norm_mul : ∀ x y, norm (mul x y) ≤ norm x * norm y

default

structure ContinuousFunctionAlgebra (X : Type) [TopologicalSpace X] [CompactSpace X] where
  carrier : Set (X → ℂ)
  pointwiseOperations : Subalgebra ℂ (X → ℂ)
  supNorm : Norm (Subtype carrier)
  complete : CompleteSpace (Subtype carrier)

default

structure CStarAlgebra where
  carrier : Type
  norm : carrier → ℝ
  involution : carrier → carrier
  norm_mul : ∀ x y, norm (x*y) ≤ norm x * norm y
  CStarIdentity : ∀ x, norm (x*x†) = norm x ^ 2

default

structure BanachAlgebraAdmittedObject where
  algebra : BanachAlgebra
  commutative : Prop
  unital : Prop
  conclusion : commutative ∨ unital

default

structure BanachAlgebraEndgameState where
  object : BanachAlgebraAdmittedObject

default

def BanachWitnessClosed (O : BanachAlgebraAdmittedObject) : Prop :=
  O.commulative ∨ O.unital

end BanachAlgebrasContinuousFunctionsFunctionFoundationCanonicalLaneLean
end HautevilleHouse
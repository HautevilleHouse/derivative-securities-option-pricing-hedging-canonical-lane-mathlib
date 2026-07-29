import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure BrownianMotionPDEPackage where
  probabilitySpace : Type u
  sampleSpace : Type v
  filtration : Type w
  adaptedProcess : Type x
  brownianMotion : Type y
  itoIntegral : Type z
  sigmaAlgebra : Prop
  continuousPaths : Prop
  independentIncrements : Prop
  gaussianIncrements : Prop
  itoIsometry : Prop

structure BrownianMotionPDEEvidence (B : BrownianMotionPDEPackage) where
  sigmaAlgebraClosed : B.sigmaAlgebra
  continuousPathsClosed : B.continuousPaths
  independentIncrementsClosed : B.independentIncrements
  gaussianIncrementsClosed : B.gaussianIncrements
  itoIsometryClosed : B.itoIsometry

def BrownianMotionPDEClosed (B : BrownianMotionPDEPackage) : Prop :=
  B.sigmaAlgebra ∧ B.continuousPaths ∧ B.independentIncrements ∧
  B.gaussianIncrements ∧ B.itoIsometry

theorem brownian_motion_pde_closed_from_evidence
    (B : BrownianMotionPDEPackage) (E : BrownianMotionPDEEvidence B) :
    BrownianMotionPDEClosed B := by
  exact And.intro E.sigmaAlgebraClosed
    (And.intro E.continuousPathsClosed
      (And.intro E.independentIncrementsClosed
        (And.intro E.gaussianIncrementsClosed E.itoIsometryClosed)))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
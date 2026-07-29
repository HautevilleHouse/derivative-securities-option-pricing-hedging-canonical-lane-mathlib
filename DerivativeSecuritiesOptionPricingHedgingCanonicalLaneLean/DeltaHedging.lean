import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure DeltaHedgingPackage {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} where
  deltaSensitivity : Prop
  hedgeRatio : Prop
  selfFinancing : Prop
  hedgeReplicates : Prop

structure DeltaHedgingEvidence {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} (D : DeltaHedgingPackage B) where
  deltaSensitivityClosed : D.deltaSensitivity
  hedgeRatioClosed : D.hedgeRatio
  selfFinancingClosed : D.selfFinancing
  hedgeReplicatesClosed : D.hedgeReplicates

def DeltaHedgingClosed {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} (D : DeltaHedgingPackage B) : Prop :=
  D.deltaSensitivity ∧ D.hedgeRatio ∧ D.selfFinancing ∧ D.hedgeReplicates

theorem delta_hedging_closed_from_evidence
    {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} (D : DeltaHedgingPackage B) (E : DeltaHedgingEvidence D) :
    DeltaHedgingClosed D := by
  exact And.intro E.deltaSensitivityClosed (And.intro E.hedgeRatioClosed (And.intro E.selfFinancingClosed E.hedgeReplicatesClosed))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
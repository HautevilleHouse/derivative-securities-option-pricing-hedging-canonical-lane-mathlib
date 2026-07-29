import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure GeometricBrownianMotionPackage where
  drift : ℝ
  volatility : ℝ
  initialPrice : ℝ
  timeHorizon : ℝ
  logNormalDistribution : Prop
  martingalePropertyUnderRiskNeutral : Prop

structure GeometricBrownianMotionEvidence (G : GeometricBrownianMotionPackage) where
  logNormalDistributionClosed : G.logNormalDistribution
  martingalePropertyUnderRiskNeutralClosed : G.martingalePropertyUnderRiskNeutral

def GeometricBrownianMotionClosed (G : GeometricBrownianMotionPackage) : Prop :=
  G.logNormalDistribution ∧ G.martingalePropertyUnderRiskNeutral

theorem geometric_brownian_motion_closed_from_evidence
    (G : GeometricBrownianMotionPackage) (E : GeometricBrownianMotionEvidence G) :
    GeometricBrownianMotionClosed G := by
  exact And.intro E.logNormalDistributionClosed E.martingalePropertyUnderRiskNeutralClosed

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
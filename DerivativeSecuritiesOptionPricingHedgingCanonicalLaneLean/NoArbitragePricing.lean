import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure NoArbitragePricingPackage {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} where
  marketComplete : Prop
  uniqueMartingaleMeasure : Prop
  priceUniqueness : Prop
  replicationStrategy : Prop

structure NoArbitragePricingEvidence {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} (N : NoArbitragePricingPackage B) where
  marketCompleteClosed : N.marketComplete
  uniqueMartingaleMeasureClosed : N.uniqueMartingaleMeasure
  priceUniquenessClosed : N.priceUniqueness
  replicationStrategyClosed : N.replicationStrategy

def NoArbitragePricingClosed {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} (N : NoArbitragePricingPackage B) : Prop :=
  N.marketComplete ∧ N.uniqueMartingaleMeasure ∧ N.priceUniqueness ∧ N.replicationStrategy

theorem no_arbitrage_pricing_closed_from_evidence
    {G : GeometricBrownianMotionPackage} {B : BlackScholesPDEPackage G} (N : NoArbitragePricingPackage B) (E : NoArbitragePricingEvidence N) :
    NoArbitragePricingClosed N := by
  exact And.intro E.marketCompleteClosed (And.intro E.uniqueMartingaleMeasureClosed (And.intro E.priceUniquenessClosed E.replicationStrategyClosed))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
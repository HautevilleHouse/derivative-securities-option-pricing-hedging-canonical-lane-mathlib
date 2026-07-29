import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure HedgingReplicationPackage where
  portfolio : Type u
  selfFinancing : Prop
  replicatingStrategy : Prop
  hedgingCost : Prop
  completeness : Prop
  noArbitrage : Prop

structure HedgingReplicationEvidence (H : HedgingReplicationPackage) where
  selfFinancingClosed : H.selfFinancing
  replicatingStrategyClosed : H.replicatingStrategy
  hedgingCostClosed : H.hedgingCost
  completenessClosed : H.completeness
  noArbitrageClosed : H.noArbitrage

def HedgingReplicationClosed (H : HedgingReplicationPackage) : Prop :=
  H.selfFinancing ∧ H.replicatingStrategy ∧ H.hedgingCost ∧ H.completeness ∧ H.noArbitrage

theorem hedging_replication_closed_from_evidence (H : HedgingReplicationPackage) (E : HedgingReplicationEvidence H) : HedgingReplicationClosed H := by
  exact And.intro E.selfFinancingClosed (And.intro E.replicatingStrategyClosed (And.intro E.hedgingCostClosed (And.intro E.completenessClosed E.noArbitrageClosed)))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
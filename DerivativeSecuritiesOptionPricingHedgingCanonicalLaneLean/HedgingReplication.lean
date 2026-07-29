import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure HedgingReplicationPackage where
  derivativeContract : Type u
  underlyingAsset : Type v
  tradingStrategy : Type w
  selfFinancingCondition : Prop
  replicationCondition : Prop
  admissibleStrategy : Prop
  completenessMakesReplicationUnique : Prop

structure HedgingReplicationEvidence (H : HedgingReplicationPackage) where
  selfFinancingConditionClosed : H.selfFinancingCondition
  replicationConditionClosed : H.replicationCondition
  admissibleStrategyClosed : H.admissibleStrategy
  completenessMakesReplicationUniqueClosed : H.completenessMakesReplicationUnique

def HedgingReplicationClosed (H : HedgingReplicationPackage) : Prop :=
  H.selfFinancingCondition ∧ H.replicationCondition ∧
  H.admissibleStrategy ∧ H.completenessMakesReplicationUnique

theorem hedging_replication_closed_from_evidence (H : HedgingReplicationPackage)
    (E : HedgingReplicationEvidence H) : HedgingReplicationClosed H := by
  exact And.intro E.selfFinancingConditionClosed
    (And.intro E.replicationConditionClosed
      (And.intro E.admissibleStrategyClosed E.completenessMakesReplicationUniqueClosed))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure HedgingStrategyPackage where
  portfolio : Type u
  derivative : Type v
  hedgeRatio : Type w
  deltaHedge : Prop
  gammaHedge : Prop
  vegaHedge : Prop
  thetaHedge : Prop
  rhoHedge : Prop
  selfFinancing : Prop
  replicatingCost : Prop

structure HedgingStrategyEvidence (H : HedgingStrategyPackage) where
  deltaHedgeClosed : H.deltaHedge
  gammaHedgeClosed : H.gammaHedge
  vegaHedgeClosed : H.vegaHedge
  thetaHedgeClosed : H.thetaHedge
  rhoHedgeClosed : H.rhoHedge
  selfFinancingClosed : H.selfFinancing
  replicatingCostClosed : H.replicatingCost

def HedgingStrategyClosed (H : HedgingStrategyPackage) : Prop :=
  H.deltaHedge ∧ H.gammaHedge ∧ H.vegaHedge ∧ H.thetaHedge ∧
  H.rhoHedge ∧ H.selfFinancing ∧ H.replicatingCost

theorem hedging_strategy_closed_from_evidence
    (H : HedgingStrategyPackage) (E : HedgingStrategyEvidence H) :
    HedgingStrategyClosed H := by
  exact And.intro E.deltaHedgeClosed
    (And.intro E.gammaHedgeClosed
      (And.intro E.vegaHedgeClosed
        (And.intro E.thetaHedgeClosed
          (And.intro E.rhoHedgeClosed
            (And.intro E.selfFinancingClosed E.replicatingCostClosed)))))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
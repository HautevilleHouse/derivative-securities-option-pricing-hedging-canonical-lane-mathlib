import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure BlackScholesPDEPackage where
  underlyingPrice : Type u
  timeToMaturity : Type v
  volatility : Type w
  riskFreeRate : Type x
  optionPrice : Type y
  continuousTrading : Prop
  noArbitrage : Prop
  lognormalReturns : Prop
  closedFormSolution : Prop
  replicatingPortfolio : Prop

structure BlackScholesPDEEvidence (B : BlackScholesPDEPackage) where
  continuousTradingClosed : B.continuousTrading
  noArbitrageClosed : B.noArbitrage
  lognormalReturnsClosed : B.lognormalReturns
  closedFormSolutionClosed : B.closedFormSolution
  replicatingPortfolioClosed : B.replicatingPortfolio

def BlackScholesPDEClosed (B : BlackScholesPDEPackage) : Prop :=
  B.continuousTrading ∧ B.noArbitrage ∧ B.lognormalReturns ∧
  B.closedFormSolution ∧ B.replicatingPortfolio

theorem black_scholes_pde_closed_from_evidence
    (B : BlackScholesPDEPackage) (E : BlackScholesPDEEvidence B) :
    BlackScholesPDEClosed B := by
  exact And.intro E.continuousTradingClosed
    (And.intro E.noArbitrageClosed
      (And.intro E.lognormalReturnsClosed
        (And.intro E.closedFormSolutionClosed E.replicatingPortfolioClosed)))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
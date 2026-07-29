import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure ReplicatingPortfolioPackage (A : AdmissibleClass) where
  hedgePositions : ℝ → ℝ
  initialCost : ℝ
  selfFinancing : Prop
  terminalPayoffMatch : Prop

def ReplicatingPortfolioClosed {A : AdmissibleClass} (P : ReplicatingPortfolioPackage A) : Prop :=
  P.selfFinancing ∧ P.terminalPayoffMatch

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse

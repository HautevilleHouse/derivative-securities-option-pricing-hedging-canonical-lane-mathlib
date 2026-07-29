import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure BlackScholesParameter where
  volatility : ℝ
  interestRate : ℝ
  dividendYield : ℝ
  maturity : ℝ
  strikePrice : ℝ
  optionType : OptionStyle

inductive OptionStyle where
  | call
  | put
  deriving DecidableEq

structure BlackScholesFormula where
  parameters : BlackScholesParameter
  price : ℝ
  delta : ℝ
  gamma : ℝ
  vega : ℝ
  theta : ℝ
  rho : ℝ
  priceComputed : price = 0 -- placeholder
  greeksConsistent : Prop
  priceComputedTerm : priceComputed
  greeksConsistentTerm : greeksConsistent

structure BlackScholesPackage where
  formula : BlackScholesFormula
  pdeDerivation : Prop
  pdeDerivationTerm : pdeDerivation

def BlackScholesClosed (B : BlackScholesPackage) : Prop :=
  B.formula.priceComputed ∧ B.formula.greeksConsistent ∧ B.pdeDerivation

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure OptionPricingFormulaPackage where
  optionType : Type u
  strike : Prop
  maturity : Prop
  formula : Prop
  price : Prop
  greeks : Prop

structure OptionPricingFormulaEvidence (O : OptionPricingFormulaPackage) where
  strikeClosed : O.strike
  maturityClosed : O.maturity
  formulaClosed : O.formula
  priceClosed : O.price
  greeksClosed : O.greeks

def OptionPricingFormulaClosed (O : OptionPricingFormulaPackage) : Prop :=
  O.strike ∧ O.maturity ∧ O.formula ∧ O.price ∧ O.greeks

theorem option_pricing_formula_closed_from_evidence (O : OptionPricingFormulaPackage) (E : OptionPricingFormulaEvidence O) : OptionPricingFormulaClosed O := by
  exact And.intro E.strikeClosed (And.intro E.maturityClosed (And.intro E.formulaClosed (And.intro E.priceClosed E.greeksClosed)))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
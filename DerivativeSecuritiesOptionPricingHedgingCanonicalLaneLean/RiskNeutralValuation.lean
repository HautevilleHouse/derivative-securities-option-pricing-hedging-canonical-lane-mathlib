import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure RiskNeutralValuationPackage (A : AdmissibleClass) where
  riskNeutralMeasure : Prop
  discountedExpectationFormula : Prop
  completeness : Prop
  fairPriceDetermined : Prop

def RiskNeutralValuationClosed {A : AdmissibleClass} (R : RiskNeutralValuationPackage A) : Prop :=
  R.riskNeutralMeasure ∧ R.discountedExpectationFormula ∧ R.completeness ∧ R.fairPriceDetermined

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse

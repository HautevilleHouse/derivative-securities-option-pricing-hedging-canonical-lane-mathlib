import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure RiskNeutralValuationPackage where
  riskNeutralMeasure : Type u
  discountedPriceProcess : Prop
  conditionalExpectation : Prop
  noFreeLunch : Prop
  martingaleRepresentation : Prop

structure RiskNeutralValuationEvidence (R : RiskNeutralValuationPackage) where
  riskNeutralMeasureClosed : R.riskNeutralMeasure
  discountedPriceProcessClosed : R.discountedPriceProcess
  conditionalExpectationClosed : R.conditionalExpectation
  noFreeLunchClosed : R.noFreeLunch
  martingaleRepresentationClosed : R.martingaleRepresentation

def RiskNeutralValuationClosed (R : RiskNeutralValuationPackage) : Prop :=
  R.riskNeutralMeasure ∧ R.discountedPriceProcess ∧ R.conditionalExpectation ∧ R.noFreeLunch ∧ R.martingaleRepresentation

theorem risk_neutral_valuation_closed_from_evidence (R : RiskNeutralValuationPackage) (E : RiskNeutralValuationEvidence R) : RiskNeutralValuationClosed R := by
  exact And.intro E.riskNeutralMeasureClosed (And.intro E.discountedPriceProcessClosed (And.intro E.conditionalExpectationClosed (And.intro E.noFreeLunchClosed E.martingaleRepresentationClosed)))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
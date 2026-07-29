import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure RiskNeutralMeasurePackage where
  physicalMeasure : Type u
  riskNeutralMeasure : Type v
  radonNikodymDerivative : Type w
  numeraire : Type x
  martingaleProperty : Prop
  equivalentMartingaleMeasure : Prop
  completeness : Prop
  noArbitrage : Prop
  priceUniqueness : Prop

structure RiskNeutralMeasureEvidence (R : RiskNeutralMeasurePackage) where
  martingalePropertyClosed : R.martingaleProperty
  equivalentMartingaleMeasureClosed : R.equivalentMartingaleMeasure
  completenessClosed : R.completeness
  noArbitrageClosed : R.noArbitrage
  priceUniquenessClosed : R.priceUniqueness

def RiskNeutralMeasureClosed (R : RiskNeutralMeasurePackage) : Prop :=
  R.martingaleProperty ∧ R.equivalentMartingaleMeasure ∧
  R.completeness ∧ R.noArbitrage ∧ R.priceUniqueness

theorem risk_neutral_measure_closed_from_evidence
    (R : RiskNeutralMeasurePackage) (E : RiskNeutralMeasureEvidence R) :
    RiskNeutralMeasureClosed R := by
  exact And.intro E.martingalePropertyClosed
    (And.intro E.equivalentMartingaleMeasureClosed
      (And.intro E.completenessClosed
        (And.intro E.noArbitrageClosed E.priceUniquenessClosed)))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure MartingaleMeasurePackage where
  originalMeasure : Type u
  equivalentMartingaleMeasure : Type v
  radonNikodymDerivative : Prop
  numeraire : Prop
  martingaleProperty : Prop
  completeness : Prop

structure MartingaleMeasureEvidence (M : MartingaleMeasurePackage) where
  equivalentMartingaleMeasureClosed : M.equivalentMartingaleMeasure
  radonNikodymDerivativeClosed : M.radonNikodymDerivative
  numeraireClosed : M.numeraire
  martingalePropertyClosed : M.martingaleProperty
  completenessClosed : M.completeness

def MartingaleMeasureClosed (M : MartingaleMeasurePackage) : Prop :=
  M.equivalentMartingaleMeasure ∧ M.radonNikodymDerivative ∧ M.numeraire ∧ M.martingaleProperty ∧ M.completeness

theorem martingale_measure_closed_from_evidence (M : MartingaleMeasurePackage) (E : MartingaleMeasureEvidence M) : MartingaleMeasureClosed M := by
  exact And.intro E.equivalentMartingaleMeasureClosed (And.intro E.radonNikodymDerivativeClosed (And.intro E.numeraireClosed (And.intro E.martingalePropertyClosed E.completenessClosed)))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
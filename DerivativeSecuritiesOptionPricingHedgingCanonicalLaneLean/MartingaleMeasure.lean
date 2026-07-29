import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure MartingaleMeasurePackage (A : AdmissibleClass) where
  underlyingProcess : ℝ → ℝ
  equivalentMeasure : Prop
  numeraireDefined : Prop
  discountedPriceMartingale : Prop

def MartingaleMeasureClosed {A : AdmissibleClass} (M : MartingaleMeasurePackage A) : Prop :=
  M.equivalentMeasure ∧ M.discountedPriceMartingale

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse

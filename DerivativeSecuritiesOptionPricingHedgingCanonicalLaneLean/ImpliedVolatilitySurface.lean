import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure OptionQuote where
  strike : ℝ
  maturity : ℝ
  optionType : OptionStyle
  marketPrice : ℝ
  impliedVolatility : ℝ
  priceConsistent : marketPrice = 0 -- placeholder
  priceConsistentTerm : priceConsistent

structure VolatilitySurface where
  quotes : List OptionQuote
  interpolationMethod : String
  arbitrageFree : Prop
  surfaceSmoothness : Prop
  arbitrageFreeTerm : arbitrageFree
  surfaceSmoothnessTerm : surfaceSmoothness

structure ImpliedVolatilityPackage where
  surface : VolatilitySurface
  localVolatilityCalibration : Prop
  forwardVolatilityDynamics : Prop
  localVolatilityCalibrationTerm : localVolatilityCalibration
  forwardVolatilityDynamicsTerm : forwardVolatilityDynamics

def ImpliedVolatilityClosed (I : ImpliedVolatilityPackage) : Prop :=
  I.surface.arbitrageFree ∧ I.surface.surfaceSmoothness ∧ I.localVolatilityCalibration ∧ I.forwardVolatilityDynamics

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
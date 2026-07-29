import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure StochasticVolatilityPackage where
  volatilityProcess : Type u
  correlationStructure : Type v
  optionPriceDynamics : Type w
  hestonOrSimilarModel : Prop
  volatilityRiskPremium : Prop
  calibrationToMarketData : Prop
  hedgeWithVolatilityRisk : Prop

structure StochasticVolatilityEvidence (S : StochasticVolatilityPackage) where
  hestonOrSimilarModelClosed : S.hestonOrSimilarModel
  volatilityRiskPremiumClosed : S.volatilityRiskPremium
  calibrationToMarketDataClosed : S.calibrationToMarketData
  hedgeWithVolatilityRiskClosed : S.hedgeWithVolatilityRisk

def StochasticVolatilityClosed (S : StochasticVolatilityPackage) : Prop :=
  S.hestonOrSimilarModel ∧ S.volatilityRiskPremium ∧
  S.calibrationToMarketData ∧ S.hedgeWithVolatilityRisk

theorem stochastic_volatility_closed_from_evidence (S : StochasticVolatilityPackage)
    (E : StochasticVolatilityEvidence S) : StochasticVolatilityClosed S := by
  exact And.intro E.hestonOrSimilarModelClosed
    (And.intro E.volatilityRiskPremiumClosed
      (And.intro E.calibrationToMarketDataClosed E.hedgeWithVolatilityRiskClosed))

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
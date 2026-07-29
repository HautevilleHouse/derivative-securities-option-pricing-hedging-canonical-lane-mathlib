import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure SpotPriceProcess where
  underlyingAsset : Type
  price : Time → Price
  dynamics : Prop
  initialCondition : Prop
  dynamicsTerm : dynamics
  initialConditionTerm : initialCondition

structure SpotPriceProcessPackage where
  process : SpotPriceProcess
  volatilitySurface : Type
  driftStructure : Prop
  jumpComponent : Prop

def SpotPriceProcessClosed (P : SpotPriceProcessPackage) : Prop :=
  P.process.dynamics ∧ P.process.initialCondition ∧ P.driftStructure ∧ P.jumpComponent

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
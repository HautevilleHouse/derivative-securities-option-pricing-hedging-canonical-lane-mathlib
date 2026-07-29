import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure NoArbitrageConstraint where
  marketModel : Type
  discountFactor : Prop
  martingaleMeasureExistence : Prop
  selfFinancingCondition : Prop
  discountFactorTerm : discountFactor
  martingaleMeasureExistenceTerm : martingaleMeasureExistence
  selfFinancingConditionTerm : selfFinancingCondition

structure NoArbitragePackage where
  constraint : NoArbitrageConstraint
  completeness : Prop
  completenessTerm : completeness

def NoArbitrageClosed (N : NoArbitragePackage) : Prop :=
  N.constraint.martingaleMeasureExistence ∧ N.constraint.selfFinancingCondition ∧ N.completeness

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
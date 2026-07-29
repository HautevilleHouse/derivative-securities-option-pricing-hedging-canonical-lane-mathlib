import canonicalLaneMathlib.AdmissibleClass
import DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean.DeltaHedging

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

def ConstrainedOptionPricingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_option_pricing_endgame (A : AdmissibleClass) :
    ConstrainedOptionPricingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
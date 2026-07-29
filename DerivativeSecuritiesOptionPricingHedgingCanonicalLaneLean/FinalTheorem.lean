import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

def ConstrainedDerivativeSecuritiesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_derivative_securities_endgame (A : AdmissibleClass) :
    ConstrainedDerivativeSecuritiesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
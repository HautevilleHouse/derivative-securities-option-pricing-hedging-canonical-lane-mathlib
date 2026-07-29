import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  OptionPricingClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse

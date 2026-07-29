import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean

structure RiskNeutralPricingPackage where
  contingentClaim : Type u
  riskNeutralExpectation : Type v
  discountedPrice : Type w
  priceRepresentation : Prop
  expectationUnderRNMeasure : Prop
  completenessEnsuresUniquePrice : Prop

structure RiskNeutralPricingEvidence (R : RiskNeutralPricingPackage) where
  priceRepresentationClosed : R.priceRepresentation
  expectationUnderRNMeasureClosed : R.expectationUnderRNMeasure
  completenessEnsuresUniquePriceClosed : R.completenessEnsuresUniquePrice

def RiskNeutralPricingClosed (R : RiskNeutralPricingPackage) : Prop :=
  R.priceRepresentation ∧ R.expectationUnderRNMeasure ∧
  R.completenessEnsuresUniquePrice

theorem risk_neutral_pricing_closed_from_evidence (R : RiskNeutralPricingPackage)
    (E : RiskNeutralPricingEvidence R) : RiskNeutralPricingClosed R := by
  exact And.intro E.priceRepresentationClosed
    (And.intro E.expectationUnderRNMeasureClosed E.completenessEnsuresUniquePriceClosed)

end DerivativeSecuritiesOptionPricingHedgingCanonicalLaneLean
end HautevilleHouse
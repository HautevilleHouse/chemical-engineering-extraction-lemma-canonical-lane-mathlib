import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionYieldPackage where
  feedConcentration : Float
  solventToFeedRatio : Float
  distributionCoefficient : Float
  numberOfStages : Nat
  extractConcentration : Float
  raffinateConcentration : Float
  recoveryYield : Float
  yieldFormula : extractConcentration * (solventToFeedRatio) = recoveryYield * feedConcentration

def ExtractionYieldClosed (Y : ExtractionYieldPackage) : Prop :=
  Y.recoveryYield > 0 ∧ Y.yieldFormula

structure ExtractionYieldEvidence (Y : ExtractionYieldPackage) where
  recoveryYieldClosed : Y.recoveryYield > 0
  yieldFormulaClosed : Y.yieldFormula

theorem extraction_yield_closed_from_evidence (Y : ExtractionYieldPackage) (E : ExtractionYieldEvidence Y) :
    ExtractionYieldClosed Y := by
  exact And.intro E.recoveryYieldClosed E.yieldFormulaClosed

def ConstrainedExtractionYieldClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
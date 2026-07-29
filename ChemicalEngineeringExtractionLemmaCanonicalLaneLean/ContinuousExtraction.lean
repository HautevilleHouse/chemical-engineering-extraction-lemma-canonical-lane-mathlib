import ChemicalEngineeringExtractionLemmaCanonicalLaneLean.MassTransferKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ContinuousExtractionPackage {K : MassTransferKineticsPackage} where
  columnHeight : ℝ
  flowRates : ℝ × ℝ
  axialDispersion : Prop
  heightEquivalent : ℝ
  htuNumber : ℝ

structure ContinuousExtractionEvidence {K : MassTransferKineticsPackage}
    (C : ContinuousExtractionPackage K) where
  columnHeightClosed : C.columnHeight > 0
  flowRatesPositiveClosed : C.flowRates.1 > 0 ∧ C.flowRates.2 > 0
  axialDispersionClosed : C.axialDispersion
  heightEquivalentClosed : C.heightEquivalent > 0
  htuNumberClosed : C.htuNumber > 0

def ContinuousExtractionClosed {K : MassTransferKineticsPackage}
    (C : ContinuousExtractionPackage K) : Prop :=
  C.columnHeight > 0 ∧ C.flowRates.1 > 0 ∧ C.flowRates.2 > 0 ∧
  C.axialDispersion ∧ C.heightEquivalent > 0 ∧ C.htuNumber > 0

theorem continuous_extraction_closed_from_evidence {K : MassTransferKineticsPackage}
    (C : ContinuousExtractionPackage K) (Ev : ContinuousExtractionEvidence C) :
    ContinuousExtractionClosed C := by
  exact And.intro Ev.columnHeightClosed
    (And.intro (And.left Ev.flowRatesPositiveClosed)
      (And.intro (And.right Ev.flowRatesPositiveClosed)
        (And.intro Ev.axialDispersionClosed
          (And.intro Ev.heightEquivalentClosed Ev.htuNumberClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
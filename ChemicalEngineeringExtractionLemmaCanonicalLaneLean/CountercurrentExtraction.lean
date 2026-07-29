import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure CountercurrentExtractionPackage where
  feedFlowRate : Type u
  solventFlowRate : Type v
  soluteMassBalance : Prop
  operatingLineDerived : Prop
  minimumSolventRatio : Prop
  extractRaffinateProfiles : Prop

structure CountercurrentExtractionEvidence (C : CountercurrentExtractionPackage) where
  soluteMassBalanceClosed : C.soluteMassBalance
  operatingLineDerivedClosed : C.operatingLineDerived
  minimumSolventRatioClosed : C.minimumSolventRatio
  extractRaffinateProfilesClosed : C.extractRaffinateProfiles

def CountercurrentExtractionClosed (C : CountercurrentExtractionPackage) : Prop :=
  C.soluteMassBalance ∧ C.operatingLineDerived ∧ C.minimumSolventRatio ∧ C.extractRaffinateProfiles

theorem countercurrent_extraction_closed_from_evidence (C : CountercurrentExtractionPackage)
    (Ev : CountercurrentExtractionEvidence C) : CountercurrentExtractionClosed C := by
  exact And.intro Ev.soluteMassBalanceClosed (And.intro Ev.operatingLineDerivedClosed
    (And.intro Ev.minimumSolventRatioClosed Ev.extractRaffinateProfilesClosed))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
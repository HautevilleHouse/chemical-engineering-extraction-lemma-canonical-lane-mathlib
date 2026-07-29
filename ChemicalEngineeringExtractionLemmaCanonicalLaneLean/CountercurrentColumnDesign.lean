import canonicalLaneMathlib.MassTransferKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure CountercurrentColumnDesign {E : ExtractionPhaseEquilibrium} {M : MassTransferKinetics E} where
  columnHeight : Prop
  columnDiameter : Prop
  numberStages : Prop
  operatingLine : Prop
  equilibriumLine : Prop
  mccabeThieleConstruction : Prop

def CountercurrentColumnDesignClosed {E : ExtractionPhaseEquilibrium} {M : MassTransferKinetics E} (C : CountercurrentColumnDesign E M) : Prop :=
  C.columnHeight ∧ C.columnDiameter ∧ C.numberStages ∧ C.operatingLine ∧ C.equilibriumLine ∧ C.mccabeThieleConstruction

structure CountercurrentColumnDesignEvidence {E : ExtractionPhaseEquilibrium} {M : MassTransferKinetics E} (C : CountercurrentColumnDesign E M) where
  columnHeightClosed : C.columnHeight
  columnDiameterClosed : C.columnDiameter
  numberStagesClosed : C.numberStages
  operatingLineClosed : C.operatingLine
  equilibriumLineClosed : C.equilibriumLine
  mccabeThieleConstructionClosed : C.mccabeThieleConstruction

theorem countercurrent_column_design_closed_from_evidence {E : ExtractionPhaseEquilibrium} {M : MassTransferKinetics E} (C : CountercurrentColumnDesign E M) (ev : CountercurrentColumnDesignEvidence C) : CountercurrentColumnDesignClosed C := by
  exact And.intro ev.columnHeightClosed (And.intro ev.columnDiameterClosed (And.intro ev.numberStagesClosed (And.intro ev.operatingLineClosed (And.intro ev.equilibriumLineClosed ev.mccabeThieleConstructionClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
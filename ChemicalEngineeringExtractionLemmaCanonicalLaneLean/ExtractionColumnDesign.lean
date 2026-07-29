import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionColumnDesignPackage where
  columnDiameter : Prop
  columnHeight : Prop
  floodingVelocity : Prop
  holdup : Prop
  dispersePhase : Prop
  continuousPhase : Prop

structure ExtractionColumnDesignEvidence (D : ExtractionColumnDesignPackage) where
  columnDiameterClosed : D.columnDiameter
  columnHeightClosed : D.columnHeight
  floodingVelocityClosed : D.floodingVelocity
  holdupClosed : D.holdup
  dispersePhaseClosed : D.dispersePhase
  continuousPhaseClosed : D.continuousPhase

def ExtractionColumnDesignClosed (D : ExtractionColumnDesignPackage) : Prop :=
  D.columnDiameter ∧ D.columnHeight ∧ D.floodingVelocity ∧ D.holdup ∧ D.dispersePhase ∧ D.continuousPhase

theorem extraction_column_design_closed_from_evidence (D : ExtractionColumnDesignPackage)
    (Ev : ExtractionColumnDesignEvidence D) : ExtractionColumnDesignClosed D := by
  exact And.intro Ev.columnDiameterClosed (And.intro Ev.columnHeightClosed
    (And.intro Ev.floodingVelocityClosed (And.intro Ev.holdupClosed
      (And.intro Ev.dispersePhaseClosed Ev.continuousPhaseClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
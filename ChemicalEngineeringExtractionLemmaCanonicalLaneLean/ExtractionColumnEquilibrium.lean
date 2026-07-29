import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionColumnEquilibriumPackage where
  columnHeight : Prop
  numberOfStages : Prop
  equilibriumLine : Prop
  operatingLine : Prop
  feedPoint : Prop
  massTransferEfficiency : Prop

structure ExtractionColumnEquilibriumEvidence (E : ExtractionColumnEquilibriumPackage) where
  columnHeightClosed : E.columnHeight
  numberOfStagesClosed : E.numberOfStages
  equilibriumLineClosed : E.equilibriumLine
  operatingLineClosed : E.operatingLine
  feedPointClosed : E.feedPoint
  massTransferEfficiencyClosed : E.massTransferEfficiency

def ExtractionColumnEquilibriumClosed (E : ExtractionColumnEquilibriumPackage) : Prop :=
  E.columnHeight ∧ E.numberOfStages ∧ E.equilibriumLine ∧
  E.operatingLine ∧ E.feedPoint ∧ E.massTransferEfficiency

theorem extraction_column_equilibrium_closed_from_evidence
    (E : ExtractionColumnEquilibriumPackage)
    (Ev : ExtractionColumnEquilibriumEvidence E) :
    ExtractionColumnEquilibriumClosed E := by
  exact And.intro Ev.columnHeightClosed
    (And.intro Ev.numberOfStagesClosed
      (And.intro Ev.equilibriumLineClosed
        (And.intro Ev.operatingLineClosed
          (And.intro Ev.feedPointClosed Ev.massTransferEfficiencyClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
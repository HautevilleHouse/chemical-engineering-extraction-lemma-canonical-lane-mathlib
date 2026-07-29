import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionEquilibriumPackage where
  feedPhase : Type u
  solventPhase : Type v
  massTransferCoefficient : Type w
  distributionCoefficient : Type x
  equilibriumLine : Prop
  operatingLine : Prop
  drivingForce : Prop

structure ExtractionEquilibriumEvidence (E : ExtractionEquilibriumPackage) where
  equilibriumLineClosed : E.equilibriumLine
  operatingLineClosed : E.operatingLine
  drivingForceClosed : E.drivingForce

def ExtractionEquilibriumClosed (E : ExtractionEquilibriumPackage) : Prop :=
  E.equilibriumLine ∧ E.operatingLine ∧ E.drivingForce

theorem extraction_equilibrium_closed_from_evidence (E : ExtractionEquilibriumPackage)
    (Ev : ExtractionEquilibriumEvidence E) : ExtractionEquilibriumClosed E := by
  exact And.intro Ev.equilibriumLineClosed (And.intro Ev.operatingLineClosed Ev.drivingForceClosed)

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
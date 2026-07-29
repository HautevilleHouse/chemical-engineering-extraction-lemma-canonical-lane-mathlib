import canonicalLaneMathlib.RiemannianCurvature

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionPhaseEquilibrium where
  moleculeA : Type u
  moleculeB : Type v
  solventS : Type w
  partitionCoefficient : Prop
  massTransferDrivingForce : Prop
  equilibriumStageEfficiency : Prop
  concentrationProfileContinuous : Prop

def ExtractionPhaseEquilibriumClosed (E : ExtractionPhaseEquilibrium) : Prop :=
  E.partitionCoefficient ∧ E.massTransferDrivingForce ∧ E.equilibriumStageEfficiency ∧ E.concentrationProfileContinuous

structure ExtractionPhaseEquilibriumEvidence (E : ExtractionPhaseEquilibrium) where
  partitionCoefficientClosed : E.partitionCoefficient
  massTransferDrivingForceClosed : E.massTransferDrivingForce
  equilibriumStageEfficiencyClosed : E.equilibriumStageEfficiency
  concentrationProfileContinuousClosed : E.concentrationProfileContinuous

theorem extraction_phase_equilibrium_closed_from_evidence (E : ExtractionPhaseEquilibrium) (ev : ExtractionPhaseEquilibriumEvidence E) : ExtractionPhaseEquilibriumClosed E := by
  exact And.intro ev.partitionCoefficientClosed (And.intro ev.massTransferDrivingForceClosed (And.intro ev.equilibriumStageEfficiencyClosed ev.concentrationProfileContinuousClosed))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
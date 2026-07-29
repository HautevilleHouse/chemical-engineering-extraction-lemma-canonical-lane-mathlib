import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionColumnStage where
  stageIndex : Nat
  liquidPhaseConcentration : Float
  vaporPhaseConcentration : Float
  equilibriumRelation : Float -> Float
  equilibriumRelationTerm : equilibriumRelation liquidPhaseConcentration = vaporPhaseConcentration

structure EquilibriumStagePackage where
  feedConcentration : Float
  solventFlowRate : Float
  extractFlowRate : Float
  stages : List ExtractionColumnStage
  operatingLine : Float -> Float
  operatingLineConstructed : Prop

structure EquilibriumStageEvidence (E : EquilibriumStagePackage) where
  feedConcentrationClosed : E.feedConcentration > 0
  solventFlowRateClosed : E.solventFlowRate > 0
  extractFlowRateClosed : E.extractFlowRate > 0
  operatingLineConstructedClosed : E.operatingLineConstructed

def EquilibriumStageClosed (E : EquilibriumStagePackage) : Prop :=
  E.feedConcentration > 0 ∧ E.solventFlowRate > 0 ∧ E.extractFlowRate > 0 ∧ E.operatingLineConstructed

theorem equilibrium_stage_closed_from_evidence (E : EquilibriumStagePackage) (Ev : EquilibriumStageEvidence E) :
    EquilibriumStageClosed E := by
  exact And.intro Ev.feedConcentrationClosed (And.intro Ev.solventFlowRateClosed (And.intro Ev.extractFlowRateClosed Ev.operatingLineConstructedClosed))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
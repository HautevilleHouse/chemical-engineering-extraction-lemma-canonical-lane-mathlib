import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure EquilibriumStage where
  stageNumber : ℕ
  inletFlowRaffinate : ℝ
  inletFlowExtract : ℝ
  outletFlowRaffinate : ℝ
  outletFlowExtract : ℝ
  compositionRaffinateIn : ℝ
  compositionExtractIn : ℝ
  compositionRaffinateOut : ℝ
  compositionExtractOut : ℝ
  stageEfficiency : ℝ
  
structure EquilibriumStageModelPackage where
  stages : List EquilibriumStage
  overallMaterialBalance : Prop
  componentMaterialBalance : Prop
  equilibriumRelation : Prop
  stageEfficiencyApplied : Prop
  operatingLine : Prop

structure EquilibriumStageModelEvidence (E : EquilibriumStageModelPackage) where
  overallMaterialBalanceClosed : E.overallMaterialBalance
  componentMaterialBalanceClosed : E.componentMaterialBalance
  equilibriumRelationClosed : E.equilibriumRelation
  stageEfficiencyAppliedClosed : E.stageEfficiencyApplied
  operatingLineClosed : E.operatingLine

def EquilibriumStageModelClosed (E : EquilibriumStageModelPackage) : Prop :=
  E.overallMaterialBalance ∧ E.componentMaterialBalance ∧
  E.equilibriumRelation ∧ E.stageEfficiencyApplied ∧ E.operatingLine

theorem equilibrium_stage_model_closed_from_evidence (E : EquilibriumStageModelPackage)
  (Ev : EquilibriumStageModelEvidence E) : EquilibriumStageModelClosed E := by
  exact And.intro Ev.overallMaterialBalanceClosed
    (And.intro Ev.componentMaterialBalanceClosed
      (And.intro Ev.equilibriumRelationClosed
        (And.intro Ev.stageEfficiencyAppliedClosed Ev.operatingLineClosed)))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
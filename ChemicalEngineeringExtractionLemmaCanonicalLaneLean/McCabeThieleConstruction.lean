import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure McCabeThieleConstructionPackage where
  equilibriumCurveDefined : Prop
  operatingLineDefined : Prop
  stepwiseConstruction : Prop
  numberTheoreticalStages : Prop
  feedStageLocation : Prop
  minimumSolventRatio : Prop

structure McCabeThieleConstructionEvidence (M : McCabeThieleConstructionPackage) where
  equilibriumCurveDefinedClosed : M.equilibriumCurveDefined
  operatingLineDefinedClosed : M.operatingLineDefined
  stepwiseConstructionClosed : M.stepwiseConstruction
  numberTheoreticalStagesClosed : M.numberTheoreticalStages
  feedStageLocationClosed : M.feedStageLocation
  minimumSolventRatioClosed : M.minimumSolventRatio

def McCabeThieleConstructionClosed (M : McCabeThieleConstructionPackage) : Prop :=
  M.equilibriumCurveDefined ∧ M.operatingLineDefined ∧
  M.stepwiseConstruction ∧ M.numberTheoreticalStages ∧
  M.feedStageLocation ∧ M.minimumSolventRatio

theorem mccabe_thiele_construction_closed_from_evidence
    (M : McCabeThieleConstructionPackage)
    (Ev : McCabeThieleConstructionEvidence M) :
    McCabeThieleConstructionClosed M := by
  exact And.intro Ev.equilibriumCurveDefinedClosed
    (And.intro Ev.operatingLineDefinedClosed
      (And.intro Ev.stepwiseConstructionClosed
        (And.intro Ev.numberTheoreticalStagesClosed
          (And.intro Ev.feedStageLocationClosed Ev.minimumSolventRatioClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
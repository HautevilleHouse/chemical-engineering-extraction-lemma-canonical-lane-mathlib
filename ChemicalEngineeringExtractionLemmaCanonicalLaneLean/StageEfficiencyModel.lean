import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure StageEfficiencyModelPackage where
  murphreeEfficiencyDefined : Prop
  overallEfficiencyDefined : Prop
  pointEfficiencyDefined : Prop
  massTransferArea : Prop
  flowPatternModel : Prop
  axialDispersionInput : Prop

structure StageEfficiencyModelEvidence (S : StageEfficiencyModelPackage) where
  murphreeEfficiencyDefinedClosed : S.murphreeEfficiencyDefined
  overallEfficiencyDefinedClosed : S.overallEfficiencyDefined
  pointEfficiencyDefinedClosed : S.pointEfficiencyDefined
  massTransferAreaClosed : S.massTransferArea
  flowPatternModelClosed : S.flowPatternModel
  axialDispersionInputClosed : S.axialDispersionInput

def StageEfficiencyModelClosed (S : StageEfficiencyModelPackage) : Prop :=
  S.murphreeEfficiencyDefined ∧ S.overallEfficiencyDefined ∧
  S.pointEfficiencyDefined ∧ S.massTransferArea ∧
  S.flowPatternModel ∧ S.axialDispersionInput

theorem stage_efficiency_model_closed_from_evidence
    (S : StageEfficiencyModelPackage)
    (Ev : StageEfficiencyModelEvidence S) :
    StageEfficiencyModelClosed S := by
  exact And.intro Ev.murphreeEfficiencyDefinedClosed
    (And.intro Ev.overallEfficiencyDefinedClosed
      (And.intro Ev.pointEfficiencyDefinedClosed
        (And.intro Ev.massTransferAreaClosed
          (And.intro Ev.flowPatternModelClosed Ev.axialDispersionInputClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
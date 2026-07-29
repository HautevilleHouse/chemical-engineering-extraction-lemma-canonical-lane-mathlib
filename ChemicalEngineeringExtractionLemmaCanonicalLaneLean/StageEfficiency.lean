import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure StageEfficiencyPackage where
  murphreeEfficiency : Prop
  overallEfficiency : Prop
  numberTheoreticalStages : Prop
  heightEquivalentTheoreticalPlate : Prop

structure StageEfficiencyEvidence (S : StageEfficiencyPackage) where
  murphreeEfficiencyClosed : S.murphreeEfficiency
  overallEfficiencyClosed : S.overallEfficiency
  numberTheoreticalStagesClosed : S.numberTheoreticalStages
  heightEquivalentTheoreticalPlateClosed : S.heightEquivalentTheoreticalPlate

def StageEfficiencyClosed (S : StageEfficiencyPackage) : Prop :=
  S.murphreeEfficiency ∧ S.overallEfficiency ∧ S.numberTheoreticalStages ∧ S.heightEquivalentTheoreticalPlate

theorem stage_efficiency_closed_from_evidence (S : StageEfficiencyPackage)
    (Ev : StageEfficiencyEvidence S) : StageEfficiencyClosed S := by
  exact And.intro Ev.murphreeEfficiencyClosed (And.intro Ev.overallEfficiencyClosed
    (And.intro Ev.numberTheoreticalStagesClosed Ev.heightEquivalentTheoreticalPlateClosed))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
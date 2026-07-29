import ChemicalEngineeringExtractionLemmaCanonicalLaneLean.ExtractionEquilibrium

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure StagewiseExtractionPackage {E : ExtractionEquilibriumPackage} where
  numberOfStages : ℕ
  cascadeModel : Prop
  stageEfficiency : ℝ
  recycleStream : Prop
  productRecovery : ℝ

structure StagewiseExtractionEvidence {E : ExtractionEquilibriumPackage}
    (S : StagewiseExtractionPackage E) where
  numberOfStagesClosed : S.numberOfStages ≥ 1
  cascadeModelClosed : S.cascadeModel
  stageEfficiencyClosed : 0 < S.stageEfficiency ∧ S.stageEfficiency ≤ 1
  recycleStreamClosed : S.recycleStream
  productRecoveryClosed : 0 ≤ S.productRecovery ∧ S.productRecovery ≤ 1

def StagewiseExtractionClosed {E : ExtractionEquilibriumPackage}
    (S : StagewiseExtractionPackage E) : Prop :=
  S.numberOfStages ≥ 1 ∧ S.cascadeModel ∧ 0 < S.stageEfficiency ∧ S.stageEfficiency ≤ 1 ∧
  S.recycleStream ∧ 0 ≤ S.productRecovery ∧ S.productRecovery ≤ 1

theorem stagewise_extraction_closed_from_evidence {E : ExtractionEquilibriumPackage}
    (S : StagewiseExtractionPackage E) (Ev : StagewiseExtractionEvidence S) :
    StagewiseExtractionClosed S := by
  exact And.intro Ev.numberOfStagesClosed
    (And.intro Ev.cascadeModelClosed
      (And.intro (And.left Ev.stageEfficiencyClosed)
        (And.intro (And.right Ev.stageEfficiencyClosed)
          (And.intro Ev.recycleStreamClosed
            (And.intro (And.left Ev.productRecoveryClosed) (And.right Ev.productRecoveryClosed))))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
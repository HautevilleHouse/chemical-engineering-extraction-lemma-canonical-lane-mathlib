import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure KremserEquationPackage where
  numberOfStages : ℕ
  extractionFactor : ℝ
  compositionFeed : ℝ
  compositionSolvent : ℝ
  compositionRaffinateOut : ℝ
  compositionExtractOut : ℝ
  recoveryFraction : ℝ
  extractionFactorDefined : Prop
  compositionFeedDefined : Prop
  compositionSolventDefined : Prop
  kremserEquationApplied : Prop
  recoveryFractionComputed : Prop

structure KremserEquationEvidence (K : KremserEquationPackage) where
  extractionFactorDefinedClosed : K.extractionFactorDefined
  compositionFeedDefinedClosed : K.compositionFeedDefined
  compositionSolventDefinedClosed : K.compositionSolventDefined
  kremserEquationAppliedClosed : K.kremserEquationApplied
  recoveryFractionComputedClosed : K.recoveryFractionComputed

def KremserEquationClosed (K : KremserEquationPackage) : Prop :=
  K.extractionFactorDefined ∧ K.compositionFeedDefined ∧
  K.compositionSolventDefined ∧ K.kremserEquationApplied ∧
  K.recoveryFractionComputed

theorem kremser_equation_closed_from_evidence (K : KremserEquationPackage)
  (Ev : KremserEquationEvidence K) : KremserEquationClosed K := by
  exact And.intro Ev.extractionFactorDefinedClosed
    (And.intro Ev.compositionFeedDefinedClosed
      (And.intro Ev.compositionSolventDefinedClosed
        (And.intro Ev.kremserEquationAppliedClosed
          Ev.recoveryFractionComputedClosed)))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
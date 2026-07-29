import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure TwoFilmResistancePackage where
  filmThicknessContinuous : ℝ
  filmThicknessDispersed : ℝ
  massTransferCoefficientContinuous : ℝ
  massTransferCoefficientDispersed : ℝ
  overallResistanceContinuous : ℝ
  overallResistanceDispersed : ℝ
  equilibriumPartitionCoefficient : ℝ
  filmThicknessContinuousDefined : Prop
  filmThicknessDispersedDefined : Prop
  massTransferCoefficientContinuousDefined : Prop
  massTransferCoefficientDispersedDefined : Prop
  equilibriumPartitionCoefficientDefined : Prop
  overallResistanceContinuousComputed : Prop
  overallResistanceDispersedComputed : Prop

structure TwoFilmResistanceEvidence (T : TwoFilmResistancePackage) where
  filmThicknessContinuousDefinedClosed : T.filmThicknessContinuousDefined
  filmThicknessDispersedDefinedClosed : T.filmThicknessDispersedDefined
  massTransferCoefficientContinuousDefinedClosed : T.massTransferCoefficientContinuousDefined
  massTransferCoefficientDispersedDefinedClosed : T.massTransferCoefficientDispersedDefined
  equilibriumPartitionCoefficientDefinedClosed : T.equilibriumPartitionCoefficientDefined
  overallResistanceContinuousComputedClosed : T.overallResistanceContinuousComputed
  overallResistanceDispersedComputedClosed : T.overallResistanceDispersedComputed

def TwoFilmResistanceClosed (T : TwoFilmResistancePackage) : Prop :=
  T.filmThicknessContinuousDefined ∧ T.filmThicknessDispersedDefined ∧
  T.massTransferCoefficientContinuousDefined ∧ T.massTransferCoefficientDispersedDefined ∧
  T.equilibriumPartitionCoefficientDefined ∧ T.overallResistanceContinuousComputed ∧
  T.overallResistanceDispersedComputed

theorem two_film_resistance_closed_from_evidence (T : TwoFilmResistancePackage)
  (Ev : TwoFilmResistanceEvidence T) : TwoFilmResistanceClosed T := by
  exact And.intro Ev.filmThicknessContinuousDefinedClosed
    (And.intro Ev.filmThicknessDispersedDefinedClosed
      (And.intro Ev.massTransferCoefficientContinuousDefinedClosed
        (And.intro Ev.massTransferCoefficientDispersedDefinedClosed
          (And.intro Ev.equilibriumPartitionCoefficientDefinedClosed
            (And.intro Ev.overallResistanceContinuousComputedClosed
              Ev.overallResistanceDispersedComputedClosed)))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
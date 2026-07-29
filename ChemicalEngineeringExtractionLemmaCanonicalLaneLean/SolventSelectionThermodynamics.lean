import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure SolventSelectionThermodynamicsPackage where
  selectivityDefined : Prop
  capacityDefined : Prop
  distributionCoefficient : Prop
  mutualSolubilityData : Prop
  densityDifference : Prop
  interfacialTension : Prop

structure SolventSelectionThermodynamicsEvidence (S : SolventSelectionThermodynamicsPackage) where
  selectivityDefinedClosed : S.selectivityDefined
  capacityDefinedClosed : S.capacityDefined
  distributionCoefficientClosed : S.distributionCoefficient
  mutualSolubilityDataClosed : S.mutualSolubilityData
  densityDifferenceClosed : S.densityDifference
  interfacialTensionClosed : S.interfacialTension

def SolventSelectionThermodynamicsClosed (S : SolventSelectionThermodynamicsPackage) : Prop :=
  S.selectivityDefined ∧ S.capacityDefined ∧ S.distributionCoefficient ∧
  S.mutualSolubilityData ∧ S.densityDifference ∧ S.interfacialTension

theorem solvent_selection_thermodynamics_closed_from_evidence
    (S : SolventSelectionThermodynamicsPackage)
    (Ev : SolventSelectionThermodynamicsEvidence S) :
    SolventSelectionThermodynamicsClosed S := by
  exact And.intro Ev.selectivityDefinedClosed
    (And.intro Ev.capacityDefinedClosed
      (And.intro Ev.distributionCoefficientClosed
        (And.intro Ev.mutualSolubilityDataClosed
          (And.intro Ev.densityDifferenceClosed Ev.interfacialTensionClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
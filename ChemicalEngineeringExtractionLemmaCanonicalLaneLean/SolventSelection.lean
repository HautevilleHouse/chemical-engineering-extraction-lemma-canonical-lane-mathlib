import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure SolventSelectionPackage where
  selectivity : Prop
  distributionCoefficient : Prop
  solubility : Prop
  densityDifference : Prop
  interfacialTension : Prop
  viscosity : Prop
  recoverability : Prop

structure SolventSelectionEvidence (S : SolventSelectionPackage) where
  selectivityClosed : S.selectivity
  distributionCoefficientClosed : S.distributionCoefficient
  solubilityClosed : S.solubility
  densityDifferenceClosed : S.densityDifference
  interfacialTensionClosed : S.interfacialTension
  viscosityClosed : S.viscosity
  recoverabilityClosed : S.recoverability

def SolventSelectionClosed (S : SolventSelectionPackage) : Prop :=
  S.selectivity ∧ S.distributionCoefficient ∧ S.solubility ∧ S.densityDifference ∧ S.interfacialTension ∧ S.viscosity ∧ S.recoverability

theorem solvent_selection_closed_from_evidence (S : SolventSelectionPackage)
    (Ev : SolventSelectionEvidence S) : SolventSelectionClosed S := by
  exact And.intro Ev.selectivityClosed (And.intro Ev.distributionCoefficientClosed
    (And.intro Ev.solubilityClosed (And.intro Ev.densityDifferenceClosed
      (And.intro Ev.interfacialTensionClosed (And.intro Ev.viscosityClosed Ev.recoverabilityClosed)))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
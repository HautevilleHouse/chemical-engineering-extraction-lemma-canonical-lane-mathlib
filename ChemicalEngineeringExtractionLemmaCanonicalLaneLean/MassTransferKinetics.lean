import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure MassTransferKineticsPackage where
  filmTheory : Prop
  penetrationModel : Prop
  surfaceRenewalModel : Prop
  overallMassTransferCoefficient : Prop
  diffusivityInput : Prop
  contactTimeInput : Prop

structure MassTransferKineticsEvidence (M : MassTransferKineticsPackage) where
  filmTheoryClosed : M.filmTheory
  penetrationModelClosed : M.penetrationModel
  surfaceRenewalModelClosed : M.surfaceRenewalModel
  overallMassTransferCoefficientClosed : M.overallMassTransferCoefficient
  diffusivityInputClosed : M.diffusivityInput
  contactTimeInputClosed : M.contactTimeInput

def MassTransferKineticsClosed (M : MassTransferKineticsPackage) : Prop :=
  M.filmTheory ∧ M.penetrationModel ∧ M.surfaceRenewalModel ∧
  M.overallMassTransferCoefficient ∧ M.diffusivityInput ∧ M.contactTimeInput

theorem mass_transfer_kinetics_closed_from_evidence
    (M : MassTransferKineticsPackage)
    (Ev : MassTransferKineticsEvidence M) :
    MassTransferKineticsClosed M := by
  exact And.intro Ev.filmTheoryClosed
    (And.intro Ev.penetrationModelClosed
      (And.intro Ev.surfaceRenewalModelClosed
        (And.intro Ev.overallMassTransferCoefficientClosed
          (And.intro Ev.diffusivityInputClosed Ev.contactTimeInputClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
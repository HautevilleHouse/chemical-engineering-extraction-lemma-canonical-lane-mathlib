import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure MassTransferModelPackage where
  filmModel : Prop
  penetrationModel : Prop
  surfaceRenewalModel : Prop
  overallMassTransferCoefficient : Prop

structure MassTransferModelEvidence (M : MassTransferModelPackage) where
  filmModelClosed : M.filmModel
  penetrationModelClosed : M.penetrationModel
  surfaceRenewalModelClosed : M.surfaceRenewalModel
  overallMassTransferCoefficientClosed : M.overallMassTransferCoefficient

def MassTransferModelClosed (M : MassTransferModelPackage) : Prop :=
  M.filmModel ∧ M.penetrationModel ∧ M.surfaceRenewalModel ∧ M.overallMassTransferCoefficient

theorem mass_transfer_model_closed_from_evidence (M : MassTransferModelPackage)
    (Ev : MassTransferModelEvidence M) : MassTransferModelClosed M := by
  exact And.intro Ev.filmModelClosed (And.intro Ev.penetrationModelClosed
    (And.intro Ev.surfaceRenewalModelClosed Ev.overallMassTransferCoefficientClosed))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
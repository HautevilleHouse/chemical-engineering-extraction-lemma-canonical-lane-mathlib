import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionKineticsPackage where
  rateLaw : Prop
  activationEnergy : Prop
  massTransferRate : Prop
  interfacialArea : Prop
  reactionMechanism : Prop

structure ExtractionKineticsEvidence (K : ExtractionKineticsPackage) where
  rateLawClosed : K.rateLaw
  activationEnergyClosed : K.activationEnergy
  massTransferRateClosed : K.massTransferRate
  interfacialAreaClosed : K.interfacialArea
  reactionMechanismClosed : K.reactionMechanism

def ExtractionKineticsClosed (K : ExtractionKineticsPackage) : Prop :=
  K.rateLaw ∧ K.activationEnergy ∧ K.massTransferRate ∧ K.interfacialArea ∧ K.reactionMechanism

theorem extraction_kinetics_closed_from_evidence (K : ExtractionKineticsPackage)
    (Ev : ExtractionKineticsEvidence K) : ExtractionKineticsClosed K := by
  exact And.intro Ev.rateLawClosed (And.intro Ev.activationEnergyClosed
    (And.intro Ev.massTransferRateClosed (And.intro Ev.interfacialAreaClosed Ev.reactionMechanismClosed)))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
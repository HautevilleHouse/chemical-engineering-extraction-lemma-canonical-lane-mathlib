import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionColumn where
  columnType : Type
  diameter : ℝ
  height : ℝ
  packingType : String
  voidFraction : ℝ
  
structure MassTransferCoefficient where
  overallMassTransferCoefficient : ℝ
  unit : String
  correlation : String

structure ExtractionMassTransferPackage where
  column : ExtractionColumn
  massTransferCoefficient : MassTransferCoefficient
  continuousPhaseVelocity : ℝ
  dispersedPhaseVelocity : ℝ
  interfacialArea : ℝ
  massTransferFlux : ℝ → ℝ → ℝ
  drivingForce : ℝ
  velocityContinuous : Prop
  velocityDispersed : Prop
  interfacialAreaDefined : Prop
  massTransferFluxContinuous : Prop
  drivingForceDefined : Prop
  boundaryLayerTransition : Prop
  
structure ExtractionMassTransferEvidence (E : ExtractionMassTransferPackage) where
  velocityContinuousClosed : E.velocityContinuous
  velocityDispersedClosed : E.velocityDispersed
  interfacialAreaDefinedClosed : E.interfacialAreaDefined
  massTransferFluxContinuousClosed : E.massTransferFluxContinuous
  drivingForceDefinedClosed : E.drivingForceDefined
  boundaryLayerTransitionClosed : E.boundaryLayerTransition

def ExtractionMassTransferClosed (E : ExtractionMassTransferPackage) : Prop :=
  E.velocityContinuous ∧ E.velocityDispersed ∧ E.interfacialAreaDefined ∧
  E.massTransferFluxContinuous ∧ E.drivingForceDefined ∧ E.boundaryLayerTransition

theorem extraction_mass_transfer_closed_from_evidence (E : ExtractionMassTransferPackage)
  (Ev : ExtractionMassTransferEvidence E) : ExtractionMassTransferClosed E := by
  exact And.intro Ev.velocityContinuousClosed
    (And.intro Ev.velocityDispersedClosed
      (And.intro Ev.interfacialAreaDefinedClosed
        (And.intro Ev.massTransferFluxContinuousClosed
          (And.intro Ev.drivingForceDefinedClosed Ev.boundaryLayerTransitionClosed))))

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
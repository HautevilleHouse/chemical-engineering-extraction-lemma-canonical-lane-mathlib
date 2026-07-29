import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionLemmaCanonicalLaneLean

structure ExtractionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ExtractionAdmittedObject where
  space : ExtractionSpace
  continuousPhase : Prop
  dispersedPhase : Prop
  soluteTransfer : Prop
  equilibriumReached : Prop
  conclusion : equilibriumReached

def ExtractionWitnessClosed (O : ExtractionAdmittedObject) : Prop :=
  O.equilibriumReached

end ChemicalEngineeringExtractionLemmaCanonicalLaneLean
end HautevilleHouse
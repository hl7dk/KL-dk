Profile: KLCommonCareSocialObservation
Parent: Observation
Title: "KLCommonCareSocialObservation"
Description: "Observations and measurements performed in Danish municipalities"

* code from KLObservationCodes (extensible)
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer only Reference(KLCommonPractitioner)
* basedOn only Reference(KLCommonCareSocialPlannedIntervention or KLCommonCareSocialServiceRequest or KLCommonCareSocialCarePlan)

* code.coding ^short = "[DK] observationskode"
* value[x] ^short = "[DK] observationsresultat"
* valueQuantity.unit ^short = "[DK] observationsenhed"
* subject ^short = "[DK] observationssubjekt"
* encounter ^short = "[DK] observationskontakt"
* performer ^short = "[DK] observationsansvarlig"
* basedOn ^short = "[DK] observationBaseretPå"
* effective[x] ^short = "[DK] observationstid"
* status ^short = "[DK] observationsstatus"

Instance: MarksPuls
InstanceOf: KLCommonCareSocialObservation
Usage: #example
Title: "MarksPuls"
Description: "Observation af Marks puls (OBS: Mere specifik profil for puls findes i værktøjsprojektet, dette er udelukkende et eksempel,  dette er udelukkende et eksempel for denne implememnattion guide)"
* code = SCT#8499008 "Puls"
* subject = Reference(Mark)
* performer = Reference(AbrahamFraAkutSygeplejen)
* basedOn = Reference(HenvisningFraLageVedrAkutSygepleje)
* valueQuantity.value = 78
* valueQuantity.unit = "Slag pr. minut"
* valueQuantity.system = UCUM
* valueQuantity.code = #{beats}/min
* status = #final
* effectiveDateTime = 2020-06-21

Instance: MarksDiastoliske
InstanceOf: KLCommonCareSocialObservation
Usage: #example
Title: "MarksDiastoliske"
Description: "Observation af Marks diastoliske blodtryk (OBS: Mere specifik profil for blodtryk findes i værktøjsprojektet, dette er udelukkende et eksempel for denne implememnattion guide)"
* code = SCT#271650006 "Diastolisk blodtryk"
* subject = Reference(Mark)
* performer = Reference(AbrahamFraAkutSygeplejen)
* basedOn = Reference(HenvisningFraLageVedrAkutSygepleje)
* valueQuantity.value = 120
* valueQuantity.unit = "Millimeter kviksølv"
* valueQuantity.system = UCUM
* valueQuantity.code = #mm[Hg]
* status = #final
* effectiveDateTime = 2020-06-21

Instance: MarksBlodsukker
InstanceOf: KLCommonCareSocialObservation
Usage: #example
Title: "MarksBlodsukker"
Description: "Observation af Marks blodsukker"
* code.coding[0] = SCT#434912009 // |glucosekoncentration i blod|
* code.coding[1] = NPU#NPU02195 //
* subject = Reference(Mark)
* performer = Reference(AbrahamFraAkutSygeplejen)
* valueQuantity.value = 3.6
* valueQuantity.unit = "mmol/l"
* valueQuantity.system = UCUM
* valueQuantity.code = #mmol/L
* status = #final
* effectiveDateTime = 2020-06-21
* basedOn = Reference(HenvisningFraLageVedrAkutSygepleje)



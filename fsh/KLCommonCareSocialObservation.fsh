Profile: KLCommonCareSocialObservation
Parent: Observation
Title: "KLCommonCareSocialObservation"
Description: "Observations and measurements performed in Danish municipalities"

* code from KLObservationCodes (extensible)
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer only Reference(KLCommonPractitioner)
* basedOn only Reference(KLCommonCareSocialPlannedIntervention or KLCommonCareSocialServiceRequest or KLCommonCareSocialCarePlan)

Instance: MarksPuls
InstanceOf: KLCommonCareSocialObservation
Usage: #example
Title: "MarksPuls"
Description: "Observation af Marks puls"
* code = SCT#8499008 "Puls"
* subject = Reference(Mark)
* performer = Reference(AbrahamFraAkutSygeplejen)
* basedOn = Reference(HenvisningFraLageVedrAkutSygepleje)
* valueQuantity.value = 78
* valueQuantity.unit = "Slag pr. minut"
* valueQuantity.system = UCUM
* valueQuantity.code = #{beats}/min
* status = #final

Instance: MarksDiastoliske
InstanceOf: KLCommonCareSocialObservation
Usage: #example
Title: "MarksDiastoliske"
Description: "Observation af Marks diastoliske blodtryk"
* code = SCT#271650006 "Diastolisk blodtryk"
* subject = Reference(Mark)
* performer = Reference(AbrahamFraAkutSygeplejen)
* basedOn = Reference(HenvisningFraLageVedrAkutSygepleje)
* valueQuantity.value = 120
* valueQuantity.unit = "Millimeter kviksølv"
* valueQuantity.system = UCUM
* valueQuantity.code = #mm[Hg]
* status = #final


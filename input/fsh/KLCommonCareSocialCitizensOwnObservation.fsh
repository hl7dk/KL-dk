Profile: KLCommonCareSocialCitizensOwnObservation
Title: "CitizensOwnObservation"
Parent: Observation
Description: "Citizens own observation of performance level (udførelse) or importance level (betydning) as defined by FSIII"

* code from KLCitizenObservationCodesFSIII

* value[x] only CodeableConcept
* valueCodeableConcept from KLCitizenObservationResultCodesFSIII

* focus 1..1
* focus only Reference(KLCommonCareSocialCondition or KLCommonCareSocialMatterOfInterest)

* subject only Reference(KLCommonCitizen)

* effective[x] 1..1
* effective[x] only dateTime

* encounter only Reference(KLCommonCareSocialEncounter)

* performer only Reference(KLCommonPractitioner)

* code.coding ^short = "[DK] borgervurderingskode"
* valueCodeableConcept.coding ^short = "[DK] borgervurderingsresultat"
* subject ^short = "[DK] borgervurderingssubjekt"
* encounter ^short = "[DK] borgervurderingskontakt"
* performer ^short = "[DK] observationsansvarlig"
* focus ^short = "[DK] borgervurderingsfokus"
* effectiveDateTime ^short = "[DK] borgervurderingstid"
* status ^short = "[DK] borgervurderingsstatus"



Instance: JudithGaa
InstanceOf: KLCommonCareSocialCitizensOwnObservation
Usage: #example
Title: "Judith Gå Egenvurdering"
Description: "Judiths vurdering af egen evne til at gå"
* code.coding = $FSIII#D
* valueCodeableConcept = $FSIII#D2
* subject = Reference(Judith)
* focus = Reference(ConditionWalking)
* effectiveDateTime = 2020-08-11
* status = #final
* performer = Reference(HanneFraVisitationenAalborg)

Profile: KLCommonCareSocialCitizensOwnObservation
Title: "KLCommonCareSocialCitizensOwnObservation"
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
Title: "JudithGåEgenvurdering"
Description: "Judiths vurdering af egen evne til at gå"
* code.coding = FSIII#D
* valueCodeableConcept = FSIII#D2
* subject = Reference(Judith)
* focus = Reference(ConditionWalking)
* effectiveDateTime = 2020-08-11
* status = #final


//|borgervurderingskode|Klasse som udtrykker, at der observeres på borgers evne til at udføre funktion eller aktivitet.|Observation.code.coding|
//|borgervurderingsresultat|Klasse, der udtrykker resultatet af borgers vurdering.|Observation.valueCodeableConcept.coding|
//|borgervurderingssubjektsubjekt|Den borger, som er genstad for vurdering.|Observation.subject|
//|borgervurderingskontakt|Den kontakt, hvor vurderingen er foretaget.|Observation.encounter|
//|observationsansvarlig|Den fagperson der er ansvarlig for observationen.|Observation.performer|
//|borgervurderingsfokus|Tilstand, som denne borgervurdering er direkte observation på.|Observation.focus|
//|borgervurderingstid|Tidspunkt for borgervurderingen.|Observation.effectiveDateTime|
//|borgervurderingsstatus|||
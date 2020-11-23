Profile: KLCommonCareSocialCitizensOwnObservation
Title: "CommonCareSocialCitizensOwnObservation"
Parent: Observation
Description: "Citizens own observation of performance level (udførelse) or importance level (betydning) as defined by FSIII"

* code from KLCitizenObservationCodesFSIII

* value[x] only CodeableConcept
* valueCodeableConcept from KLCitizenObservationResultCodesFSIII

* focus 1..1
* focus only Reference(KLCommonCareSocialCondition)

* subject only Reference(KLCommonCitizen)

* effective[x] 1..1
* effective[x] only dateTime

* encounter only Reference(KLCommonCareSocialEncounter)

* performer only Reference(KLCommonPractitioner)
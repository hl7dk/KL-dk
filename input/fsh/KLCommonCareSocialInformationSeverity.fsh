Profile:        KLCommonCareSocialInformationSeverity
Parent:         Observation
Title:          "CommonCareSocialInformationSeverity"
Description:    "Information severities in Danish municipalities"

* code from KLHomeCareAreasFSIII
* value[x] only CodeableConcept
* valueCodeableConcept from KLSeveritiesFSIII
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer 0..1
* performer only Reference(KLCommonPractitioner)
* effective[x] only dateTime
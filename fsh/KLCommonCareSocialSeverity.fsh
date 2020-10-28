Profile:        KLCommonCareSocialSeverity
Parent:         Observation
Title:          "CommonCareSocialSeverity"
Description:    "Observation of functional level severities in Danish municipalities"

* code = KLCommonCareSocialCodes#66959f77-6e2a-4574-8423-3ff097f8b9fa
* value[x] only CodeableConcept
* valueCodeableConcept from KLSeverities
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer 0..1
* performer only Reference(KLCommonPractitioner)
* effective[x] only dateTime
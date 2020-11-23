Profile:        KLCommonCareSocialStructuredFollowUp
Parent:         Observation
Title:          "CommonCareSocialStructuresFollowUp"
Description:    "Structured follow-up result used in Danish municipalities"

* code = SCT#712744002 // |Evaluation of care plan (procedure)| opfølgning
* value[x] only CodeableConcept
* valueCodeableConcept from KLFollowUpCodes
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer only Reference(KLCommonPractitioner)
* effective[x] 1..1
* effective[x] only dateTime

Instance: MarkHjemmeplejeRevisitation
InstanceOf: Observation
Title: "MarksHjemmeplejeRevisitation"
Description: "Eksempel på opfølgningsresultatet revisitation"
Usage: #example
* subject = Reference(Mark)
* code = SCT#712744002
* valueCodeableConcept = FSIII#E4 "revisitation"
* effectiveDateTime = 2020-04-11
* performer = Reference(HanneFraVisitationenAalborg)
* status = #final
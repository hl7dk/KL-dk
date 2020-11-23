Profile:        KLCommonCareSocialFollowUp
Parent:         Observation
Title:          "CommonCareSocialFollowUp"
Description:    "Follow-up results used in Danish municipalities"

* code = SCT#712744002 // |Evaluation of care plan (procedure)| opfølgning
* value[x] only string
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer only Reference(KLCommonPractitioner)
* effective[x] 1..1
* effective[x] only dateTime
* hasMember only Reference(KLCommonCareSocialStructuredFollowUp)
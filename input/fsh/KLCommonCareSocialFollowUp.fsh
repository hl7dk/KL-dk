Profile:        KLCommonCareSocialFollowUp
Parent:         Observation
Title:          "FollowUp"
Description:    "Follow-up results used in Danish municipalities"

* code = SCT#712744002 // |Evaluation of care plan (procedure)| opfølgning
* value[x] only CodeableConcept
* valueCodeableConcept from KLFollowUpCodes
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer only Reference(KLCommonPractitioner)
* effective[x] 1..1
* effective[x] only dateTime

* code.coding ^short = "[DK] opfølgningskode"
* valueCodeableConcept.text ^short = "[DK] opfølgningsresultat"
* valueCodeableConcept.coding ^short = "[DK] struktureretOpfølgningsresultat"
* subject ^short = "[DK] opfølgningsubjekt"
* encounter ^short = "[DK] opfølgningsKontakt"
* performer ^short = "[DK] opfølgningsansvarlig"
* effectiveDateTime ^short = "[DK] opfølgningstid"
* status ^short = "[DK] opfølgningsstatus"

Instance: MarkHjemmeplejeRevisitation
InstanceOf: KLCommonCareSocialFollowUp
Title: "Marks Hjemmepleje Revisitation"
Description: "Eksempel på opfølgningsresultatet revisitation"
Usage: #example
* subject = Reference(Mark)
* code = SCT#712744002
* valueCodeableConcept.text = "Borgers funktionsevne er blevet bedre, særligt ift. mobilitet. Der skal ses på om nogle af §83 indsatserne, med fordel kan gøres til §83a for yderligere at styrke hverdags rehabiliteringsindsatsen og dermed borgers funktionsniveau. "
* valueCodeableConcept = FSIII#E4 "revisitation"
* effectiveDateTime = 2020-04-11
* performer = Reference(HanneFraVisitationenAalborg)
* status = #final

Instance: AndreasRevisitation
InstanceOf: KLCommonCareSocialFollowUp
Title: "Andreas Revisitation"
Description: "Eksempel på opfølgningsresultatet revisitation"
Usage: #example
* subject = Reference(Andreas)
* code = SCT#712744002
* valueCodeableConcept.text = "Det midlertidige botilbud har været godt for Andreas og hans mor. Andreas har udviklet sig positivt vedr. sociale relationer i perioden. Det vurderes at Andreas skal revisiteres mhp. at få tildelt alment botilbud"
* valueCodeableConcept = FFB#b4c01aa8-82fd-44e4-83ff-ca19ec02c779
* effectiveDateTime = 2020-08-05
* performer = Reference(BirteFraVisitationenMorsoe)
* status = #final
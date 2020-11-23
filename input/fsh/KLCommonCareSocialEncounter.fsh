Profile:        KLCommonCareSocialEncounter
Parent:         Encounter
Title:          "CommonCareSocalEncounter"
Description:    "Encounters used for care and social services in Danish municipalities."

* type from KLEncounterTypes (required)
* period 1..1
* participant.individual only Reference(KLCommonPractitioner)
* subject only Reference(KLCommonCitizen)

Instance: MarkFollowUpPlanned
InstanceOf: KLCommonCareSocialEncounter
Title: "Mark FolowUp planned"
Usage: #example
Description: "Mark's planlagte opfølgning, med periode.start fremtidigt"
* type = KLCommonCareSocialCodes#9f03dfbb-7a97-45a5-94db-d4c3501714a9 "opfølgning"
* period.start = 2020-07-22
* status = EncounterStatus#planned
* subject = Reference(Mark)
* class = V3ACTCODES#HH
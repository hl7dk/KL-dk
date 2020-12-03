Profile:        KLCommonCareSocialEncounter
Parent:         Encounter
Title:          "KLCommonCareSocalEncounter"
Description:    "Encounters used for care and social services in Danish municipalities."

* type from KLEncounterTypes (required)
* period 1..1
* period.start 1..1
* participant.individual only Reference(KLCommonPractitioner)
* subject only Reference(KLCommonCitizen)


* status ^short = "[DK] kontaktstatus"
* type.coding ^short = "[DK] kontakttype"
* period.start ^short = "[DK] kontaktstart"
* period.end ^short = "[DK] kontaktslut"
* length ^short = "[DK] kontaktlængde"
* participant ^short = "[DK] kontaktudfører"
* subject ^short = "[DK] kontaktsubjekt"
* class ^short = "[DK] kontaktklasse"
* serviceProvider ^short = "[DK] kontaktansvarlig"

Instance: MarkFollowUpPlanned
InstanceOf: KLCommonCareSocialEncounter
Title: "MarkOpfølgningPlanlagt"
Usage: #example
Description: "Mark's planlagte opfølgning, med periode.start fremtidigt"
* type = KLCommonCareSocialCodes#9f03dfbb-7a97-45a5-94db-d4c3501714a9 "opfølgning"
* period.start = 2020-07-22
* status = EncounterStatus#planned
* subject = Reference(Mark)
* class = V3ACTCODES#HH

Instance: MarkOgAkutsygeplejerske
InstanceOf: KLCommonCareSocialEncounter
Title: "MarkOgAkutsygeplejerske"
Usage: #example
Description: "Kontakt hvor der leveres en akutindsats til Mark"
* type = KLCommonCareSocialCodes#15775b0a-7ec6-469e-9d3c-a81fbc9a1b45 "udførelse af akutindsats"
* period.start = 2020-06-21T15:30:00.000Z
* status = EncounterStatus#finished
* subject = Reference(Mark)
* participant.individual = Reference(AbrahamFraAkutSygeplejen)
* class = V3ACTCODES#HH

Instance: MarkogSaarsygeplejerske
InstanceOf: KLCommonCareSocialEncounter
Title: "MarkogSårsygepleje"
Usage: #example
Description: "Kontakt hvor der leveres en sårbehandling til Mark efter planen"
* type = KLCommonCareSocialCodes#784275f1-6822-4a88-b361-d958007d5253	//udførelse af planlagt indsats "udførelse af akutindsats"
* period.start = 2020-06-07T15:30:00.000Z
* status = EncounterStatus#finished
* subject = Reference(Mark)
* participant.individual = Reference(NatasjaFraSygeplejen)
* class = V3ACTCODES#HH

Instance: MarkogUdredningSygepleje
InstanceOf: KLCommonCareSocialEncounter
Title: "MarkogUdredningSygepleje"
Usage: #example
Description: "Kontakt hvor der udføres en sygeplejefaglig udredning på Mark"
* type = KLCommonCareSocialCodes#829ac647-c7fc-4964-836b-f708d886e0e3 //oplysning
* period.start = 2020-06-05
* status = EncounterStatus#finished
* subject = Reference(Mark)
* participant.individual = Reference(HanneFraVisitationenAalborg)
* class = V3ACTCODES#HH
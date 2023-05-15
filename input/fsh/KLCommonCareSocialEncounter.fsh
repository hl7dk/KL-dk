Profile:        KLCommonCareSocialEncounter
Parent:         Encounter
Title:          "Encounter"
Description:    "Encounters used for care and social services in Danish municipalities."

* type from KLEncounterTypes (required)
* period 1..1
* period.start 1..1
* participant.individual only Reference(KLCommonPractitioner)
* subject only Reference(KLCommonCitizen)


* status ^short = "[DK] borgerkontaktstatus"
* type.coding ^short = "[DK] borgerkontakttype"
* period.start ^short = "[DK] borgerkontaktstart"
* period.end ^short = "[DK] borgerkontaktslut"
* length ^short = "[DK] borgerkontaktlængde"
* participant ^short = "[DK] borgerkontaktudfører"
* subject ^short = "[DK] borgerkontaktsubjekt"
* class ^short = "[DK] borgerkontaktklasse"
* serviceProvider ^short = "[DK] borgerkontaktansvarlig"

Instance: MarkFollowUpPlanned
InstanceOf: KLCommonCareSocialEncounter
Title: "Mark Opfølgning Planlagt"
Usage: #example
Description: "Mark's planlagte opfølgning, med periode.start fremtidigt"
* type = $CareSocialCodes#9f03dfbb-7a97-45a5-94db-d4c3501714a9 "opfølgning"
* period.start = 2020-07-22
* status = EncounterStatus#planned
* subject = Reference(Mark)
* class = V3ACTCODES#HH

Instance: MarkOgAkutsygeplejerske
InstanceOf: KLCommonCareSocialEncounter
Title: "Mark og Akutsygeplejerske"
Usage: #example
Description: "Kontakt hvor der leveres en akutindsats til Mark"
* type = $CareSocialCodes#15775b0a-7ec6-469e-9d3c-a81fbc9a1b45 "udførelse af akutindsats"
* period.start = 2020-06-21T15:30:00.000Z
* status = EncounterStatus#finished
* subject = Reference(Mark)
* participant.individual = Reference(AbrahamFraAkutSygeplejen)
* class = V3ACTCODES#HH

Instance: MarkogSaarsygeplejerske
InstanceOf: KLCommonCareSocialEncounter
Title: "Mark og sårsygepleje"
Usage: #example
Description: "Kontakt hvor der leveres en sårbehandling til Mark efter planen"
* type = $CareSocialCodes#784275f1-6822-4a88-b361-d958007d5253	//udførelse af planlagt indsats "udførelse af akutindsats"
* period.start = 2020-06-07T15:30:00.000Z
* status = EncounterStatus#finished
* subject = Reference(Mark)
* participant.individual = Reference(NatasjaFraSygeplejen)
* class = V3ACTCODES#HH

Instance: MarkogUdredningSygepleje
InstanceOf: KLCommonCareSocialEncounter
Title: "Mark og udredningSygepleje"
Usage: #example
Description: "Kontakt hvor der udføres en sygeplejefaglig udredning på Mark"
* type = $CareSocialCodes#829ac647-c7fc-4964-836b-f708d886e0e3 //oplysning
* period.start = 2020-06-05
* status = EncounterStatus#finished
* subject = Reference(Mark)
* participant.individual = Reference(HanneFraVisitationenAalborg)
* class = V3ACTCODES#HH
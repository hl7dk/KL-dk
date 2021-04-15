Profile: KLCommonCareSocialCompletedIntervention
Parent: Procedure
Title: "CompletedIntervention"
Description: "Documentation for completed inteventions (activities related to one and only one encounter) in Danish municipalities"

* complication 0..1
* complication from KLComplicationCodesSCT
* note 0..1
* subject only Reference(KLCommonCitizen)
* recorder only Reference(KLCommonPractitioner)
* code from KLInterventions (required)
* basedOn only Reference(KLCommonCareSocialPlannedIntervention or KLCommonCareSocialServiceRequest)
* encounter only Reference(KLCommonCareSocialEncounter)
* note.author[x] 0..0

//Danish descriptions
* status ^short = "[DK] leveretIndsatsAktivitetstatus"
* statusReason.text  ^short = "[DK] leveretIndsatsAktivitetstatusTekst"
* complication.coding ^short = "[DK] leveretIndsatsAktivitetAfvigelseskode"
* complication.text ^short = "[DK] leveretIndsatsAktivitetAfvigelsestekst"
* note.text ^short = "[DK] leveretIndsatsAktivitetNotat"
* subject ^short = "[DK] leveretIndsatsAktivitetSubjekt"
* recorder ^short = "[DK] leveretIndsatsAktivitetDokumenterendeLeverandør"
* code.coding ^short = "[DK] leveretIndsatsAktivitetKode"
* basedOn ^short = "[DK] leveretIndsatsAktivitetbevilling"
* encounter ^short = "[DK] leveretIndsatsAktivitetKontakt"
* performedPeriod.start ^short = "[DK] leveretIndsatsAktivitetStart"
* performedPeriod.end ^short = "[DK] leveretIndsatsAktivitetSlut"

Instance: AkutSygeplejeMark
InstanceOf: KLCommonCareSocialCompletedIntervention
Title: "Akutsygepleje Mark"
Description: "Levering af indsats til Mark vedr. undersøgelser og måling af værdier efter henvisning fra læge vedr. akut sygepleje"
Usage: #example
* status = #completed
* note.text = "Vitale værdier målt, blodtrykket er lavt. Vurderer efter samtale med borger, at han ikke drikker nok vand til daglig. Ringet til praktiserende læge, og har aftalt, at hun vurderer blodtryk og væskebalance og giver besked hvis akutsygeplejen skal gøre yderligere."
* complication.coding = SCT#160245001
* subject = Reference(Mark)
* recorder = Reference(AbrahamFraAkutSygeplejen)
* code = FSIII#G1.41 "Undersøgelser og måling af værdier"
* basedOn = Reference(HenvisningFraLageVedrAkutSygepleje)
* encounter = Reference(MarkOgAkutsygeplejerske)
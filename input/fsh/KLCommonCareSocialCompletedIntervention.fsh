Profile: KLCommonCareSocialCompletedIntervention
Parent: Procedure
Title: "KLCommonCareSocialCompletedIntervention"
Description: "Documentation for completed inteventions (activities related to one and only one encounter) in Danish municipalities"

* complication 0..1
* complication from KLComplicationCodesSCT
* note 0..1
* subject only Reference(KLCommonCitizen)
* recorder only Reference(KLCommonPractitioner)
* code from KLInterventions (required)
* basedOn only Reference(KLCommonCareSocialPlannedIntervention or KLCommonCareSocialServiceRequest)
* encounter only Reference(KLCommonCareSocialEncounter)
* status = #completed
* note.author[x] 0..0

//Danish descriptions
* status ^short = "[DK] leveretIndsatsstatus"
* complication.coding ^short = "[DK] leveretIndsatsAfvigelseskode"
* complication.text ^short = "[DK] leveretIndsatsAfvigelsestekst"
* note.text ^short = "[DK] leveretIndsatsNotat"
* subject ^short = "[DK] leveretIndsatsSubjekt"
* recorder ^short = "[DK] leveretIndsatsDokumenterendeLeverandør"
* code.coding ^short = "[DK] leveretIndsatsKode"
* basedOn ^short = "[DK] leveretIndsatsbevilling"
* encounter ^short = "[DK] leveretIndsatsKontakt"
* performedPeriod.start ^short = "[DK] leveretIndsatsStart"
* performedPeriod.end ^short = "[DK] leveretIndsatsSlut"
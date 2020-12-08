Profile: KLCommonCareSocialInformationGathering
Title: "KLCommonCareSocialInformationGathering"
Parent: ClinicalImpression
Description: "Information gathering resource used to group all the information collected in a clinical process such af a nursing status, a functional ability evaluation or a social paedagogical review"
* code from KLInformationGatheringTypeCodes (required)
* subject only Reference(KLCommonCitizen)
* assessor only Reference(KLCommonPractitioner)
* effective[x] only dateTime
* encounter only Reference(KLCommonCareSocialEncounter) 
* extension contains BasedOnServiceRequest named basedOnServiceRequest 0..1
* extension[basedOnServiceRequest].valueReference only Reference(KLCommonCareSocialServiceRequest)
* investigation.code from KLInformationGatheringInvestigationCodes (required)
* investigation.item only Reference(KLCommonCareSocialMatterOfInterest or KLCommonCareSocialEvaluation)
* finding.itemReference only Reference(KLCommonCareSocialCondition)

* code.coding ^short = "[DK] oplysningsaktivitetstype"
* subject ^short = "[DK] oplysningsaktivitetsubjekt"
* assessor ^short = "[DK] oplysningsaktivitetsudfører"
* effectiveDateTime ^short = "[DK] oplysningsaktivitetstid"
* encounter ^short = "[DK] oplysningsaktivitetskontakt"
* extension[basedOnServiceRequest] ^short = "[DK] oplysningsaktivitetsordre"
* investigation.code.coding ^short = "[DK] oplysningsaktivitetsObservationstype"
* investigation.item ^short = "[DK] OplysningsaktivitetsOplysning"
* investigation.item ^short = "[DK] oplysningsaktivitetsKonklusion"
* finding.itemReference ^short = "[DK] oplysningsaktivitetsTilstand"
* status ^short = "[DK] oplysningsaktivitetsstatus"

Instance: NursingStatusMark
InstanceOf: KLCommonCareSocialInformationGathering
Description: "Borgeren Marks sygeplejefaglige udredning"
Usage: #example
* code.coding = KLCommonCareSocialCodes#47fd1468-89da-4803-9d7a-ecc039a30d92 "sygeplejefaglig udredning, FSIII"
* subject = Reference(Mark)
* assessor = Reference(HanneFraVisitationenAalborg)
* effectiveDateTime = 2020-06-05
* encounter = Reference(MarkogUdredningSygepleje)
* investigation[0].code = FSIII#I7 "Respiration og cirkulation"
* investigation[0].item = Reference(RespirationCirculationInformationMark)
* investigation[1].code = FSIII#I4 "Hud og slimhinder"
* investigation[1].item = Reference(SkinInformationMark)
* finding.itemReference = Reference(ConditionPressureUlcer)
* status = #completed

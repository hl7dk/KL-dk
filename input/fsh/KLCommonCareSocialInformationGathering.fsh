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

Profile:        KLCommonCareSocialEvaluation
Parent:         Observation
Title:          "CommonCareSocialEvaluation"
Description:    "Professional evaluation on citizen status based on gathered information, conditions, observations and citizen preferences used in Danish municipalities"



* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open

* code.coding 1..2
* code.coding contains
   klEvaluationCode 1..1 and sctEvaluationCode 0..1

* code.coding[klEvaluationCode] from KLEvaluationTypeCodes (required)
* code.coding[klEvaluationCode].system = KLCommonCareSocialCodeSystem

* code.coding[sctEvaluationCode] from KLEvaluationTypeCodesSCT (required)
* code.coding[sctEvaluationCode].system = SCT

* value[x] only CodeableConcept
* valueCodeableConcept from KLNeedsAssessmentCodesFFB //kun for støttebehov
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)
* performer only Reference(KLCommonPractitioner)
* effective[x] 1..1
* effective[x] only dateTime

Instance: AndreasStottebehov
InstanceOf: KLCommonCareSocialEvaluation
Title: "Andreas Støttebehov"
Description: "Eksempel på støttebehov"
Usage: #example
* code.coding[klEvaluationCode] = KLCommonCareSocialCodes#effe55c7-572c-4a99-8fb4-2a9dda2f6572 "FFB støttebehovsvurdering"
* code.coding[sctEvaluationCode] = SCT#225344000 "vurdering af graden af påkrævet hjælp"
* valueCodeableConcept.text = "Andreas støttebehov er meget højt, når det drejer sig om relationer. Vedr. daglige rutiner er det mindre"
* valueCodeableConcept.coding = FFB#b99a0790-4d70-4152-b149-3fe58b745583 "Højt støttebehov"
* effectiveDateTime = 2020-08-12
* status = #final
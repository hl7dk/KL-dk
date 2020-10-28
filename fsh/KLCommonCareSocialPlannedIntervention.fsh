Profile:        KLCommonCareSocialPlannedIntervention
Parent:         CarePlan
Title:          "KLCommonCareSocialPlannedIntervention"
Description:    "Planned interventions (indsats/ydelse) in Danish Municipalities"

* activity.detail.code from KLInterventions (required)
* activity.detail.code 1..1
* activity 1..1
//* activity.detail.description MS
* activity.detail.performer only Reference(KLCommonOrganization)
* created 1..1
* subject only Reference(KLCommonCitizen)
* author only Reference(KLCommonOrganization)
* extension contains
   FollowUpEncounter named followUpEncounter 0..1 and
   RelevantHist named relevantHistory 0..*

* basedOn only Reference(KLCommonCareSocialCarePlan)
* activity.detail.reasonReference only Reference(KLCommonCareSocialCondition)
* activity.detail.goal only Reference(KLCommonCareSocialGoal)
* activity.outcomeReference only Reference(KLCommonCareSocialEncounter)

//shorts
* activity.detail.code.coding ^short = "[DK] indsatsskode"
* activity.detail.description ^short = "[DK] handlingsanvisning"
* created ^short = "[DK] indsatsoprettelsestid"
* period.start ^short = "[DK] indsatsbevillingstid"
* period.end ^short = "[DK] indsatsafslutningstid"
* status ^short = "[DK] indsatsstatus"
* intent ^short = "[DK] indsatshensigt"
* subject ^short = "[DK] indsatssubjekt"
* author ^short = "[DK] indsatsansvarlig"
* activity.detail.performer ^short = "[DK] indsatsleverandør"
* extension[FollowUpEncounter] ^short = "[DK] indsatsPlanlagtOpfølgning"
* basedOn ^short = "[DK] indsatsDelAfPlan"
* activity.detail.reasonReference ^short = "[DK] indsatsbegrundelse"
* activity.detail.goal ^short = "[DK] indsatsmål"
* activity.outcomeReference ^short = "[DK] indsatsgennemførtAktivitet"
* extension[relevantHistory] ^short = "[DK] indsatsændringshistorie"
* activity.detail.status ^short = "[DK] indsatsAktivitetsstatus"


Instance: PressureUlcerIntervention
InstanceOf: KLCommonCareSocialPlannedIntervention
Title: "PlannedUlcerIntervention"
Description: "Mark's planned pressure ulcer intervention"
Usage: #example
* activity.detail.code = FSIII#G1.39 "Sårbehandling"
* activity.detail.description = "Tryksår på venstre ben skal tilses og behandles dagligt. Vigtigt at tjekke for infektion"
* created = 2020-05-29
* intent = CarePlanIntentCodes#order
* status = RequestStatusCodes#active
* period.start = 2020-05-30
* author = Reference(HjemmesygeplejeSonderborg)
* activity.detail.status = CarePlanActivityStatus#in-progress
* subject = Reference(Mark)
* author = Reference(HjemmesygeplejeSonderborg)
* activity.detail.performer = Reference(HjemmesygeplejeSonderborg)

Instance: AndreasSocialeRelationer
InstanceOf: KLCommonCareSocialPlannedIntervention
Usage: #example
* basedOn = Reference(NySocialIndsats)
* activity.detail.code.coding[0].code = FFB#05cd5e81-1a3a-4bdd-901b-7ec96c12d990 "Støtte til sociale relationer"
* activity.detail.status = CarePlanActivityStatus#in-progress
* subject = Reference(Andreas)
* intent = CarePlanIntentCodes#order
* status = RequestStatusCodes#active
* created = 2020-08-12

Instance: AndreasDagligeOpgaver
InstanceOf: KLCommonCareSocialPlannedIntervention
Usage: #example
* basedOn = Reference(NySocialIndsats)
* activity.detail.code = FFB#638f44df-6bf2-47f8-9935-b8fdc83e5bf5 "Støtte til daglige opgaver i hjemmet"
* activity.detail.status = CarePlanActivityStatus#in-progress
* subject = Reference(Andreas)
* intent = CarePlanIntentCodes#order
* status = RequestStatusCodes#active
* created = 2020-08-12
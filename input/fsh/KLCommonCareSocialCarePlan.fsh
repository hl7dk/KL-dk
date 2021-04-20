Profile: KLCommonCareSocialCarePlan
Parent: CarePlan
Title: "CarePlan"
Description: "Overall CarePlan for Danish municipalities, for individual plans regarding social care, and health act §140 and §119"

* category from KLCarePlanCategoryCodes (extensible)
* category 1..1
* description MS
* goal 1..*

//Slicing code, declaring disciminator, and slicing type
* goal ^slicing.discriminator.type = #value
* goal ^slicing.discriminator.path = "resolve().category"
* goal ^slicing.rules = #open
* goal ^slicing.ordered = false   // can be omitted, since false is the default
* goal ^slicing.description = "Slice based on the category value which specify different goal-types as defined by FSIII og FFB respectively"  // optional - does not appear
//Declaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code

* goal contains
   fpurpose 1..1 and ffbgoal 0..*

* goal[fpurpose] only Reference(KLCommonCareSocialPurpose)
* goal[ffbgoal] only Reference(KLCommonCareSocialFFBGoal)

* created 1..1
* subject only Reference(KLCommonCitizen)
* author only Reference(KLCommonOrganization)
* careTeam only Reference(KLCommonServicePerformer) // Careteam indeholder både tilbuds-typen og den organisation der står for levering af tilbudet
* addresses.extension contains ConditionRank named conditionRank 0..1 //primær og sekundær målgruppe https://chat.fhir.org/#narrow/stream/179166-implementers/topic/CarePlan.20addresses
* addresses only Reference(KLCommonCareSocialFocusCondition) 
* extension contains RelevantHist named relevantHistory 0..*
* activity ^slicing.discriminator.type = #value
* activity ^slicing.discriminator.path = "detail.code"
* activity ^slicing.rules = #open
* activity ^slicing.ordered = false 

* extension contains
   MunicipalityCaseNumber named officialmunicipalityCaseNumber 0..1 and
   MunicipalityCaseNumber named municipalitiSpecificCaseNumber 0..1

* extension[officialmunicipalityCaseNumber].valueIdentifier = KLCommonOfficialCaseIdentifier
* extension[municipalitiSpecificCaseNumber].valueIdentifier = KLCommonMunicipalitySpecificCaseIdentifier
    

* activity contains
   carePlanEvaluation 0..*

* activity[carePlanEvaluation].detail.code = KLCommonCareSocialCodes#effe55c7-572c-4a99-8fb4-2a9dda2f6572
* activity[carePlanEvaluation].outcomeReference only Reference(KLCommonCareSocialEvaluation) //støttebehovsvurdering

* category.coding ^short = "[DK] indsatsforløbKategori"
* goal[fpurpose] ^short = "[DK] indsatsforløbFormål" 
* description ^short = "[DK] indsatsforløbBeskrivelse" 
* created ^short = "[DK] indsatsforløbOprettelsestid" 
* period.start ^short = "[DK] indsatsforløbBevillingstid" 
* period.end ^short = "[DK] indsatsforløbAfslutningstid" 
* subject ^short = "[DK] indsatsforløbsubjekt" 
* author ^short = "[DK] indsatsforløbansvarlig" 
* careTeam ^short = "[DK] indsatsforløbsleverandør og indsatsforløbtilbud" 
* addresses ^short = "[DK] indsatsforløbmålgruppe"
* addresses.extension[conditionRank] ^short = "[DK] indsatsforløbsmålgruppeRang" 
* intent ^short = "[DK] indsatsforløbhensigt" 
* status ^short = "[DK] indsatsforløbstatus" 
* extension[relevantHistory] ^short = "[DK] indsatsforløbændringshistorie" 
* goal[ffbgoal] ^short = "[DK] indsatsforløbsmål" 
* activity[carePlanEvaluation].outcomeReference ^short = "[DK] støttebehovsvurdering"
* activity[carePlanEvaluation].detail.code.coding ^short = "[DK] støttebehovsvurdering"
* extension[officialmunicipalityCaseNumber] ^short = "[DK] anledningDokumenteretISag"
* extension[municipalitiSpecificCaseNumber] ^short = "[DK] anledningDokumenteretISag"

Instance: FFBIndsats
InstanceOf: KLCommonCareSocialCarePlan
Title: "Andreas midlertidigt ophold"
Description: "Andreas social indsats vedr. midlertidigt ophold"
Usage: #example
* status = RequestStatusCodes#active
* intent = CarePlanIntentCodes#order
* category = KLCommonCareSocialCodes#4a297733-4d66-4726-a933-590d55cf91e0 "Social indsats"
* subject = Reference(Andreas)
* created = 2020-07-06
* period.start = 2020-07-07
* goal[fpurpose] = Reference(AndreasIndsatsformaal)
* description = "Andreas plan for midlertidigt ophold omfatter socialpædagogiske tiltag, med fokus på at klare sig selv i hverdagsaktiviteter, og opbygge relationer til personale og de andre beboere. Ved indsatsens afslutning skal Andreas genvurderes mhp. at finde en permanent løsning, der tilsvarer Andreas funktionsniveau."
* author = Reference(SocialOgSundhedMorsoe)
* careTeam = Reference(MidlertidigtOpholdBotilbuddetHvidbjerghus)
* addresses[0] = Reference(AndreasMaalgruppeUdviklingshamning)
* addresses[0].extension[conditionRank].valuePositiveInt = 1
* activity[carePlanEvaluation].outcomeReference = Reference(AndreasStottebehov)
* activity[carePlanEvaluation].detail.code = KLCommonCareSocialCodes#effe55c7-572c-4a99-8fb4-2a9dda2f6572
* activity[carePlanEvaluation].detail.status = CarePlanActivityStatus#completed

Instance: NySocialIndsats
InstanceOf: KLCommonCareSocialCarePlan
Title: "Andreas alment botilbud"
Description: "Andreas social indsats vedr. almen botilbud"
Usage: #example
* subject = Reference(Andreas)
* description = "Andreas plan for alment botilbud omfatter socialpædagogiske tiltag, med fokus på at klare sig selv i hverdagsaktiviteter, og opbygge relationer til personale og de andre beboere."
* careTeam = Reference(AlmBotilbud)
* category = KLCommonCareSocialCodes#4a297733-4d66-4726-a933-590d55cf91e0 "Social indsats"
* addresses = Reference(AndreasMaalgruppeUdviklingshamning)
* created = 2020-08-12
* goal[fpurpose] = Reference(AndreasIndsatsformaal2)
* status = RequestStatusCodes#active
* intent = CarePlanIntentCodes#order
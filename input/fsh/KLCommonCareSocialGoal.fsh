Profile: KLCommonCareSocialGoal
Parent: Goal
Title: "Goal"
Description: "Goal as defined in Danish municipalities"

* category 1..1
* category from KLGoalTypeCodes
* target.measure from KLTargetMeasureCodes (extensible)

* target ^slicing.discriminator.type = #value
* target ^slicing.discriminator.path = "measure"
* target ^slicing.rules = #open

//Declaring the slices, and their cardinalities 
* target contains
   severitySlice 0..1 and changeValueSlice 0..1

//Declaring the value set binding for the KLConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work
* target[severitySlice].detail[x] only CodeableConcept
* target[severitySlice].detailCodeableConcept from KLSeverities
* target[severitySlice].measure = $CareSocialCodes#66959f77-6e2a-4574-8423-3ff097f8b9fa //"funktionsevneniveau"
* target[changeValueSlice].detail[x] only CodeableConcept
* target[changeValueSlice].detailCodeableConcept from KLChangeValueCodes
* target[changeValueSlice].measure = $CareSocialCodes#90c48f03-f194-4b2f-ad7d-6cba1069ae48 //"måltype"
* subject only Reference(KLCommonCitizen)
* expressedBy only Reference(KLCommonPractitioner or KLCommonCitizen)
* addresses only Reference(KLCommonCareSocialCondition or KLCommonCareSocialMatterOfInterest)
* addresses.extension contains ConditionRank named conditionRank 0..1 //only one with ConditionRank 1, this needs to be a condition, not an information. 
* extension contains
   GoalRelationship named goalRelationship 0..1
* extension[goalRelationship].extension[type].valueCodeableConcept.text = "based-on" //bruges til at relaterer et delmål, til et indsatsmål
* extension[goalRelationship].extension[target].valueReference only Reference(KLCommonCareSocialGoal)
* outcomeCode.extension contains
   MatterOfInterestInformer named matterOfInterestInformer 0..1

* category ^short = "[DK] målkategori"
* target[severitySlice] ^short = "[DK] målSværhedsgrad"
* target[changeValueSlice] ^short = "[DK] måltype"
* description ^short = "[DK] målbeskrivelse"
* subject ^short = "[DK] målSubjekt"
* expressedBy ^short = "[DK] målAnsvarlig"
* addresses ^short = "[DK] målrelateret"
* addresses.extension[conditionRank] ^short = "[DK] målrelateretRang"
* note.text ^short = "[DK] målnotat"
* outcomeCode.text ^short = "[DK] målvurdering"
* outcomeCode.extension[matterOfInterestInformer] ^short = "[DK] målvurderingsInformant"
* target.measure ^short = "[DK] målemetode"
* extension[goalRelationship].extension[type].valueCodeableConcept ^short = "[DK] delmålBaseretPå"
* extension[goalRelationship].extension[target].valueReference ^short = "[DK] delmålBaseretPå"

Profile: KLCommonCareSocialPurpose
Title: "Goal - Purpose"
Parent: KLCommonCareSocialGoal
Description: "Purpose as defined by FFB in Danish municipalities"
* category = $CareSocialCodes#424827b1-23aa-4848-962b-56ee47def560

Profile: KLCommonCareSocialFFBGoal
Title: "Goal - FFB Intervention"
Parent: KLCommonCareSocialGoal
Description: "FFB goal as defined by FFB in Danish municipalities"
* category = $CareSocialCodes#0bb3daef-538d-45dc-b444-abdbcb63f6bc "FFB indsatsmål"

Instance: JudithForventetTilstand
InstanceOf: KLCommonCareSocialGoal
Title: "Judith forventet tilstand"
Description: "Forventet tilstand for Judith, der har et mobilitetsproblem"
Usage: #example
* category = $CareSocialCodes#ca552020-6ed1-4cdc-b0d4-32697f1f27ad //"FSIII tilstandsmål"
* description = $FSIII#e182c5dc-9f91-474a-92e8-f62be3d498f4 "Tilstand forsvinder, mindskes eller forbliver uændret"
* target[severitySlice].measure.coding.code = #66959f77-6e2a-4574-8423-3ff097f8b9fa //severity
* target[severitySlice].measure.coding.system = $CareSocialCodes
* target[severitySlice].detailCodeableConcept.coding = $FSIII#B3 "Moderate begrænsninger"
* addresses = Reference(ConditionWalking)
* subject = Reference(Judith)
* expressedBy = Reference(HanneFraVisitationenAalborg)
* lifecycleStatus = GoalStatusCodes#active

Instance: MarkForventetTilstand
InstanceOf: KLCommonCareSocialGoal
Title: "Mark forventet tilstand"
Description: "Forventet tilstand for Mark, der har et tryksårsproblem"
Usage: #example
* category = $CareSocialCodes#ca552020-6ed1-4cdc-b0d4-32697f1f27ad "FSIII tilstandsmål"
* description.text = "Tryksåret er helet"
* target[changeValueSlice].measure.coding.code = #90c48f03-f194-4b2f-ad7d-6cba1069ae48
* target[changeValueSlice].measure.coding.system = $CareSocialCodes
* target[changeValueSlice].detailCodeableConcept.coding = $FSIII#81c827de-ef31-4410-aa57-0d1d1bc6c264 "Tilstand forsvinder"
* addresses = Reference(ConditionPressureUlcer)
* subject = Reference(Mark)
* expressedBy = Reference(HanneFraVisitationenAalborg)
* lifecycleStatus = GoalStatusCodes#active

Instance: MarkIndsatsmaal
InstanceOf: KLCommonCareSocialGoal
Title: "Mark indsatsmål"
Description: "FSIII indsatsmål for Mark, der har et tryksårsproblem"
Usage: #example
* category = $CareSocialCodes#e6f35a88-6665-4471-9dce-9a98854532b4 "FSIII indsatsmål"
* description.text = "Målemetoden: Sårets areal sættes op for Marks tryksår"
* target.measure.coding = SCT#420753006 "Pressure ulcer surface area (observable entity)"
* addresses = Reference(ConditionPressureUlcer)
* subject = Reference(Mark)
* expressedBy = Reference(HanneFraVisitationenAalborg)
* lifecycleStatus = GoalStatusCodes#active

Instance: AndreasMaalOnsker
InstanceOf: KLCommonCareSocialGoal
Title: "Andreas mål og ønsker"
Description: "Mål og ønsker for Andreas"
Usage: #example
* category = $CareSocialCodes#416fe27d-3ccf-4390-8742-8b52a9d8dc78 "FFB borgers mål og ønsker"
* description.text = "Andreas ønsker en hverdag med venner og aktiviteter, så han har noget at stå op til og søde mennesker at være sammen med. Det er vigtigt for ham at være ren og pæn, og selv stå for det i videst muligt omfang."
* subject = Reference(Andreas)
* lifecycleStatus = GoalStatusCodes#active
* expressedBy = Reference(BirteFraVisitationenMorsoe)

Instance: AndreasIndsatsformaal
InstanceOf: KLCommonCareSocialPurpose
Title: "Andreas indsatsformål"
Description: "Indsatsformål for Andreas"
Usage: #example
* category = $CareSocialCodes#424827b1-23aa-4848-962b-56ee47def560 "Indsatsformål"
* description.text = "Andreas ønsker en hverdag med venner og aktiviteter, så han har noget at stå op til og søde mennesker at være sammen med. Det er vigtigt for ham at være ren og pæn, og selv stå for det i videst mulig omfang."
* subject = Reference(Andreas)
* lifecycleStatus = GoalStatusCodes#active
* expressedBy = Reference(BirteFraVisitationenMorsoe)

Instance: AndreasIndsatsformaal2
InstanceOf: KLCommonCareSocialPurpose
Title: "Andreas indsatsformål ifm ny indsats"
Description: "Indsatsformål for Andreas ifm. at han skifter fra midlertidig til almen botilbud"
Usage: #example
* category = $CareSocialCodes#424827b1-23aa-4848-962b-56ee47def560 "Indsatsformål"
* description.text = "understøtte Andreas i selv at tilegne sig færdigheder, der gør at han kan have kontakt med andre både ift. at samarbejdende om praktiske ting og ift klare almindelige sociale situationer som fx at se film eller spise med en gruppe af jævnaldrende. Desuden at holde orden på sit eget værelse, så han undgår frustration over ikke at kunne finde sine ting."
* subject = Reference(Andreas)
* lifecycleStatus = GoalStatusCodes#active
* expressedBy = Reference(BirteFraVisitationenMorsoe)

Instance: Andreasindsatsmaal
InstanceOf: KLCommonCareSocialFFBGoal
Title: "Andreas indsatsmål"
Description: "Indsatsmål for Andreas"
Usage: #example
* category.coding.code = #0bb3daef-538d-45dc-b444-abdbcb63f6bc
* category.coding.display = "FFB indsatsmål"
* category.coding.system = $CareSocialCodes
* subject = Reference(Andreas)
* lifecycleStatus = GoalStatusCodes#active
* description.text = "holder orden på sit eget værelse"
* target[severitySlice].measure.coding.code = #66959f77-6e2a-4574-8423-3ff097f8b9fa
* target[severitySlice].measure.coding.system = $CareSocialCodes
* target[severitySlice].detailCodeableConcept.coding.code = #8328ce4a-6238-4f73-bf1a-74aadb68eff8
* target[severitySlice].detailCodeableConcept.coding.display = "Let nedsat funktionsevne"
* target[severitySlice].detailCodeableConcept.coding.system = $FFB
* target[changeValueSlice].measure.coding.code = #90c48f03-f194-4b2f-ad7d-6cba1069ae48
* target[changeValueSlice].measure.coding.system = $CareSocialCodes
* target[changeValueSlice].detailCodeableConcept.coding.code = #d41c8072-52f8-42b5-9375-ddbea454d27f
* target[changeValueSlice].detailCodeableConcept.coding.display = "Udvikle funktionsevne"
* target[changeValueSlice].detailCodeableConcept.coding.system = $FFB
* addresses = Reference(ConditionCleaning)
* addresses.extension[conditionRank].valuePositiveInt = 1
* expressedBy = Reference(BirteFraVisitationenMorsoe)

Instance: AndreasindsatsmaalOpfolgning
InstanceOf: KLCommonCareSocialFFBGoal
Title: "Andreas opfølgning på indsatsmål"
Description: "Indsatsmål for Andreas, som dokumenteret efter opfølgningstidspunktet (Tilstanden ikke opdateret, fordi implementation guiden ikke versionshåndterer)"
Usage: #example
* category.coding.code = #0bb3daef-538d-45dc-b444-abdbcb63f6bc
* category.coding.display = "FFB indsatsmål"
* category.coding.system = $CareSocialCodes
* subject = Reference(Andreas)
* lifecycleStatus = GoalStatusCodes#completed
* description.text = "holder orden på sit eget værelse"
* target[severitySlice].measure.coding.code = #66959f77-6e2a-4574-8423-3ff097f8b9fa
* target[severitySlice].measure.coding.system = $CareSocialCodes
* target[severitySlice].detailCodeableConcept.coding.code = #8328ce4a-6238-4f73-bf1a-74aadb68eff8
* target[severitySlice].detailCodeableConcept.coding.display = "Let nedsat funktionsevne"
* target[severitySlice].detailCodeableConcept.coding.system = $FFB
* target[changeValueSlice].measure.coding.code = #90c48f03-f194-4b2f-ad7d-6cba1069ae48
* target[changeValueSlice].measure.coding.system = $CareSocialCodes
* target[changeValueSlice].detailCodeableConcept.coding.code = #d41c8072-52f8-42b5-9375-ddbea454d27f
* target[changeValueSlice].detailCodeableConcept.coding.display = "Udvikle funktionsevne"
* target[changeValueSlice].detailCodeableConcept.coding.system = $FFB
* addresses = Reference(ConditionCleaning)
* addresses.extension[conditionRank].valuePositiveInt = 1
* outcomeCode.text = "Andreas har fået styr på morgenrutiner omkring oprydning på værelset. Skal dog stadig mindes om oprydning ind imellem og har brug for støtte fra piktogrammer."
* outcomeCode.extension[matterOfInterestInformer].valueCodeableConcept = $CareSocialCodes#f6ea2920-7dde-491e-a489-6b99a3904069 "Sagsbehandler"
* expressedBy = Reference(BirteFraVisitationenMorsoe)

Instance: AndreasDelmaal
InstanceOf: KLCommonCareSocialGoal
Title: "Andreas Delmål"
Description: "Delmål for Andreas"
Usage: #example
* category.coding = $CareSocialCodes#6746d4af-145a-4bfd-a672-05c0cf11b53b "FFB delmål"
* subject = Reference(Andreas)
* lifecycleStatus = GoalStatusCodes#active
* description.text = "Første delmål er at Andreas hver morgen for ryddet sit gulv for tøj, og sorteret det i rent og beskidt."
* note.text = "Andreas støttes hver morgen i at få ryddet gulvet. Der er hængt et piktogram op med rutinen trin for trin"
* note.time = 2020-09-10
* extension[goalRelationship].extension[type].valueCodeableConcept.text = "based-on" //bruges til at relaterer et delmål, til et indsatsmål
* extension[goalRelationship].extension[type].valueCodeableConcept.coding.system = "http://terminology.hl7.org/CodeSystem/goal-relationship-type"
* extension[goalRelationship].extension[type].valueCodeableConcept.coding.code = #other
* extension[goalRelationship].extension[target].valueReference = Reference(Andreasindsatsmaal)
* expressedBy = Reference(AnneFraHvidbjerghus)
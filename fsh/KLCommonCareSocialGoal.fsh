Profile: KLCommonCareSocialGoal
Parent: Goal
Title: "CommonCareSocialGoal"
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
* target[severitySlice].measure = KLCommonCareSocialCodes#66959f77-6e2a-4574-8423-3ff097f8b9fa //"funktionsevneniveau"

* target[changeValueSlice].detail[x] only CodeableConcept
* target[changeValueSlice].detailCodeableConcept from KLChangeValueCodes
* target[changeValueSlice].measure = KLCommonCareSocialCodes#90c48f03-f194-4b2f-ad7d-6cba1069ae48 //"måltype"
* subject only Reference(KLCommonCitizen)
* expressedBy only Reference(KLCommonPractitioner or KLCommonCitizen)
* addresses only Reference(KLCommonCareSocialCondition or KLCommonCareSocialMatterOfInterest)
* addresses.extension contains ConditionRank named conditionRank 0..1 //only one with ConditionRank 1, this needs to be a condition, not an information. 
//* outcomeReference only Reference(KLCommonCareSocialSeverity) // Design målopfyldelse som reference til Severity, Severity.note kan bruges til tilhørende notat.

Profile: KLCommonCareSocialPurpose
Title: "CommonCareSocialPurpose"
Parent: KLCommonCareSocialGoal
Description: "Purpose as defined by FFB in Danish municipalities"
* category = KLCommonCareSocialCodes#424827b1-23aa-4848-962b-56ee47def560

Profile: KLCommonCareSocialFFBGoal
Title: "KLCommonCareSocialFFBGoal"
Parent: KLCommonCareSocialGoal
Description: "FFB goal as defined by FFB in Danish municipalities"
* category = KLCommonCareSocialCodes#0bb3daef-538d-45dc-b444-abdbcb63f6bc "FFB indsatsmål"

Instance: AndreasLivsmaal
InstanceOf: KLCommonCareSocialGoal
Title: "AndreasMålOgØnsker"
Description: "Mål og ønsker for Andreas"
Usage: #example
* category = KLCommonCareSocialCodes#416fe27d-3ccf-4390-8742-8b52a9d8dc78 "FFB borgers mål og ønsker"
* description.text = "Andreas ønsker en hverdag med venner og aktiviteter, så han har noget at stå op til og søde mennesker at være sammen med. Det er vigtigt for ham at være ren og pæn, og selv stå for det i videst mulig omfang."
* subject = Reference(Andreas)
* lifecycleStatus = #active

Instance: AndreasIndsatsformaal
InstanceOf: KLCommonCareSocialPurpose
Title: "AndreasIndsatsformål"
Description: "Indsatsformål for Andreas"
Usage: #example
* category = KLCommonCareSocialCodes#424827b1-23aa-4848-962b-56ee47def560 "Indsatsformål"
* description.text = "Andreas ønsker en hverdag med venner og aktiviteter, så han har noget at stå op til og søde mennesker at være sammen med. Det er vigtigt for ham at være ren og pæn, og selv stå for det i videst mulig omfang."
* subject = Reference(Andreas)
* lifecycleStatus = #active

Instance: AndreasIndsatsformaal2
InstanceOf: KLCommonCareSocialPurpose
Title: "AndreasIndsatsformål2"
Description: "Indsatsformål for Andreas"
Usage: #example
* category = KLCommonCareSocialCodes#424827b1-23aa-4848-962b-56ee47def560 "Indsatsformål"
* description.text = "understøtte Andreas i selv at tilegne sig færdigheder, der gør at han kan have kontakt med andre både ift. at samarbejdende om praktiske ting og ift klare almindelige sociale situationer som fx at se film eller spise med en gruppe af jævnaldrende. Desuden at holde orden på sit eget værelse, så han undgår frustration over ikke at kunne finde sine ting."
* subject = Reference(Andreas)
* lifecycleStatus = #active

Instance: Andreasindsatsmaal
InstanceOf: KLCommonCareSocialGoal
Title: "AndreasIndsatsmål"
Description: "Indsatsmål for Andreas"
Usage: #example
* category.coding.code = #0bb3daef-538d-45dc-b444-abdbcb63f6bc
* category.coding.display = "FFB indsatsmål"
* category.coding.system = KLCommonCareSocialCodes
* subject = Reference(Andreas)
* lifecycleStatus = #active
* description.text = "holder orden på sit eget værelse"
* target[severitySlice].measure.coding.code = #66959f77-6e2a-4574-8423-3ff097f8b9fa
* target[severitySlice].measure.coding.system = KLCommonCareSocialCodes
* target[severitySlice].detailCodeableConcept.coding.code = #8328ce4a-6238-4f73-bf1a-74aadb68eff8
* target[severitySlice].detailCodeableConcept.coding.display = "Let nedsat funktionsevne"
* target[severitySlice].detailCodeableConcept.coding.system = FFB
* target[changeValueSlice].measure.coding.code = #90c48f03-f194-4b2f-ad7d-6cba1069ae48
* target[changeValueSlice].measure.coding.system = KLCommonCareSocialCodes
* target[changeValueSlice].detailCodeableConcept.coding.code = #d41c8072-52f8-42b5-9375-ddbea454d27f
* target[changeValueSlice].detailCodeableConcept.coding.display = "Udvikle funktionsevne"
* target[changeValueSlice].detailCodeableConcept.coding.system = FFB
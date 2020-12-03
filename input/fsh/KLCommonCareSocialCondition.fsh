Profile:        KLCommonCareSocialCondition
Parent:         Condition
Title:          "KLCommonCareSocialCondition"
Description:    """
Detailed information about conditions in Danish municiplities health, social and elderly care.
"""
//Setting the cardinality of the clinical status
* clinicalStatus 1..1
//Setting cardinality of recordedDate (oprettelsestid)
* recordedDate 1..1
//Declaring the cardinality of code
* code 1..1
//Slicing code, declaring disciminator, and slicing type
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false   // can be omitted, since false is the default
* code.coding ^slicing.description = "Slice based on the code.system value which allow both a FSIII/FFB condition code and a SNOMED CT code to represent a condition"  // optional - does not appear
//Declaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code
* code.coding contains
   FSIIIConditionCode 0..1 and FFBConditionCode 0..1 and SCTConditionCode 0..1 

//Declaring the value set binding for the KLConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work
* code.coding[FSIIIConditionCode] from KLConditionCodesFSIII (required)
* code.coding[FSIIIConditionCode].system = FSIII

* code.coding[FFBConditionCode] from KLConditionCodesFFB (required)
* code.coding[FFBConditionCode].system = FFB

//Declaring the value set binding for the SCTConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work (See Aliases for value set, and system info)
* code.coding[SCTConditionCode] from SCTConditionValueset (required)
* code.coding[SCTConditionCode].system = SCT

//Setting the value set of the severities attribute
* severity from KLSeverities (required)

//Declaring extensions, used in this profile. 
//See extension file for the locally defined and,
//aliases for the externaly defined
* extension contains
   ExtEventHist named eventHistory 0..1 and 
   ExtDueTo named dueTo 0..1 and
   FollowUpEncounter named followUpEncounter 0..1

//Specifying the use af the extension in this profile, by constraining content futher
* extension[dueTo].value[x] only Reference
* extension[dueTo].valueReference only Reference(KLCommonCareSocialCondition or KLCommonCrossSectorCondition)

//Specifying datatype of abatement, subject, asserter and evidence
* abatement[x] only dateTime
* subject only Reference(KLCommonCitizen)
* asserter only Reference(KLCommonPractitioner)
* evidence.detail only Reference(KLCommonCareSocialMatterOfInterest or KLCommonCareSocialFollowUp)

//Specifying note (fagligt notat)
* note.author[x] only Reference
* note.authorReference only Reference(KLCommonPractitioner)

//Specifying dansih descriptions
* code.coding ^short = "[DK] tilstandskode"
* code.coding[FSIIIConditionCode] ^short = "[DK] FSIII tilstandskode"
* code.coding[FFBConditionCode] ^short = "[DK] FFB undertemakode"
* code.coding[SCTConditionCode] ^short = "[DK] SNOMED CT tilstandskode"
* severity.coding ^short = "[DK] tilstandssværhedsgrad" 
* clinicalStatus ^short = "[DK] tilstandsstatus" 
* code.text ^short = "[DK] tilstandsvurdering" 
* note.text ^short = "[DK] tilstandFagligtNotat" 
* recordedDate ^short = "[DK] tilstandsoprettelsestid" 
* abatementDateTime ^short = "[DK] tilstandsafslutningstid" 
* extension[followUpEncounter] ^short = "[DK] tilstandsplanlagtOpfølgning" 
* extension[dueTo] ^short = "[DK] tilstandsårsag" 
* subject ^short = "[DK] tilstandssubjekt" 
* asserter ^short = "[DK] tilstandsansvarlig" 
* extension[eventHistory] ^short = "[DK] tilstandsændringshistorie" 
* evidence.detail ^short = "[DK] tilstandsevidens (herunder tilstandOplysning og tilstandOpfølgningsresultat)" 
* category.coding ^short = "[DK] tilstandsfokus"


Instance: ConditionPressureUlcer
InstanceOf: KLCommonCareSocialCondition
Description: "Example of the citizen, Mark, who has a pressure ulcer"
Usage: #example
* code.coding[0] = FSIII#I4.4 "Problemer med tryksår"
* code.coding[1] = SCT#420324007 "Pressure ulcer stage 2"
* code.text = "Tryksår i stadium 2, siddende på venstre lår. 4cmx5cm, dybde 3mm, ingen infektion."
* clinicalStatus = CONCLIN#active
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* subject = Reference(Mark)
* recordedDate = 2020-06-05
* extension[followUpEncounter].valueReference = Reference(MarkFollowUpPlanned)
* asserter = Reference(HanneFraVisitationenAalborg)
* evidence.detail = Reference(Reference(SkinInformationMark)

Instance: ConditionWalking
InstanceOf: KLCommonCareSocialCondition
Description: "Example of the citizen, Judith, who has troubles walking"
Usage: #example
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* code.coding = FSIII#J3.8
* code.coding.display = "Gå"
* code.text = "Hun har en meget dårlig gangfunktion, selv om hun bruger rollator"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* severity = FSIII#B4 "Svære begrænsninger"
* subject = Reference(Judith)
* recordedDate = 2020-08-11
* asserter = Reference(HanneFraVisitationenAalborg)

Instance: ConditionCleaning
InstanceOf: KLCommonCareSocialCondition
Description: "Example of the citizen, Andreas, who has troubles cleaning"
Usage: #example
* subject = Reference(Andreas)
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* code.coding = FFB#8f32c948-41c4-49d7-8913-cdeede2e7fe1
* code.coding.display = "Gøre rent"
* severity.coding = FFB#cae545f5-2813-4d79-98fc-0a7d770af3cd
* severity.coding.display = "Svært nedsat funktionsevne"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* recordedDate = 2020-08-12
* asserter = Reference(BirteFraVisitationenMorsoe)

Instance: ConditionCleaningWithNote
InstanceOf: KLCommonCareSocialCondition
Description: "Example of the citizen, Andreas, who has troubles cleaning, and a performer that makes a note during his stay at Hvidbjerghus"
Usage: #example
* subject = Reference(Andreas)
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* code.coding = FFB#8f32c948-41c4-49d7-8913-cdeede2e7fe1
* code.coding.display = "Gøre rent"
* severity.coding = FFB#cae545f5-2813-4d79-98fc-0a7d770af3cd
* severity.coding.display = "Svært nedsat funktionsevne"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* recordedDate = 2020-08-12
* asserter = Reference(BirteFraVisitationenMorsoe)
* note.text = "Andreas er blevet bedre til at rydde op og gøre rent efter sig, når han har spist. Ryddelighed og renlighed på værelset kræver fortsat meget støtte"
* note.authorReference = Reference(AnneFraHvidbjerghus)

Instance: ConditionCareingForOwnHealthPerformerNoteFFB
InstanceOf: KLCommonCareSocialCondition
Description: "Example of the citizen, Andreas, where a performer makes a note regarding his ability to take care of his own health, when the condition is not previously known"
Usage: #example
* subject = Reference(Andreas)
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* verificationStatus.coding.code = #unconfirmed
* verificationStatus.coding.system = VerSTATUS
* code.coding = FFB#4a58417e-9a75-43f2-9763-66505050159f	"Varetage egen sundhed"
* recordedDate = 2020-12-12
* note.text = "Andreas spiser mere og mere usundt, og ser ud til at have haft en betydelig vægtstigning efter at være begyndt i botilbuddet."
* note.authorReference = Reference(AnneFraHvidbjerghus)
* asserter = Reference(AnneFraHvidbjerghus)
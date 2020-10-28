Profile:        KLCommonCrossSectorCondition
Parent:         Condition
Title:          "CommonCrossSectorCondition"
Description:    "Conditions which may be used for cross sector exchange in Denmark, as expressed by Danish municipalities."

//Slicing code, declaring disciminator, and slicing type
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false   // can be omitted, since false is the default
* code.coding ^slicing.description = "Slice based on the code.system value which allow both a FSIII/FFB condition code and a SNOMED CT code to represent a condition"  // optional - does not appear
//Declaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code
* code.coding contains
   FSIIIConditionCode 0..1 and SCTConditionCode 0..1 and FFBCodesCT 0..1 and ICD10codes 0..1 and ICPC2codes 0..1

//Declaring the value set binding for the KLConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work
* code.coding[FSIIIConditionCode] from KLConditionCodesFSIII (required)
* code.coding[FSIIIConditionCode].system = FSIII

//Declaring the value set binding for the SCTConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work (See Aliases for value set, and system info)
* code.coding[SCTConditionCode] from SCTConditionValueset (required)
* code.coding[SCTConditionCode].system = SCT

* code.coding[FFBCodesCT] from KLConditionsAndTargetGroupsFFB (required)
* code.coding[FFBCodesCT].system = FFB

* code.coding[ICD10codes] from KLICD10SKS (required)
* code.coding[ICD10codes].system = SKS-D

* code.coding[ICPC2codes] from KLICPC2 (required)
* code.coding[ICPC2codes].system = ICPC2DK

//Specifying datatype of abatement, subject, asserter and evidence
* subject only Reference(Patient)
* asserter only Reference(Practitioner)

//Specifying note (fagligt notat)
* note.author[x] only Reference
* note.authorReference only Reference(Practitioner)

Instance: AndreasMaalgruppeUdviklingshamning
InstanceOf: KLCommonCrossSectorCondition
Title: "AndreasMålgruppeUdviklingshæmning"
* code.coding[FFBCodesCT] = FFB#97c355cc-84e3-46d0-ac1b-00bc627d089f "Udviklingshæmning"
* subject = Reference(Andreas) 

Instance: AndreasDiabetes
InstanceOf: KLCommonCrossSectorCondition
Title: "AndreasDiabetes"
* code.coding[ICD10codes] = SKS-D#DE11 "Type 2-diabetes"
* subject = Reference(Andreas) 
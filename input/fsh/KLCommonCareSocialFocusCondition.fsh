Profile:        KLCommonCareSocialFocusCondition
Parent:         Condition
Title:          "FocusCondition"
Description:    "Conditions which may be used to express the focus of an intervention or the problem of a citizen in Danish municipalities. Mostly used for cross sector use cases."

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
* code.coding[FSIIIConditionCode].system = $FSIII

//Declaring the value set binding for the SCTConditionCode slice, and setting the system.
//System is fixed to allow the slicing to work (See Aliases for value set, and system info)
* code.coding[SCTConditionCode] from SCTConditionValueset (required)
* code.coding[SCTConditionCode].system = SCT

* code.coding[FFBCodesCT] from KLConditionsAndTargetGroupsFFB (required)
* code.coding[FFBCodesCT].system = $FFB

* code.coding[ICD10codes].system = "urn:oid:1.2.208.176.2.4.12"

* code.coding[ICPC2codes].system = ICPC2DK

//Specifying datatype of abatement, subject, asserter and evidence
* subject only Reference(Patient)
* asserter only Reference(Practitioner)

//Specifying note (fagligt notat)
* note.author[x] only Reference
* note.authorReference only Reference(Practitioner)

* code.coding ^short = "[DK] tværorganisatoriskTilstandskode"
* code.text ^short = "[DK] tværorganisatoriskTilstandsvurdering"
* subject ^short = "[DK] tværorganisatoriskTilstandsubjekt"
* asserter ^short = "[DK] tværorganisatoriskTilstandAnsvarlig"
* recorder ^short = "[DK] tværorganisatoriskTilstandDokumentationsansvarlig"
* verificationStatus ^short = "[DK] tværorganisatoriskTilstandstatus"
* clinicalStatus ^short = "[DK] tværorganisatoriskTilstandstatus"
* onset[x] ^short = "[DK] tværorganisatoriskTilstandstart"
* abatement[x] ^short = "[DK] tværorganisatoriskTilstandsafslutningstid"
* recordedDate ^short = "[DK] tværorganisatoriskTilstandregistreringstid"
* note ^short = "[DK] tværorganisatoriskTilstandFagligtNotat"

Instance: AndreasMaalgruppeUdviklingshamning
InstanceOf: KLCommonCareSocialFocusCondition
Title: "Andreas målgruppe udviklingshæmning"
Description: "Andreas' målgruppe"
Usage: #example
* code.coding[FFBCodesCT] = $FFB#97c355cc-84e3-46d0-ac1b-00bc627d089f "Udviklingshæmning"
* subject = Reference(Andreas)
* asserter = Reference(MarianneLaege)
* recorder = Reference(BirteFraVisitationenMorsoe)
* recordedDate = 2020-07-06
* onsetAge.value = 1
* onsetAge.code = #a
* onsetAge.system = UCUM
* onsetAge.unit = "år"
* clinicalStatus = CONCLIN#active
* verificationStatus = VerSTATUS#confirmed

Instance: JudithDiabetes
InstanceOf: KLCommonCareSocialFocusCondition
Title: "Judith diabetes"
Description: "En diagnose som registreret i kommunen, hvor Hanne fra Aalborg har registreret informationen fra lægen Marianne, som fx kunne komme fra diabetescenteret på hospitalet"
Usage: #example
* code.coding[ICD10codes].system = "urn:oid:1.2.208.176.2.4.12"
* code.coding[ICD10codes].code = #DE11
* code.coding[ICD10codes].display = "Type 2-diabetes (kan ikke valideres fordi der ikke er adgang til koderne)"
* subject = Reference(Judith)
* asserter = Reference(MarianneLaege)
* recorder = Reference(HanneFraVisitationenAalborg)
* onsetDateTime = 2017-04-01
* recordedDate = 2020-03-15
* clinicalStatus = CONCLIN#active
* verificationStatus = VerSTATUS#confirmed

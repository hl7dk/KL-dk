//Denne test kræver patienten BorgerEjnar, Practitioner/7777777/NatasjaFraSygeplejen,  opfølgningskontakten Encounter/333 (dato: 2021-02-10)
//, og dueTo (Condition/444 - sorg over konens død), opfølgningsresultatet (Observation/22), oplysning (Observation/1234)

//tilstand v1
Instance: BorgerEjnar
InstanceOf: KLCommonCitizen
Usage: #example
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201609995"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Ejnar"
* name.given[1] = "Test"
* gender = #male
* birthDate = "1960-01-02"


Instance: Condition111
InstanceOf: KLCommonCareSocialCondition
Usage: #example
//statusattributter
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* category.coding.code = #problem-list-item
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.system = VerSTATUS

//kodning
* code.coding[0] = FSIII#I6.3
* code.coding[0].display = "Problemer med misbrug"
* code.coding[1] = SCT#160590009
* code.coding[1].display = "Drinks beer and hard liquor (finding)"
* code.text = "Der er problemer med misbrug, særlig drikker borger øl og spiritus om aftenen"

//personer
* subject = Reference(BorgerEjnar)
* asserter = Reference(NatasjaFraSygeplejen)

//Datorer
* recordedDate = 2020-03-17T10:09:27+01:00
* extension[conditionLastAssertedDate].valueDateTime = 2020-03-17T10:09:27+01:00

//Opfølgningskontakt
* extension[followUpEncounter].valueReference = Reference(Encounter333)

//årsag
* extension[dueTo].valueReference = Reference(Condition444)

//område, som tilstanden er udredt ifm.
* evidence.detail[0] = Reference(Observation1234)

Instance: ProvenanceCondition111
InstanceOf: Provenance
Usage: #example
* target = Reference(Condition111)
* recorded = 2020-03-17T10:09:27+01:00
* agent[0].type = AGENTTYPE#legal
* agent[0].who = Reference(NatasjaFraSygeplejen)
* reason.coding.system =  "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* reason.coding.code = #TREAT

//tilstand v2
Instance: Condition111v2
InstanceOf: KLCommonCareSocialCondition
Usage: #example
//statusattributter
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* category.coding.code = #problem-list-item
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.system = VerSTATUS

//kodning
* code.coding[0] = FSIII#I6.3
* code.coding[0].display = "Problemer med misbrug"
* code.coding[1] = SCT#160590009
* code.coding[1].display = "Drinks beer and hard liquor (finding)"
* code.text = "Der er problemer med misbrug, særlig drikker borger øl og spiritus"

//personer
* subject = Reference(BorgerEjnar)
* asserter = Reference(NatasjaFraSygeplejen)
//* asserter = Reference(Bi)

//Datorer
* recordedDate = 2020-03-17T10:09:27+01:00
* extension[conditionLastAssertedDate].valueDateTime = 2020-12-17T10:09:27+01:00
//* abatementDateTime = 2021-03-10T10:09:27+01:00

//Faglige notater og FFB observationer
* note.text = "Drikker mindre, der har været et overforbrug, men der er tilsyneladende ikke tale om afhængighed"
* note.authorReference = Reference(NatasjaFraSygeplejen)
* note.time = 2020-12-17T10:09:27+01:00

//Opfølgningskontakt
* extension[followUpEncounter].valueReference = Reference(Encounter333)

//årsag
* extension[dueTo].valueReference = Reference(Condition444)

//område, som tilstanden er udredt ifm.
* evidence.detail[0] = Reference(Observation1234)

//EventHistory
* extension[eventHistory].valueReference = Reference(ProvenanceCondition111)

Instance: ProvenanceCondition111v2
InstanceOf: Provenance
Usage: #example
* target = Reference(Condition111v2)
* recorded = 2020-12-17T10:09:27+01:00
* agent[0].type = AGENTTYPE#legal
* agent[0].who = Reference(NatasjaFraSygeplejen)
* reason.coding.system =  "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* reason.coding.code = #TREAT

Instance: Condition111v3
InstanceOf: KLCommonCareSocialCondition
Usage: #example
//statusattributter
* clinicalStatus.coding.code = #inactive
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
//* category.coding.code = #problem-list-item
//* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.system = VerSTATUS

//kodning
* code.coding[0] = FSIII#I6.3
* code.coding[0].display = "Problemer med misbrug"
* code.coding[1] = SCT#160590009
* code.coding[1].display = "Drinks beer and hard liquor (finding)"
* code.text = "Der er problemer med misbrug, særligt drikker borger øl og spiritus"

//personer
* subject = Reference(BorgerEjnar)
* asserter = Reference(NatasjaFraSygeplejen)

//Datorer
* recordedDate = 2020-03-17T10:09:27+01:00
* extension[conditionLastAssertedDate].valueDateTime = 2021-02-10T10:09:27+01:00
* abatementDateTime = 2021-02-10T10:09:27+01:00

//årsag
* extension[dueTo].valueReference = Reference(Condition444)

//område, som tilstanden er udredt ifm.
* evidence.detail[0] = Reference(Observation1234)

//opfølgningsresultat
* evidence.detail[1] = Reference(Observation22) 

* extension[eventHistory][0].valueReference = Reference(ProvenanceCondition111)
* extension[eventHistory][1].valueReference = Reference(ProvenanceCondition111v2)
//* extension[eventHistory].valueReference = Reference(ProvenanceCondition111)

Instance: ProvenanceCondition111v3
InstanceOf: Provenance
Usage: #example
* target = Reference(Condition111v3)
* recorded = 2021-02-10T10:09:27+01:00
* agent[0].type = AGENTTYPE#legal
* agent[0].who = Reference(NatasjaFraSygeplejen)
* reason.coding.system =  "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* reason.coding.code = #TREAT


Instance: Condition444
InstanceOf: KLCommonCareSocialFocusCondition
Usage: #example
* code.text = "Er i sorg pga. ægtefællens død"
* subject = Reference(BorgerEjnar)
* asserter = Reference(NatasjaFraSygeplejen)
* recorder = Reference(NatasjaFraSygeplejen)
* recordedDate = 2020-03-17T10:09:27+01:00
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.system = VerSTATUS

Instance: Encounter333
InstanceOf: KLCommonCareSocialEncounter
Usage: #example
* type = KLCommonCareSocialCodes#9f03dfbb-7a97-45a5-94db-d4c3501714a9 "opfølgning"
* period.start = 2021-02-10
* status = EncounterStatus#planned
* subject = Reference(BorgerEjnar)
* class = V3ACTCODES#HH

//opfølgningskontakt version 2
Instance: Encounter333v2
InstanceOf: KLCommonCareSocialEncounter
Usage: #example
* type = KLCommonCareSocialCodes#9f03dfbb-7a97-45a5-94db-d4c3501714a9 "opfølgning"
* period.start = 2021-02-10
* status = EncounterStatus#finished
* subject = Reference(BorgerEjnar)
* class = V3ACTCODES#HH

//opfølgningsresultat
Instance: Observation22
InstanceOf: KLCommonCareSocialFollowUp
Usage: #example
* subject = Reference(BorgerEjnar)
* code = SCT#712744002
* valueCodeableConcept.text = "Borger har fået hjælp til håndtering af sin sorg, og drikker ikke for meget længere"
* valueCodeableConcept = FSIII#E3 "Afsluttes"
* effectiveDateTime = 2021-02-10
* performer = Reference(NatasjaFraSygeplejen)
* status = #final

Instance: Observation1234
InstanceOf: KLCommonCareSocialMatterOfInterest
Usage: #example
* subject = Reference(BorgerEjnar)
* code.coding.code = #I6
* code.coding.system = FSIII
* code.coding.display = "Psykosociale forhold"
* effectiveDateTime = 2020-03-17
* valueCodeableConcept.text = "Borger drikker for meget, sandsynligvis pga. sorg over ægtefællens død, men der skal selvf"
* performer = Reference(NatasjaFraSygeplejen)
* status = #final
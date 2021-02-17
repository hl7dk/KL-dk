### Background
This is the FKI FHIR implementation guide. FKI stands for "Fælleskommunal InformationsModel" in english "Common Municipality Information Model". The FKI FHIR profiles can be used to exchange and report health care and social care data from Danish municipalities. 

The health and care related data is a result of rutine documentation in home care nursing, home care, health promotion and prevention and physical rehabilitation. The documentation practise follows [FSIII](http://fs3.nu/).

Social care data results from rutine documentation in the area of adult social care. The documentation practise follows [VUM](https://socialstyrelsen.dk/udgivelser/metodehandbog-til-vum-2.0/) and [FFB](https://www.kl.dk/kommunale-opgaver/socialomraadet/faelles-faglige-begreber/materialer/)  

### FKI is a core model
FKI is a core model, which means that it is the recommended way to encapsulate the above menitioned data, but it does no in itself specify use cases. FKI has so far been used for two use cases:
* Reporting of municipality data to KLGateway, which is e.g. used for management information and national statistics. [Implementation guide KLGateway](http://build.fhir.org/ig/hl7dk/kl-gateway/)
* Structuring documentation tools, meassurements and observations commonly used in Danish municipalities. [Implementation guide for FFinst](http://build.fhir.org/ig/hl7dk/KL-dk-tools/branches/main/)

### Documentation in Danish
The documentation of the FHIR profiles is also available in a Danish edition for non-FHIR users. This edition is called [FKI Lægmandsforklaringen](./LaegmandsforklaringAlleModellerV0.1.pdf)

The HL7 FHIR-profiles are based on information modelling work done according to a common municipality architectural framework (Fælleskommunal rammearkitektur). The link is comming as soon as possible.

### Getting started
To get a comprehesion of the content included in FKI, and the way it may be combined to form meaningfull collections of information, starter-examples have been created.  

* Home care service requests and information gathering (Sagsåbning og sagsoplysning) in the home care area have been illustrated using the Judith-example.
* The difference between regular and acute home nursing including planning and carrying out interventions, and the use of the Encounter-profile have been illustrated in the Mark-example
* Adult social care information gathering and intervention planning is illustrated using the Andreas-example.
* Adult social care information gathering is also illustrated in the Mads-example. Here the focus is on illustrating how to make the finding informer explicite as required by FFB.

#### Judith example
[Judith](Patient-Judith.html) is a citizen, with and existing [diagnosis of type-2 diabetes](Condition-JudithDiabetes.html), who has problems with mobility. In her record, we can see that a home care evaluation (funktionsevnevurdering hjemmepleje) has been carried out at some point, and a [note](Observation-MobilityInformationJudith.html) has been written under the heading "Mobilitet". While examining Judiths mobility, it is ascertained that she has the [condition "Gå"](Condition-ConditionWalking.html). Judith also [rates her own ability to walk](Observation-JudithGaa.html) (Betydning - oplever begrænsninger), and [a goal](Goal-JudithForventetTilstand.json.html) i.e. an expected future condition (forventet tilstand) is formulated for Judith. 

#### Mark example
[Mark](Patient-Mark.html) is a citizen recieving home nursing interventions. I his record we can see his [nursing status](ClinicalImpression-NursingStatusMark.html) (sygeplejefaglig udredning). Note that this is an example, not a full nursing status. The nursing status contains notes under two areas [respiration and circulation](Observation-RespirationCirculationInformationMark.html) and [skin and mucosa](Observation-SkinInformationMark.html). In addition, the nurse register the [condition: pressure ulcer](Condition-ConditionPressureUlcer.html) because Mark has a pressure ulcer on his left leg. A [goal/expected future condition](Goal-MarkForventetTilstand.html) is formulated for the pressure ulcer. In addition, a follow-up date is specified for the pressure ulcer condition, by formulating a future [encounter](Encounter-MarkFollowUpPlanned.html).

After the nursing status is completed, the home care nurse updates the [overall evaluation](Observation-MarkHelhedsvurdering.html) of Mark (Helhedsvurdering). From this evaluation we can read, that at the time where the nursing status is done, Mark acually have preexisting problems with mobility that means that he recieves help with cleaning (conditions and interventions relating to this is not included as explicite examples).. The nurse writes a new overall evaluation pointing out the mobility problem as well as the pressure ulcer and a potential problem with circulation. The nursing status and overall evaluation have been caried out, in an [encounter](Encounter-MarkogUdredningSygepleje.html).

After the nursing status, Mark's [pressure ulcer care intervention](CarePlan-PressureUlcerIntervention.html) is planned, and we can see that it is progressing because [an encounter](Encounter-MarkogSaarsygeplejerske.html), where ulcer care is carried out, is added. In addition, we can see that an [observation method](Goal-MarkIndsatsmaal.html) (målemetode) is added to the intervention, where it is stated that the pressure ulcer should be monitored by meassuring the surface area regularily.

At some point, the municipality recieves a referal by message or phone from a general practitioner, stating that Mark is feeling sick, and needs his vitals taken as soon as possible. The municipality records [the referal](ServiceRequest-HenvisningFraLageVedrAkutSygepleje.html). [Extra information](Provenance-HenvisningFraLageVedrAkutSygeplejeProvenance.html) might be nessesary to accurately state that the general practioner is responsible, but the municipality staff have done the recording.  

Now, an acute care nurse is send to Mark's residence i.e. [an encounter](Encounter-MarkOgAkutsygeplejerske) occurs in the record. At this encounter, different meassurments are taken:[Diastolic blood pressure](Observation-MarksDiastoliske.html), [heart rate](Observation-MarksPuls.html) and [blood glycose](Observation-MarksBlodsukker.html). After the encounter, the nurse records the [intervention that has been carried out](Procedure-AkutSygeplejeMark.html).

#### Andreas example
[Andreas](Patient-Andreas.html) has a developmental disability, and has lives with his mother. His mother [requests](ServiceRequest-HenvendelseFraMorVedrSocialIndsats.html) help from the municipality, becauce she is getting older and can no longer provide the needed help for Andreas.

A full examination of FFB Themes and subthemes is not provided in this example, but we can see that Andreas' [goals and wishes](Goal-AndreasMaalOnsker.html) are recorded. In addition, the [condition/subtheme: cleaning](Condition-ConditionCleaning.html) has been recorded for Andreas.

We can see that Andreas recieves a [social intervention](CarePlan-FFBIndsats.json.html) (social indsats), which also holds a reference to an [assessment of dergree of assistance required](Observation-AndreasStottebehov.html) (støttebehovsvurdering). As specified by FFB, the social intervention consist of target group, specific interventions and performer-type (målgruppe, ydelser og tilbud). The [target group is developmental disability](Condition-AndreasMaalgruppeUdviklingshamning.html), the specific intervetions are related to [daily tasks](CarePlan-AndreasDagligeOpgaver.html), and [support in establishing social relations](CarePlan-AndreasSocialeRelationer.html). The performer-type is [temporary stay](CareTeam-MidlertidigtOpholdBotilbuddetHvidbjerghus.html). The performer-type is documented together with the actual performer in this example, but it may be documented generally, using only the category-attribute.

Note that the [social intervention](CarePlan-FFBIndsats.json.html) also contain the purposes and goals as formulated by FFB: An [overall goal](Goal-AndreasIndsatsformaal.html) (indsatsformål), [Intervention goal](Goal-Andreasindsatsmaal.html) related to Andreas' condition (indsatsmål) and [sub-goal](Goal-AndreasDelmaal.html) (delmål).

While recieving the social intervention i.e. the temporary stay at 'Hvidbjerghus', the staff record different notes about Andreas, one is relating to the known condition: cleaning - and [the note](Condition-ConditionCleaningWithNote.html) is recorded as an update to the existing condition. The staff also notes that Andreas has [problems with his health related behaviour](Condition-ConditionCareingForOwnHealthPerformerNoteFFB.html) (varetage egen sundhed), this is recorded as a note to an unconfirmed condition, because the condition is not documented in the record before-hand.

In the end of Andreas temporary stay, a follow-up on Andreas social intervention is performed, and the [structured result](Observation-AndreasRevisitation.json.html) is documented. The follow-up result, and a new evaluation (not in the example) comes to the conclusion that Andreas should have a new permanent houseing in a care facility - this is documented in a new [social intervention](CarePlan-NySocialIndsats.html).

#### Mads example
[Mads](Patient-Mads.html) is a citizen with a few recorded FFB Themes. The the difference between having a [citizen perspective on an FFB Theme](Observation-MentalInformationMads.html) or having [information from others](Observation-MentalInformationMadsOthers.html) is illustrated in this short example.

### Overview
Comming

### Versioning and change management

#### This implementation guide
This implementation guide is regularily updated, and stable versions published on simplifier.net via MedCom. Note that FSIII and FFB Code systems are included as copies in the implementation guide. This reults in a very simplistic versioning mechanism i.e. any time changes occur in either the model or municipality terminologies, a new version will be made available. The package number has three levels.
* First level updates are made when new areas of documentation are added to the model, which requires new community reviews of the model
* Second level updates are any updates that adds or removes content from either model or terminology.
* Third level updates are updates that only relates to naming and communication, which means that the FHIR validator will not have errors running on another minor version, than the current (except for som warnings if coding.displays' are changed)

#### Instance level
When implementing use cases exploiting the profiles in this implementation guide, there may be a need to keep track of temporal development in data. Without knowing the specific use cases and implementation paradigm, unambigious guidance about change management cannot be given. However, general guideance is available [here](./changeManagementFSIII_FFB.pdf) in Danish.



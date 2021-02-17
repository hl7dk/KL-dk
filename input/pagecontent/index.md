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

After the nursing status is completed, the home care nurse updates the [overall evaluation](Observation-MarkHelhedsvurdering.html) of Mark (Helhedsvurdering). From this evaluation we can read, that at the time where the nursing status is done, Mark acually have preexisting problems with mobility that means that he recieves help with cleaning (conditions and intervantions relating to this is not included as explicite examples).. The nurse writes a new overall evaluation pointing out the mobility problem as well as the pressure ulcer and a potential problem with circulation. The nursing status and overall evaluation have been caried out, in an [encounter](Encounter-MarkogUdredningSygepleje.html).

After the nursing status, Mark's [pressure ulcer care intervention](CarePlan-PressureUlcerIntervention.html) is planned, and we can see that it is progressing because [an encounter](Encounter-MarkogSaarsygeplejerske.html), where ulcer care is carried out, is added. In addition, we can see that an [observation method](Goal-MarkIndsatsmaal.html) (målemetode) is added to the intervention, where it is stated that the pressure ulcer should be monitored by meassuring the surface area regularily.

At some point, the municipality recieves a referal by message or phone from a general practitioner, stating that Mark is feeling sick, and needs his vitals taken as soon as possible. The municipality records [the referal](ServiceRequest-HenvisningFraLageVedrAkutSygepleje.html). [Extra information](Provenance-HenvisningFraLageVedrAkutSygeplejeProvenance.html) might be nessesary to accurately state that the general practioner is responsible, but the municipality staff have done the recording.  

Now, an acute care nurse is send to Mark's residence i.e. [an encounter](Encounter-MarkOgAkutsygeplejerske) occurs in the record. At this encounter, different meassurments are taken:[Diastoloc blood pressure](Observation-MarksDiastoliske.html), [heart rate](Observation-MarksPuls.html) and [blood glycose](Observation-MarksBlodsukker.html). After the encounter, the nurse records the [intervention that has been carried out](Procedure-AkutSygeplejeMark.html).

### Andreas example


### Overview

### Versioning and change management

#### This implementation guide
This implementation guide is regularily updated, and stable versions published on simplifier.net via MedCom. Note that FSIII and FFB Code systems are included as copies in the implementation guide. This reults in a very simplistic versioning mechanism i.e. any time changes occur in either the model or municipality terminologies, a new version will be made available. The package number has three levels.
* First level updates are made when new areas of documentation are added to the model, which requires new community reviews of the model
* Second level updates are any updates that adds or removes content from either model or terminology.
* Third level updates are updates that only relates to naming and communication, which means that the FHIR validator will not have errors running on another minor version, than the current (except for som warnings if coding.displays' are changed)

#### Instance level
When implementing use cases exploiting the profiles in this implementation guide, there may be a need to keep track of temporal development in data. Without knowing the specific use cases and implementation paradigm, unambigious guidance about change management cannot be given. However, general guideance is available [here](./changeManagementFSIII_FFB.pdf) in Danish.



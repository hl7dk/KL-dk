### Background
This is the FKI FHIR implementation guide. FKI stands for "Fælleskommunal InformationsModel" in English "Common Municipality Information Model". The FKI FHIR profiles can be used to exchange and report health care and social care data from Danish municipalities. 

The health and care related data is a result of routine documentation in home care nursing, home care, health promotion and prevention and physical rehabilitation. The documentation practice follows [FSIII](http://fs3.nu/).

Social care data results from routine documentation in adult social care. The documentation practice follows [VUM](https://socialstyrelsen.dk/udgivelser/metodehandbog-til-vum-2.0/) and [FFB](https://www.kl.dk/kommunale-opgaver/socialomraadet/faelles-faglige-begreber/materialer/)  

### FKI is a core model
FKI is a core model, which means that it is the recommended way to encapsulate the above-mentioned data, but it does not in itself specify use cases. FKI has so far been used for two use cases:
* Reporting of municipality data to KLGateway, which is e.g., used for management information and national statistics. [Implementation guide KLGateway](http://build.fhir.org/ig/hl7dk/kl-gateway/)
* Structuring documentation tools, meassurements and observations commonly used in Danish municipalities. [Implementation guide for FFinst](http://build.fhir.org/ig/hl7dk/KL-dk-tools/branches/main/)

### Documentation in Danish
The documentation of the FHIR profiles is also available in a Danish edition for non-FHIR users. This edition is called [FKI Lægmandsforklaringen](./LaegmandsforklaringAlleModellerV0.1.pdf)

The HL7 FHIR-profiles are based on information modelling work done according to a common municipality architectural framework (Fælleskommunal rammearkitektur). The link is coming as soon as possible.

### Getting started
To get a comprehension of the content included in FKI, and the way it may be combined to form meaningful collections of information, starter-examples have been created.  

* Home care service requests and information gathering (Sagsåbning og sagsoplysning) in the home care area have been illustrated using the Judith-example.
* The difference between regular and acute home nursing including planning and carrying out interventions, and the use of the Encounter-profile have been illustrated in the Mark-example
* Adult social care information gathering, and intervention planning is illustrated using the Andreas-example.
* Adult social care information gathering is also illustrated in the Mads-example. Here the focus is on illustrating how to make the finding informer explicit as required by FFB.

#### Judith example
[Judith](Patient-Judith.html) is a citizen, with and existing [diagnosis of type-2 diabetes](Condition-JudithDiabetes.html), who has problems with mobility. In her record, we can see that a home care evaluation (funktionsevnevurdering hjemmepleje) has been carried out at some point, and a [note](Observation-MobilityInformationJudith.html) has been written under the heading "Mobilitet". While examining Judiths mobility, it is ascertained that she has the [condition "Gå"](Condition-ConditionWalking.html). Judith also [rates her own ability to walk](Observation-JudithGaa.html) (Betydning - oplever begrænsninger), and [a goal](Goal-JudithForventetTilstand.json.html) i.e. an expected future condition (forventet tilstand) is formulated for Judith. 

#### Mark example
[Mark](Patient-Mark.html) is a citizen receiving home nursing interventions. I his record we can see his [nursing status](ClinicalImpression-NursingStatusMark.html) (sygeplejefaglig udredning). Note that this is an example, not a full nursing status. The nursing status contains notes under two areas [respiration and circulation](Observation-RespirationCirculationInformationMark.html) and [skin and mucosa](Observation-SkinInformationMark.html). In addition, the nurse register the [condition: pressure ulcer](Condition-ConditionPressureUlcer.html) because Mark has a pressure ulcer on his left leg. A [goal/expected future condition](Goal-MarkForventetTilstand.html) is formulated for the pressure ulcer. In addition, a follow-up date is specified for the pressure ulcer condition, by formulating a future [encounter](Encounter-MarkFollowUpPlanned.html).

After the nursing status is completed, the home care nurse updates the [overall evaluation](Observation-MarkHelhedsvurdering.html) of Mark (Helhedsvurdering). From this evaluation we can read, that at the time where the nursing status is done, Mark actually have preexisting problems with mobility that means that he receives help with cleaning (conditions and interventions relating to this is not included as explicit examples). The nurse writes a new overall evaluation pointing out the mobility problem as well as the pressure ulcer and a potential problem with circulation. The nursing status and overall evaluation have been caried out, in an [encounter](Encounter-MarkogUdredningSygepleje.html).

After the nursing status, Mark's [pressure ulcer care intervention](CarePlan-PressureUlcerIntervention.html) is planned, and we can see that it is progressing because [an encounter](Encounter-MarkogSaarsygeplejerske.html), where ulcer care is carried out, is added. In addition, we can see that an [observation method](Goal-MarkIndsatsmaal.html) (målemetode) is added to the intervention, where it is stated that the pressure ulcer should be monitored by measuring the surface area regularly.

At some point, the municipality receives a referral by message or phone from a general practitioner, stating that Mark is feeling sick, and needs his vitals taken as soon as possible. The municipality records [the referal](ServiceRequest-HenvisningFraLageVedrAkutSygepleje.html). [Extra information](Provenance-HenvisningFraLageVedrAkutSygeplejeProvenance.html) might be necessary to accurately state that the general practitioner is responsible, but the municipality staff have done the recording.  

Now, an acute care nurse is send to Mark's residence i.e. [an encounter](Encounter-MarkOgAkutsygeplejerske) occurs in the record. At this encounter, different measurements are taken:[Diastolic blood pressure](Observation-MarksDiastoliske.html), [heart rate](Observation-MarksPuls.html) and [blood glycose](Observation-MarksBlodsukker.html). After the encounter, the nurse records the [intervention that has been carried out](Procedure-AkutSygeplejeMark.html).

#### Andreas example
[Andreas](Patient-Andreas.html) has a developmental disability and has lives with his mother. His mother [requests](ServiceRequest-HenvendelseFraMorVedrSocialIndsats.html) help from the municipality, because she is getting older and can no longer provide the needed help for Andreas.

A full examination of FFB Themes and subthemes is not provided in this example, but we can see that Andreas' [goals and wishes](Goal-AndreasMaalOnsker.html) are recorded. In addition, the [condition/subtheme: cleaning](Condition-ConditionCleaning.html) has been recorded for Andreas.

We can see that Andreas receives a [social intervention](CarePlan-FFBIndsats.json.html) (social indsats), which also holds a reference to an [assessment of degree of assistance required](Observation-AndreasStottebehov.html) (støttebehovsvurdering). As specified by FFB, the social intervention consist of target group, specific interventions and performer-type (målgruppe, ydelser og tilbud). The [target group is developmental disability](Condition-AndreasMaalgruppeUdviklingshamning.html), the specific interventions are related to [daily tasks](CarePlan-AndreasDagligeOpgaver.html), and [support in establishing social relations](CarePlan-AndreasSocialeRelationer.html). The performer-type is [temporary stay](CareTeam-MidlertidigtOpholdBotilbuddetHvidbjerghus.html). The performer-type is documented together with the actual performer in this example, but it may be documented generally, using only the category-attribute.

Note that the [social intervention](CarePlan-FFBIndsats.json.html) also contain the purposes and goals as formulated by FFB: An [overall goal](Goal-AndreasIndsatsformaal.html) (indsatsformål), [Intervention goal](Goal-Andreasindsatsmaal.html) related to Andreas' condition (indsatsmål) and [sub-goal](Goal-AndreasDelmaal.html) (delmål).

While receiving the social intervention i.e. the temporary stay at 'Hvidbjerghus', the staff record different notes about Andreas, one is relating to the known condition: cleaning - and [the note](Condition-ConditionCleaningWithNote.html) is recorded as an update to the existing condition. The staff also notes that Andreas has [problems with his health related behaviour](Condition-ConditionCareingForOwnHealthPerformerNoteFFB.html) (varetage egen sundhed), this is recorded as a note to an unconfirmed condition, because the condition is not documented in the record before-hand.

In the end of Andreas temporary stay, a follow-up on Andreas social intervention is performed, and the [structured result](Observation-AndreasRevisitation.json.html) is documented. The follow-up result, and a new evaluation (not in the example) comes to the conclusion that Andreas should have a new permanent housing in a care facility - this is documented in a new [social intervention](CarePlan-NySocialIndsats.html).

#### Mads example
[Mads](Patient-Mads.html) is a citizen with a few recorded FFB Themes. The difference between having a [citizen perspective on an FFB Theme](Observation-MentalInformationMads.html) or having [information from others](Observation-MentalInformationMadsOthers.html) is illustrated in this short example.

### Overview
In the image below, on overview of FKI is provided. The illustration does not include any attributes, and only the most important relationships.

<img alt="OverviewModel" src="./FHIROverview.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

#### Occasion to act 
The occasion to act in the municipality health and social care system, is a request for help from a citizen or next-of-kin, a referral from a health provider or an internal or between municipality request. In FKI, the municipality registration of a received request or referral can be documented using [ServiceRequest](StructureDefinition-KLCommonCareSocialServiceRequest.html). The reason for a request, may be a diagnosis or condition already known by another health provider, which can be documented using [FocusCondition](StructureDefinition-KLCommonCareSocialFocusCondition.html). The reason could also be that a follow-up result has shown the need to re-do the visitation of the citizen, which is documented using [FollowUp](StructureDefinition-KLCommonCareSocialFollowUp.html).

An 'occasion to act' is most typically a reason to start activity planning. However, in some acute cases, it may be needed to start execution of intervention based on the service request alone. This is often the case for acute home nursing, requested by general practitioners.

#### Activity planning
The activity planning is the planning of information gathering processes, assessments, and interventions. According to FSIII and FFB, some information gatherings and assessments are planned before execution, others are not. E.g. 'nursing status' is an intervention code in FSIII, whereas no such thing exists in FFB.
Interventions (indsatser og ydelser) and goals are planned and authorized at this stage. A [CarePlan](StructureDefinition-KLCommonCareSocialCarePlan.html) is used for broader defined plans that may include several [PlannedInterventions](StructureDefinition-KLCommonCareSocialPlannedInterventions.html). Social intervention (FFB sociale indsatser) is an example of care defined this way in Denmark.
Other parts of the care are simply defined as single interventions, where each intervention has a single focus e.g., 'Cleaning' or 'Ulcer management'. These are defined as instances of [PlannedIntervention](StructureDefinition-KLCommonCareSocialPlannedInterventions.html). Home nursing and home care are examples of care defined this way in Denmark. When planning activities, [Goals](StructureDefinition-KLCommonCareSocialGoal.html) are also defined. Be aware that very different types of goals exist in the Danish municipality realm, and that different constraints apply to them, so refer to the FSIII and FFB methods. The different types are explicitly stated in the [GoalType ValueSet](ValueSet-KLGoalTypeCodes.html). Note that an expected condition (forventet tilstand) is expressed a goal, not as part of a Condition.
Despite the simple view in the figure, encounters may be planned, rather than only being part of the execution process. Planned and executed encounters are distinguished using the Encounter.status attribute. This is especially true for planned follow-up, which is expressed using planned encounters.

#### Execution
The execution package contains all documentation related to activities, which have actually occurred.  [Encounters](StructureDefinition-KLCommonCareSocialEncounter.html) contain information about when citizens and practitioners meet. Encounters are used for administrative/planning purposes, rather than for carrying clinical/care content. They state time, place, and type of contact. An encounter may be spend carrying out precisely what was planned. In this case, the [PlannedIntervention] (StructureDefinition-KLCommonCareSocialPlannedInterventions.html), might simply refer to the encounter. However, if anything differs from the planned, or if an acute situation arises, the intervention actually carried out, within the boundaries of a single Encounter, may be documented using [CompletedIntervention](StructureDefinition-KLCommonCareSocialCompletedInterventions.html).
The [InformationGathering](StructureDefinition-KLCommonCareSocialInformationGathering.html) is used to document information gathering processes e.g., the execution of a nursing status, the documentation of a therapeutic examinations etc. However, information gathering only holds references. All the information-content is documented using the Observations and conditions package.

#### Observations and conditions
Information gathering and follow-up encounters results in updated information about the citizen status. In addition, the interventions are performed to improve or at prevent worsening of the citizen's status. The observations and conditions package makes it possible to express the status of a citizen. The status may be expressed using a variety of observations and conditions and required by FSIII and FFB.
Information gathering processes, follow different patterns depending on the professional focus - e.g., a nursing status have 12 themes or questions associated with it. Each of the themes/questions needed to perform information collection according to FFB and FSIII, should be expresses using [MatterOfInterest](StructureDefinition-KLCommonCareSocialMatterOfInterest.html). If information gathering or follow-ups result in the identification of conditions, which should be considered for interventions, [Conditions](StructureDefinition-KLCommonCareSocialMatterOfInterest.html) are instantiated. For home care, when a condition is identified, the citizen should rate their own execution-level, this may be done using [CitizenOwnObservation](StructureDefinition-KLCommonCareSocialCitizensOwnObservation.html). After an information gathering process, FFB and FSIII require, that an evaluation of the overall status of the citizen is performed. The result is documented using [Evaluation](StructureDefinition-KLCommonCareSocialEvaluation.html). After a follow-up, a follow up result can be documented using [FollowUp](StructureDefinition-KLCommonCareSocialFollowUp.html).
Throughout the care trajectory, observations might support findings, and be used before and after meassurements for evaluating the intervention efficiency. These are expressed using [Observation](StructureDefinition-KLCommonCareSocialObservation.html).
The last option, is that a citizen condition is known, because it has been found someplace else, and communicated to the municipality. In this case, the [FocusCondition](StructureDefinition-KLCommonCareSocialFocusCondition.html) can be instantiated. Note that FFB target groups (målgruppe) is a type of FocusCondition, because the target group is basically found elsewhere, even though it is a classification used by the municipalities.

Whenever an updated status of the citizen has been obtained, this might result in new plans being made, or execution of interventions if acute problems has arisen. However, the status might be so significantly changed, that the citizen should be re-evaluated completely. In this case, the changed status is considered a new occasion to act.



### Versioning and change management

#### This implementation guide
This implementation guide is regularly updated, and stable versions published on simplifier.net via MedCom. Note that FSIII and FFB Code systems are included as copies in the implementation guide. This results in a very simplistic versioning mechanism i.e. any time changes occur in either the model or municipality terminologies, a new version will be made available. The package number has three levels.
* First level updates are made when new areas of documentation are added to the model, which requires new community reviews of the model.
* Second level updates are any updates that adds or removes content from either model or terminology.
* Third level updates are updates that only relates to naming and communication, which means that the FHIR validator will not have errors running on another minor version, than the current (except for some warnings if coding.displays' are changed).

#### Instance level
When implementing use cases exploiting the profiles in this implementation guide, there may be a need to keep track of temporal development in data. Without knowing the specific use cases and implementation paradigm, unambiguous guidance about change management cannot be given. However, general guidance is available [here](./changeManagementFSIII_FFB.pdf) in Danish.

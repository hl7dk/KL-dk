### Scope and usage
KLCommonCareSocialCarePlan is used to document a collection of PlannedInterventions, which have a common goal or focus. 

CarePlan.category specifies the different types of CarePlans and has the following valid values: Rehabilitation following the health act §140, health promotion and prevention following the health act §119, and social intervention (social indsats) as described by FFB and VUM. The latter is well-described. §140 and §119 as healthcare processes are not thorughly described by FSIII yet, but there is a recognized need, to see them as processes rather than stand-alone interventions. Consequently, attributes are designes as specified by FFB.

The CarePlan.goal have two slices because it is used to describe both the mandatory purpose of the CarePlan (indsatsformål) and any number of connected intevention goals (FFB indsatsmål). An overall description of the intended intervention activities should be provided in CarePlan.description, which have a MUST SUPPORT flag. This means that even though it is not mandatory, it is highly recommended.     

CarePlan.careTeam refers to the CareTeam ressource and is used to describe both the organisation that delivers the interventions described in the care plan (CarePlan.careTeam:CareTeam.participant.member), and the type of delivery (FFB tilbud) (CarePlan.careTeam:CareTeam.category). 

The target group (Målgruppe) for FFB is specified in the Goal.adressess attribute. Note that the primary and secondary target groups are distinguished using a ConditionRank extension. The primary target group should have rank 1, all others do not have a required rank. FFB requires a primary target group only. The target group is expressed using a CrossSectorCondition profile. Note that only cross setcor conditions, where the code is actually a target group is relevant here.

CarePlan.intent, CarePlan.status and CarePlan.subject are mandatory in the FHIR CarePlan resource. It is important that the intent is set to "order", when the interventions have been approved by municipality authorities (når bevillingen er sket). The status should, as a minimum distinguish between draft, active, revoked and completed plans. Note that the meaning of active is "ready to be acted upon", so it does not signify that the first activities have occured.

The relevantHistory extension points to earlier significant versions of the CarePlan. Using the relevantHistory extension is recommended if changes to carePlans over time is of relevance for the use case.

CarePlan.activity.outcomeReference is used to represent assesment of needs (støttebehovsvurdering). It may be used to represent both the initial assesment of needs, and the assesment made when terminating the CarePlan. To make explicite that the activity is an assessment of needs, set activity.detail.code.coding = effe55c7-572c-4a99-8fb4-2a9dda2f6572 "Støttebehovsvurdering".

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter, der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk, og specificerer hvilke af FHIR-profilens atributter, der skal bruges til specifikation af indholdet.

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|indsatsforløbKategori|Klasse der udtrykker, hvilken slags indsatsforløb der er tale om.|CarePlan.category.coding|
|indsatsforløbFormål|Den overordnede intention med indsatsen.|CarePlan.goal|
|indsatsforløbBeskrivelse|Beskrivelse af indsatsforløbets indhold.|CarePlan.description|
|indsatsforløbOprettelsestid|Det tidspunkt hvor indsatsforløbsdokumentationen først blev oprettet.|CarePlan.created|
|indsatsforløbBevillingstid|Det tidspunkt hvor indsatsforløbet blev bevilliget.|CarePlan.period.start|
|indsatsforløbAfslutningstid|Det tidspunkt hvor indsatsforløbet blev afsluttet, eller planlægges afsluttet.|CarePlan.period.end|
|indsatsforløbsubjekt|Den borger som er genstand for indsatsforløbet.|CarePlan.subject|
|indsatsforløbansvarlig|Den organisation som er ansvarlig for bevilling og opfølgning på indsatsforløbet.|CarePlan.author|
|indsatsforløbsleverandør|Den organisation, der er ansvarlig for udførelsen af indsatsforløbet.|CarePlan.careTeam:CareTeam.participant.member|
|indsatsforløbmålgruppe|Klasse der udtrykker den FFB målgruppe, der er knyttet til en social indsats. (Målgruppen udtrykkes vha profilen CrossSectorCondition, fordi det fra et indholdssynspunkt er hensigtsmæssigt)|CarePlan.adresses|
|indsatsforløbmålgruppeRang|Heltal der udtrykker, hvordan målgruppen er prioriteret, så der kan skelnes mellem primær målgruppe og øvrige målgrupper.|CarePlan.adresses:extension.conditionRank|
|indsatsforløbtilbud|Klasse der udtrykker hvilken type tilbud (i FFB forstand), der skal varetage leveringen af ydelser.|CarePlan.careTeam:CareTeam.category|
|indsatsforløbhensigt|Indikerer niveauet af autorisation og hvor langt i planlægningen indsatsforløbet er.|CarePlan.intent|
|indsatsforløbstatus|Indikerer om der bliver handlet på der planlagte indsatsforløb, eller om dokumentationen repræsentere en fremtidig intention eller er historisk.|CarePlan.status|
|indsatsforløbændringshistorie|Tidligere versioner af Indsatsforløbet, hvor der er sket klinisk relevante ændringer.|CarePlan:extension.relevantHistory|
|indsatsforløbsmål|Mål for indsatsforløbet.|CarePlan.Goal|
|støttebehovsvurdering|Vurdering af støttebehov foretaget ifm. formulering af og opfølgning på indsatsforløbet.|CarePlan.activity.outcomeReference (activity.detail.code.coding)|

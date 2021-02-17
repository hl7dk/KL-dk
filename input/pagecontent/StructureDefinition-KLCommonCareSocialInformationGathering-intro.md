# Scope and usage
The CommonCareSocialInformationGathering may be instatiated, whenever an information gathering activity occur. The InformationGathering-profile groups data from of information gathering process e.g. therapeutic examination and nursing statuses (therapeutisk udredning og sygeplejefaglig udredning). The full list of supported information gathering types are expressed as a ValueSet for ClinicalImpression.code.coding

The result of an information gathering is:
* "information", which reference [KLCommonCareSocialMatterOfInterest](StructureDefinition-KLCommonCareSocialMatterOfInterest.html), and is structured according to FSIII area codes, FFB general information codes or FFB theme codes. Use ClinicalImpression.investigation.code.coding and ClinicalImpression.investigation.item
* Conditions, which reference [KLCommonCareSocialCondition](StructureDefinition-KLCommonCareSocialCondition.html), and is structured according to FSIII conditions or FFB conditions/sub-themes. Use ClinicalImpression.finding.itemReference, and 
* Evaluations, which reference [KLCommonCareSocialEvaluation](StructureDefinition-KLCommonCareSocialEvaluation.html). In the FSIII specification, the evaluation (FSIII helhedsvurdering), is not the conclusion of information gathering. I.e. this attribute should not reference it. ClinicalImpression.investigation.code.coding and ClinicalImpression.investigation.item

In Danish Municipalities, some information gathering procedures may strech more than one encounter. In these cases, you only have the opportunity to document the latest time and reference the latest encounter. Use ClinicalImpression.effectiveDateTime, and ClinicalImpression.encounter. If more is needed, look into the use af FHIR Provenance.

Information gathering is often the first activity after a request or referal to the municipality. To show what initiated the informationGathering, a ServiceRequest may be referenced in ClinicalImpression:extension.basedOnServiceRequest

ClinicalImpression.status is mandatory valid values are "in-progress", "completed" and "entered-in-error". Use the code "in-progress" if the information gathering activity stated by ClinicalImpression.code.coding is started, but not finished.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|oplysningsaktivitetstype|Den type af oplysningsaktivitet der udføres|ClinicalImpression.code.coding|
|oplysningsaktivitetsubjekt|Den borger som oplysningerne vedrører|ClinicalImpression.subject|
|oplysningsaktivitetsudfører|Den fagperson, der udfører oplysningsaktiviteten|ClinicalImpression.assessor|
|oplysningsaktivitetstid|Det seneste tidspunkt hvor oplysningsaktiviteten fandt sted|ClinicalImpression.effectiveDateTime|
|oplysningsaktivitetskontakt|Den seneste kontakt hvor oplysningsaktiviteten fandt sted|ClinicalImpression.encounter|
|oplysningsaktivitetsordre|Den henvendelse eller henvisning der er grunden til at oplysningsaktiviteten finder sted|ClinicalImpression:extension.basedOnServiceRequest|
|oplysningsaktivitetsObservationstype|Klasse, der angiver om de tilknyttede observationer er oplysninger eller vurderinger.|ClinicalImpression.investigation.code.coding|
|OplysningsaktivitetsOplysning|Oplysning, organiseret under et fagligt emneområde, der er fremkommet under oplysningsaktiviteten|ClinicalImpression.investigation.item|
|oplysningsaktivitetsKonklusion|Vurdering, der er konklusion på oplysningsaktiviteten.|ClinicalImpression.investigation.item|
|oplysningsaktivitetsTilstand|Tilstand, der er udredt ifm oplysningsaktiviteten.|ClinicalImpression.finding.itemReference|
|oplysningsaktivitetsstatus|Klasse der udtrykker, hvor i sin proces, oplysningsaktiviteten er.|ClinicalImpression.status|






















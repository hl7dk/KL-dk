### Scope and usage
CommonCareSocialObservation is used to document results of activities where a property of a citizen is observed or meassured. This means that both FSIII meassurements (målinger) and FSIII observations (observationer) may be captured using this resource. FFB does not specify observations per se, but could use this resource if a need arise. The use of this resource should not be confused with what FFB defines as professional notes/observations (faglige notater/observationer), which are notes made by service providers during an intervention. Use the CommonCareSocialCondition resource instead.

KLCommonCareSocialObservation is loosely modelled. Special care should be taken when choosing the Observation.code, which is mandatory. It is currently bound to an extensible set of SNOMED CT codes. If extending the set is nessesary for a use case, it is recommended that a SNOMED CT observation code is chosen, and that you report which code you use to Local Government Denmark (Kommunernes Landsforening). Be aware that more specific profiles are expected to be designed. Browse the implementation guide for specific profiles before using this general one.

The CommonCareSocialObservation may be linked to the plan, proposal or order that autorized the observation. Use the basedOn attribute to link to CommonCareSocialPlannedIntervention, CommonCareSocialServiceRequest or CommonCareSocialCarePlan.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|observationskode|Klasse som udtrykker, hvad der observeres.|Observation.code|
|observationsresultat|Resultatet af observationen.|Observation.value|
|observationsenhed|Enheden på observationsresultatet, hvis denne er kvantitativ.|Observation.value.valueQuantity.unit|
|observationssubjekt|Den borger, for hvem der er foretaget en observation.|Observation.subject|
|observationskontakt|Den kontakt, hvor observationen er foretaget.|Observation.encounter|
|observationsansvarlig|Den der er ansvarlig for observationen.|Observation.performer|
|observationBaseretPå|Indsats eller indsatsforløb, som denne observation er del af.|Observation.basedOn|
|observationstid|Tidspunkt for observationen.|Observation.effective.DateTime|
### Scope and usage
CommonCareSocialEvaluation is used for documenting the structured result of an evaluation, typically being the last part of or following an information collection process. This resource has a code-based results in Observation.valueCodableConcept.

The Observation.code is mandatory, and fixed to the KL-code effe55c7-572c-4a99-8fb4-2a9dda2f6572|FFB støttebehovsvurdering|
and the SNOMED CT code 225343006 |Assessment of needs (procedure)|.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|struktureretBehovsvurderingskode|Klasse, der udtrykker at vurderingstypen er en støttebehovsvurdering.|Observation.code|
|struktureretBehovsvurderingsresultat|Klasse, der udtrykker resultatet af støttebehovsvurderingen.|Observation.value|
|struktureretBehovsvurderingssubjekt|Den borger som støttebehovsvurderingen vedrører.|Observation.subject|
|struktureretBehovsvurderingskontakt|Den kontakt hvor støttebehovsvurderingen er foretaget.|Observation.encounter|
|struktureretBehovsvurderingsansvarlig|Den fagperson som er ansvarlig for støttebehovsvurderingen.|Observation.performer|
|struktureretBehovsvurderingstid|Det tidspunkt, hvor behovsvurderinge har fundet sted.|Observation.effective.datetime|
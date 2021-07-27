
### Scope and usage
CommonCareSocialEvaluation is used for documenting the result of an evaluation, typically being the last part of or following an information collection process. The different kinds of evaluations currently supported are defined by FSIII and FFB, and they are "FSIII helhedsvurdering", "FFB vurdering af borgers situation", "FFB støttebehovsvurdering", "VUM Borgerens perspektiv på indsatsen", "VUM Borgerens ressourcer i forhold til indsatsen".

The Observation.code is mandatory, and fixed to a ValueSet specified by Local Govenment Denmark (KL), which may be suplemented with a SNOMED CT code.

This resource has a text-based results in Observation.valueCodeableConcept.text, but can have a coded result as well. The coded result is only defined for structured needs assessment (FFB støttebehovsvurdering), and is represented in Observation.codeableConcept.coding. This means that Observation.codeableConcept.coding is only allowed if the Observation.code is effe55c7-572c-4a99-8fb4-2a9dda2f6572"FFB støttebehovsvurdering", and possibly the SNOMED CT code 225344000 "Assessment of degree of assistance required (procedure)".

The Evaluation may reference a ServiceRequest, if the evaluation is percieved as an answer to that request. 

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|vurderingskode|Klasse der udtrykker typen af vurdering.|Observation.code|
|vurderingsresultat|Tekst der udgør vurderingsresultatet.|Observation.valueCodeableConcept.text|
|struktureretVurdering|En struktureret støttebehovsvurdering.|Observation.valueCodeableConcept.coding|
|vurderingssubjekt|Den borger der vurderes.|Observation.subject|
|vurderingskontakt|Den kontakt, hvor vurderingen gennemføres.|Observation.encounter|
|vurderingsansvarlig|Den fagperson der er ansvarlig for vurderingen.|Observation.performer|
|vurderingBaseretPå|Den henvendelse/henvisning som vurderingen er opsummering/svar på.|Observation.basedOn|
|vurderingstid|Det tidspunkt hvor vurderingen er foretaget.|Observation.effectiveDateTime|
|vurderingsstatus|Klasse der udtrykker, hvor i sin proces, vurderingen er.|Observation.status|
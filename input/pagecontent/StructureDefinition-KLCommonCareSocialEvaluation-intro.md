
### Scope and usage

CommonCareSocialEvaluation is used for documenting the result of an evaluation, typically being the last part of or following an information collection process. The different kinds of evaluations currently supported are defined by FSIII and FFB, and they are "FSIII helhedsvurdering", "FFB samlet situation", og "FFB støttebehovsvurdering". This resource has a text-based results in Observation.valueString, but refers to a stuctures needs assessment (støttebehovsvurdering) [KLCommonCareSocialStructuredEvaluation](StructureDefinition-KLCommonCareSocialStructuredEvaluation.html) in Observation.hasMember.

The Observation.code is mandatory, and fixed to a ValueSet specified by Local Govenment Denmark (KL), which may be suplemented with a SNOMED CT code.

The CommonCareSocialEvaluation may reference a CommonCareSocialServiceRequest, if the evaluation may be percieved as an answer to that request. 

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|vurderingskode|Klasse der udtrykker typen af vurdering.|Observation.code|
|vurderingsresultat|Tekst der udgør vurderingsresultatet.|Observation.value|
|vurderingssubjekt|Den borger der vurderes.|Observation.subject|
|vurderingskontakt|Den kontakt, hvor vurderingen gennemføres.|Observation.encounter|
|vurderingsansvarlig|Den fagperson der er ansvarlig for vurderingen.|Observation.performer|
|klassificeretvurdering|En struktureret støttebehovsvurdering.|Observation.hasMember|
|vurderingBaseretPå|Den henvendelse/henvisning som vurderingen er opsummering/svar på.|Observation.basedOn|
|vurderingstid|Det tidspunkt hvor vurderingen er foretaget.|Observation.effective.datetime|
### Scope and usage
The CommonCareSocialServicePerformer express a service (tilbud), and who provides it as expressed by FFB, and is used as part of formulating a social intervetion using [CommonCareSocialCarePlan](StructureDefinition-KLCommonCareSocialCarePlan.html).

The service is expressed using the category-attribute, and is bound to service-codes (tilbud) as expressed by FFB. The managingOrganization reference the organization, which is responsible for the delivery of the service.


### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|tilbudstype|Det tilbud som udføreren tilbyder. |CareTeam.category|
|tilbudsudførerOrganisation|Den organisation, der er udførerer på tilbudet.|CareTeam.managingOrganization|
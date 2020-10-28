### Scope and usage

CommonCareSocialStructuredFollowUp is used for documenting the classified result of a Follow-up procedure (struktureret opfølgning) in FSIII or FFB. This resource has a codes result, where FFB and FSIII follow-up codes are valid values.

The Observation.code is mandatory, and fixed to the SNOMED CT code 712744002|Evaluation of care plan (procedure)|.

Note that the StructuredFollowUp may reference an Encounter. Use this opportunity only if the follow-up takes place in an actual meeting between a practitioner and citizen.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter, der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|struktureretOpfølgningskode|Klasse, der udtrykker at der evalueres på den indsats der er igangsat.||
|struktureretOpfølgningsresultat|Klasse der udtrykker hvad resultatet af opfølgningen er.||
|struktureretOpfølgningssubjekt|Den borger, der er genstand for opfølgningen||
|struktureretOpfølgningskontakt|Den kontakt hvor opfølgningen er foretaget||
|struktureretOpfølgningsansvarlig|Den fagperson der har ansvaret for opfølgningen||
|struktureretOpfølgningstid|Det tidspunkt, hvor opfølgningen er foretaget||










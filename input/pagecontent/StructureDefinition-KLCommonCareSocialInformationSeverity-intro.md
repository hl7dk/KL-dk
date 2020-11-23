### Scope and usage
The CommonCareSocialInformationSeverity may be instatiated for FSIII areas where, in special cases, a severity may be recorded together with or instead of the a text.


### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|oplysningskode|Klasse der udtrykker, hvilket fagligt emneområde, sværhedsgraden tilhører. |Observation.code.coding.code|
|oplysningssværhedsgradsresultat|Klasse, der udtrykker sværhedsgraden|Observation.CodableConceptvalue|
|oplysningssværhedsgradssubjekt|Borger, der er genstand for vurdering af oplysningssværhedsgradssværhedsgrad|Observation.subject|
|oplysningssværhedsgradskontakt|Kontakt hvori oplysningsværhedsgrad vurderes|Observation.encounter|
|oplysningssværhedsgradsansvarlig|Fagperson der er ansvarlig for vurderingen af oplysningssværhedsgrad.|Observation.performer|
|oplysningssværhedsgradstid|Det tidspunkt hvor oplysningen er fremkommet, vurderet eller dokumenteret|Observation.effective.datetime|
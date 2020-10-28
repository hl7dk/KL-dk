### Scope and usage
The CommonCareSocialSeverity may be instatiated for FSIII and FFB objects, where a severity is recorded as a functional ablitity level. Not that it does not make sense to  The observation.code is fixed to the KL-code 66959f77-6e2a-4574-8423-3ff097f8b9fa "funktionsevneniveau". Note that it does not make sense to record the Severity, without it being reference by another resource that gives the context of the score i.e. which condition, area or goal is it related to.

The valueCodeableConcept may only be valid severity codes as expressed by FFB and FSIII.


### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|sværhedsgradskode|Klasse der udtrykker, at der er tale om en sværhedsgrad. |Observation.code|
|sværhedsgradsresultat|Klasse, der udtrykker sværhedsgraden.|Observation.CodableConceptvalue|
|sværhedsgradssubjekt|Borger, der er genstand for vurdering af sværhedsgrad.|Observation.subject|
|sværhedsgradskontakt|Kontakt hvori sværhedsgraden vurderes.|Observation.encounter|
|sværhedsgradsansvarlig|Fagperson der er ansvarlig for vurderingen af sværhedsgrad.|Observation.performer|
|sværhedsgradstiddstid|Det tidspunkt hvor oplysningen er fremkommet, vurderet eller dokumenteret.|Observation.effective.datetime|
## Scope and usage
The CommonCareSocialServiceRequest may be instatiated to signify that a request for a service is recieved in a Danish Municipality. A ServiceRequest may either be a request or a referal (Henvendelse/Henvisning), but the use of the model should reflect this.

A referal, where a GP or a hospital has already decided that the service is required should have the sending organisation as the requester, and if no further information and/or authorisation from the municipality is needed, the intent-attribute value is 'order'. This is e.g. true for GP's orders to acute nursing teams, here the ServiceRequest is the documentation that the interventions, that the nurses perfrom, are authorized.

When a citizen or next-of-kin request a service from the municipality, the requester is the municipality practitioner that talks to the citizen or next-of-kin, and who is responsible for its communication to the right parties in the municipality. Here, the intent is often 'propsal', because the PlannedIntervention should be authorized before interventions may be delivered for this scenario.

The subjectConsentToLiasing extension is used in FFB to signify whether the citizen knows about the service request or not. It should not be stated unless it is explicitely known, and only for FFB.

ServiceRequest.reasonCode.text (anledningsårsag) is the text-based description of why an entity have contacted the municipality and asked for help. Sometimes, this text already describes what exactly should be delivered. Sometimes, it describes some concern that the municipality should look further into. As such, the attribute relates directly to the text option for "FSIII Henvendelses-/henvisningsårsag".

SeviceRequest.reasonReference (anledningsbegrundelse) is a FocusCondition that describe the citizen's disease, reduced functioning or problem, which is the background for the ServiceRequest. As such, the attribute relates directly to the condition and diagnosis options for "FSIII Henvendelses-/henvisningsårsag".

ServiceRequest.code.coding and ServiceRequest.orderDetail.coding may be used to explicitely state, what kind of interventions the requester wants for the citizen. That is not to say, that these are the interventions that the citizen is autorized to recieve (unless the intent-attribute is 'order'). ServiceRequest.orderDetail.coding relates to the intervention option for "FSIII Henvendelses-/henvisningsårsag". If more than one type of intervention is required, e.g. both nursing and training, two service requests should be present, with two different ServiceRequest.code.coding.

ServiceRequest.reasonReference also makes it possible to follow the care-pathway. In the case of a re-evaluation of a citizen (re-visitation), it is interesting which follow-up (opfølgning), was the reason for it.

ServiceRequest:extension.municipalityCaseNumber is a relation to the municipality case (Sag). The officialCaseIdentifier uses an official http-adress and uuid to relate to a municipality case (Rammearkitektur: Sag.ID). The municipalitySpecificCaseIdentifier uses a municipality specific ID as a value, and a relates to the organization that owns this caseIdentifier(Rammearkitektur Sag.Sagsnummer og Sag.ejer Sagsaktør).

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|anledningAnsvarlig|Den som har ansvar for henvendelsen/henvisningen|ServiceRequest.requester|
|anledningFra|Klasse der angiver, hvilken instans, der har henvist eller har henvendt sig.|ServiceRequest.extension: RequesterType|
|anledningsårsag|Beskrivelse af årsagen til henvisningen/henvendelsen|ServiceRequest.reasonCode.text|
|anledningsstatus|Klasse der udtrykker status for henvendelsen|ServiceRequest.status|
|anledningsHensigt|Klasse der udtrykker hensigten med henvendelsen|ServiceRequest.intent|
|anledningsIndsats|Klasse der udtrykker, hvilken type kommunal indsats/ydelse der anmodes om.|ServiceRequest.code.coding|
|anledningsAnmodetIndsats|Klasse der udtrykker, hvilken kommunal indsats/ydelse der anmodes om.|Servicerequest.orderDetail.coding|
|anledningsSubjekt|Den borger som henvisningen/henvendelsen vedrører|ServiceRequest.subject|
|anledningstid|Det tidspunkt hvor henvisning/henvendelsen er forfattet af den ansvarlige|ServiceRequest.authoredOn|
|anledningBorgerIndforståetMed|Klasse der angiver om borger er indforstået med henvendelsen|SeviceRequest.extension: SubjectConsentToLiaising|
|anledningsbegrundelse|Den borgertilstand, der ligger til grund for henvendelsen/henvisningen. |SeviceRequest.reasonReference|
|anledningsårsagsreference|Et klassificeret opfølgningsresultat, der er baggrund for at borger revisiteres.|ServiceRequest.reasonReference|
|anledningDokumenteretISag|Kommunalt sagsnummer på den sag, som anledningen vedrører. Enten officielt uuid eller kommune-specifikt nummer|ServiceRequest:extension.municipalityCaseNumber|
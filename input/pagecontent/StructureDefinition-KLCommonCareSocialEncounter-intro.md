### Scope and usage
The CommonCareSocialEncounter may be instantiated whenever citizens and practitioners meet in a Danish municipality context. The CommonCareSocialEncounters are e.g.
* home visits in citizens homes by nurses or home-care staff
* training sessions
* histroy taking, examinations and clarifying conversations
* evaluation

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|kontaktstatus|Klasse der indikerer om kontakten er igangværende, eller om dokumentationen repræsentere en fremtidig intention eller er historisk|Encounter.status|
|kontakttype|Typen af aktivitet der gennemføres ved kontakten|Encounter.type|
|kontaktstart|Kontaktens start, eller planlagte start|Encounter.period.start|
|kontaktslut|Kontaktens sluttidspunkt, eller planlagte sluttidspunkt|Encounter.period.end|
|kontaktlængde|Kontaktens længde, eller planlagte længde. |Encounter.length|
|kontaktudfører|Liste af fagpersoner der gennemfører kontakten|Encounter.participant|
|kontaktsubjekt|Den borger kontakten vedrører|Encounter.subject|
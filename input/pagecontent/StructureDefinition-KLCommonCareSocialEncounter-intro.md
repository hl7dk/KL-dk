### Scope and usage
The CommonCareSocialEncounter may be instantiated whenever citizens and practitioners meet in a Danish municipality context. The CommonCareSocialEncounters are e.g.
* Home visits in citizens homes by nurses or home-care staff
* Training sessions
* Histroy taking, examinations and clarifying conversations
* Follow-up

The Encounter.type.coding attribute is used to classify the type of activities that occur at the encounter. More than one activity may occur. Note that it is not the intention that these codes should be documented by staff. Rather, they should be derived from the documentation following an encounter e.g. if an observation is documented, the code 'observation' should be added to the Encounter.type.coding. Note that if there are more than one code, they should be added as separate CodeableConcepts, not separate codings under the same CodeableConcept.

It is important in FSIII to be able to express follow-up encounters. In the planning state, these are documented by setting Encounter.status = "planned", and Encounter.type.coding = "opfølgning". When a followUp has been performed, the Encounter.status is changed to "finished".

Encounter.class is mandatory in FHIR. In Danish municipalities the values are used as follows.
* Visits in citizens homes have the code 'HH' home health, the code is also used for services that are not strictly health related e.g. help with cleaning. This code is also used, even if the activities stretch outside the citizens residence e.g. a physiotherapist that want to see a citizen walk outside, or a social worker helping with shpping activities.
* Sessions where the citizens visit municipality facilities e.g. for training or health prevention have the code "AMB" ambulatory. 
* For visits in municipality health facilities e.g. municipality acute centers the code 'IMP' inpatient encounter. All activities are related one and the same encounter.
* Rooms in nursing homes are considered citizens own homes. If the encounter model is used, each visit (or for simplicities sake, each day) must be considered its own encounter. The code is 'HH' home health.
* For telehealth/telecare encounters, where the patient is contacted by telephone, by teleconference or e-mail, the code is 'VR' virtual.

In Denmark, the term "indirekte indsatser" is used to express staff activities where citizens are not present. E.g. coordination or follow-up. These activities may still be part of PlanlagtIndsats or PlanlagtIndsatsforløb, but they may not be expressed as encounters. Instead, a Provenance resource may be instantiated, to express the carried out coordination work.

Encounter.period.start is mandatory. Note that "time of day" is optional. 

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|borgerkontaktstatus|Klasse der indikerer om kontakten er igangværende, eller om dokumentationen repræsentere en fremtidig intention eller er historisk|Encounter.status|
|borgerkontakttype|Klasse der udtrykker typen af aktivitet der gennemføres ved kontakten|Encounter.type.coding|
|borgerkontaktstart|Kontaktens start, eller planlagte start|Encounter.period.start|
|borgerkontaktslut|Kontaktens sluttidspunkt, eller planlagte sluttidspunkt|Encounter.period.end|
|borgerkontaktlængde|Kontaktens længde, eller planlagte længde. |Encounter.length|
|borgerkontaktudfører|Liste af fagpersoner, der gennemfører kontakten|Encounter.participant|
|borgerkontaktsubjekt|Den borger kontakten vedrører|Encounter.subject|
|borgerkontaktklasse|Klasse, der udtrykker en generel kategori for kontakten, som rækker ud over den kommunale kontekst.|Encounter.class|
|borgerkontaktansvarlig|Den organisation der er ansvarlig for kontakten|Encounter.serviceProvider|
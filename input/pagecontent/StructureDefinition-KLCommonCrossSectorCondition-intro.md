### Scope and usage
The CommonCrossSectorCondition is used for the documentation and exchange of conditions, that does not originate from the municipality from which a citizen currently recieves their care, but which are nevertheless important for the care or treatment that the citizen recieves from the municipality. As the conditions originates from different organisations, they have different code systems and Value sets associated with them, which are documented in different slices of Condition.code.coding. The different types of conditions allowed are:
* Diagnoses from hospitals (using ICD10/SKS-D codes)
* Diagnosis or problems as registered by general practitioners (using ICPC2) 
* Conditions that other municipalities have previously cared for (Using FSIII and FFB condition codes)
* An FFB target-group registration (Using FFB target group codes)
* Condition that the citizen, next-of-kin or others tell about (No codes used)

A short description of the citizens condition can be provided in Condition.code.text, which is especially important if the condition does not have a code or if the code is not very specific. If the external party wishes to send more thorough descriptions or historic notes about the condition, they may be added using Condition.note - in addition to text, Condition.note contains a date and author, making it possible to refer to historic notes documented by others, than the one autoring the Condition itself.

The Condition.asserter can reference a practitioner, who is responsible for finding the condition or first describing the condition as a condition. Condition.recorder can reference the practioner responsible for this recording of the condition.

Three time-references define the clinical course of the condition:
* The Condition.recordedDate is the day of the recording of the condition
* Condition.onset[x] the time where the condition first showed
* Condition.abatement[x] is the day where the condition is first recognized as no longer being present

It is a good idea to always provide clinicalStatus and verificationStatus. If they are not populated, the condition is assumed to be confirmed and active.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|tværorganisatoriskTilstandskode|klasse der udtrykker, hvilken persontilstand der er tale om.|Condition.code.coding|
|tværorganisatoriskTilstandsvurdering|Kortfattet beskrivelse af tilstanden, som uddybning af kode eller koder.|Condition.code.text|
|tværorganisatoriskTilstandsubjekt|Den borger, som den tværorganisatoriske tilstand vedrører|Condition.subject|
|tværorganisatoriskTilstandAnsvarlig|Den fagperson, der er ansvarlig for at have fundet tilstanden. |Condition.asserter|
|tværorganisatoriskTilstandDokumentationsansvarlig|Den fagperson, der er ansvarlig for denne dokumentation af tilstanden|Condition.recorder|
|tværorganisatoriskTilstandstatus|Klasse der udtrykker en status for om tilstanden er til stede eller ej.|Condition.clinicalStatus og Condition.verificationStatus|
|tværorganisatoriskTilstandstart|Det tidspunkt, hvor tilstanden først har vist sig|Condition.onset[x]|
|tværorganisatoriskTilstandsafslutningstid|Det tidspunkt hvor tilstanden først er erkendt som ikke længere værende til stede.|Condition.abatement[x]|
|tværorganisatoriskTilstandregistreringstid|Det tidspunkt hvor denne registrering vedr. tilstanden er gennemført|Condition.recordedDate|
|tværorganisatoriskTilstandFagligtNotat|Uddybninger eller journalnotater hørende til den tværorganisatorisk tilstand|Condition.note|
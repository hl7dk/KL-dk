### Scope and usage
The CommonCrossSectorCondition is used for the documentation and exchange of conditions, that does not originate from the municipality from which a citizen currently recieves their care, but which are nevertheless important for the care or treatment that the citizen recieves from the municipality. Examples are:
* Diagnoses from hospitals or primary care physisians
* Conditions that other municipalities have previously cared for
* A condition that the citizen, or next-of-kin tells about
* An FFB target-group registration

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|tværorganisatoriskTilstandskode|klasse der udtrykker, hvilken persontilstand der er tale om.|Condition.code|
|tværorganisatoriskTilstandsvurdering|Kortfattet beskrivelse af tilstanden, som uddybning af kode eller koder.|Condition.code.text|
|tværorganisatoriskTilstandsubjekt|Den borger, som den tværorganisatoriske tilstand vedrører|Condition.subject|
|tværorganisatoriskTilstandAnsvarlig|Den fagperson, der er ansvarlig for at have fundet tilstanden. |Condition.asserter|
|tværorganisatoriskTilstandstart|Det tidspunkt, hvor tilstanden først har vist sig|Condition.period.start|
|tværorganisatoriskTilstandsafslutningstid|Det tidspunkt hvor tilstanden først er erkendt som ikke længere værende til stede.|Condition.abatementDateTime|
|tværorganisatoriskTilstandregistreringstid|Det tidspunkt hvor denne registrering vedr. tilstanden er gennemført|Condition.recordedDate|
|tværorganisatoriskTilstandFagligtNotat|Uddybninger eller journalnotater hørende til den tværorganisatoriske tilstand|Condition.note|
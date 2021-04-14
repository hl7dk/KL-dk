### Scope and usage
Note that this profile has been taken directly from dk-core
Additional requirements or constraints may exist in Danish municipalities, but has not been explicitely stated in this IG.

Note that the example-instances, do not have CPR-identifier. For example-patients with CPR-identifiers MedComs approved list of example-patients have to be used, and the examples in this implementation guide is not matched to the MedCom list. See dk-core for example patients/citizens with CPR identifiers.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter, der er defineret i den fælleskommunale rammearkitektur og FHIR profilen. Alle rammearkitektur-attributter er ikke medtaget, kun de der umiddelbart er relevante for interoperabilitets use cases. Tabellen definerer kort den enkelte attribut på dansk, og specificerer hvilke af FHIR-profilens atributter, der skal bruges til specifikation af indholdet.

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|Personnummer.Nummer|Entydig Identifikation af en person i CPR. Indeholder information om fødselsdato, køn og århunderede.|Patient.identifier(cpr-slice).value|
|identifikation|Entydig Identifikation af en person (definition valgt anderledes end rammearkitektur)|Patient.identifier.value|
|patientIDsystem(ikke i rammearkitektur)|Angivelse af udstederen af personnummer eller andet patientid, for Personnummer.Nummer er systemet urn:oid:1.2.208.176.1.2|Patient.identifier(cpr-slice).system|
|Person.fødselsdato|Personens fødselsdato.|Patient.birthDate|
|Person.køn|Personens køn.|Patient.gender|
|Personnavn.Efternavn|Personens efternavn.(definition valgt anderledes end rammearkitektur)|Patient.name.family|
|Personnavn.Fornavne|Persons fornavne.|Patient.name.given|
|Personnavn.Mellemnavn|Personens mellemnavne.|Patient.name.given|
|Civilstand.civilstandstype|Personens civilstand som specificeret af CPR. Læg mærke til at det deles ud over flere attributter i FHIR |Patient.maritalStatus/Patient.deceased[x]|
|SimpelAdresse|Simpel adresse er CPR’s definition på ustrukturerede klarskrifts adresser. Ingen felter er krævede, og der er ikke nogen krav til specifikt indhold i de forskellige felter.|Patient.adress.line|
|CPRAdresse.CPRKommunekode|Kode for en kommune.|Patient.adress:extension.dk-core-municipalityCodes|
|CPRAdresse.Postnummer|Postvæsenets landsdækkende postnummerkode. Postnummer er et obligatorisk vejdistrikt.|Patient.address.postalCode|
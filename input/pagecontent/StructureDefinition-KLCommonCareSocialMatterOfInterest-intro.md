## Scope and usage
The KLCommonCareSocialMatterOfInterest is used in Danish Municipalities, and may be instantiated whenever information about the citizen is recorded, under the headings defined by FFB Themes, Areas (FSIII områder), General Information (FSIII generelle oplysninger). For each heading, a new instance of CommonCareSocialInformation is used. If using the findingInformer extension, each of the matterOfInterest informers’ perspectives have their own instance. I.e. one FFB theme may be associated with three different instances, if all matter-of-interest informers are documented explicitly. 

Observation.valueString holds the text-based result of the observation. For FSIII areas, in special cases, a severity may be recorded together with or instead of the text. This should be recorded, using the profile CommonCareSocialInformationSeverity, which may be associated with this profile using the hasMember-attribute.

The documentation of the care-pathway may be supported using the Observation.encounter which tells in which encounter the KLCommonCareSocialMatterOfInterest has been recorded. Observation.basedOn may tell, which ServiceRequest resulted in the information gathering that this KLCommonCareSocialMatterOfInterest is part of.

Notice that the status-attribute is mandatory. For normal use, just set to "final", if data is missing or another problem has occured, follow the FHIR guidance to populate the field correctly.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|oplysningskode|Klasse der udtrykker, hvilket fagligt emneområde, oplysningen tilhører. |Observation.code.coding|
|oplysningstekst|Oplysningen udtrykt som tekst|Observation.valueString|
|oplysningssubjekt|Den borger som oplysningen omhandler|Observation.subject|
|oplysningskontakt|Den kontakt hvor oplysningsaktiviteten har fundet sted.|Observation.encounter|
|oplysningsansvarlig|Den fagperson, der er ansvarlig for oplysningen|Observation.performer|
|oplysningsordre|Den henvendelse/henvisning, der har udløst at oplysningsaktiviteten er igangsat|Observation.basedOn|
|oplysningstid|Det tidspunkt hvor oplysningen er vurderet.|Observation.effectiveDateTime|
|oplysningssværhedsgrad|Sværhedsgraden af de udfordringer som indhentede informationer observationer og vurderinger har belyst, organiseret under faglige emneområder.|Observation.hasMember|
|oplysningsinformant|Klasse der udtrykker hvem oplysningen kommer fra.|Observation.extension:matterOfInterestInformer|
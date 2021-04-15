## Scope and usage
The KLCommonCareSocialMatterOfInterest is used in Danish Municipalities, and may be instantiated whenever information about the citizen is recorded, under the headings defined by FFB Themes, Areas (FSIII områder), General Information (FSIII generelle oplysninger). For each heading, a new instance of CommonCareSocialInformation is used. If using the findingInformer extension, each of the matterOfInterest informers’ perspectives have their own instance. I.e. one FFB theme may be associated with three different instances, if all matter-of-interest informers are documented explicitly. 

Observation.valueCodeableConcept holds the text-based result of the observation.

The documentation of the care-pathway may be supported using the Observation.encounter which tells in which encounter the KLCommonCareSocialMatterOfInterest has been recorded. Observation.basedOn may tell, which ServiceRequest resulted in the information gathering that this KLCommonCareSocialMatterOfInterest is part of.

Notice that the status-attribute is mandatory. For normal use, just set to "final", if data is missing or another problem has occured, follow the FHIR guidance to populate the field correctly.


### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|områdekode|Klasse der udtrykker området der belyses. |Observation.code.coding|
|områdetekst|Oplysningen af området udtrykt som tekst|Observation.valueCodeableConcept.text|
|områdesubjekt|Den borger som oplysningen af området omhandler|Observation.subject|
|områdekontakt|Den kontakt hvor oplysningsaktiviteten har fundet sted.|Observation.encounter|
|områdeansvarlig|Den fagperson, der er ansvarlig for oplysningsaktiviteten|Observation.performer|
|områdeordre|Den anledning, der har udløst at oplysningsaktiviteten er igangsat|Observation.basedOn|
|områdetid|Det tidspunkt hvor området er oplyst.|Observation.effectiveDateTime|
|områdeinformant|Klasse der udtrykker hvem område/tema er belyst af.|Observation.extension:matterOfInterestInformer|
|områdestatus|Klasse der udtrykker, hvor i sin proces, oplysning af området er.|Observation.status|
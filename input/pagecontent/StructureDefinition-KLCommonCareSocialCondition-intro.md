### Scope and usage
The KLCommonCareSocialCondition may be instatiated whenever a condition is found and registered for citizens in Danish municipalities. In social care, conditions are also referred to as subthemes (undertemaer).

Conditions are always defined by Condition.code, which may originate from FSIII or FFB. In addition, a SNOMED CT code may be added either to improve understanding for those outside the Danish municipalities, or to express more detailed content.

Condition.severity.coding has as valid values the functioning ability levels (FFB funktionsevneniveau) or funtional levels (FSIII funktionsniveau). Make sure that FFB subthemes use FFB functioning ability levels and FSIII conditions use FSIII functional levels - the codes have somewhat the same wording, but they do not have the same meaning.

Condition.recordedDate is the date where the condition was first recorded, NOT the date where the problem first known to be present.

Condition.clinicalStatus should be populated with the value "active" if the citizen has the condition, and inactive if the citizen no longer have the condition. Condition.verificationStatus should be set to "unconfirmed", if a note is associated with a condition code, which is not already active and confirmed (this is specific to FFB). In most other use cases, Condition.verificationStatus should be "confirmed". clinicalStatus is mandatory, and it is a good idea to always provide the verificationStatus. If not populated, the condition is assumed to be "confirmed".

Conditions are related to a professional context (through its code). These are the different contexts in which codelists of conditions are formulated:

* Home nursing SUL §138 (FSIII)
* Home care SEL §83, §83a, §84, §86 (FSIII)
* Prevention SUL §119 (FSIII)
* Training SUL §140 (FSIII)
* Specialized social care SEL §85, §103, §104, §107, §108, and Almenboligloven §105. (FFB)

Condition.category is, in this implementation, used as a way to determine whether the condition is in focus in a professional context. In focus means that this condition is solely or partially the reason why interventions are performed in the professional context. If a condition is "in focus" Condition.category is populated with the value "problem-list-item". An empty Condition.category means that the focus have not been considered (if it is the first version of a condition). If the latter is the case, it might be difficult to determine whether a condition have been ended.

Ending a condition have two meanings. The first is that the citizen no longer has the condition e.g. a pressure ulcer has healed. In this case, Condition.clinicalStatus=inactive and Condition.abatementTime is the date where the condition was no longer a problem. The second meaning of "ended" is that the condition falls out of focus in a professional context e.g. if the citizen moves, or another professional group takes over the care for the citizen. In this case, the Condition.category looses its "problem-list-item" flag. The idea is to state that from a citizen viewpoint the condition has not changed, but in this professional context it is no longer in focus.

Condition.code.text holds a short description or evaluation of the condition including how serious it is. The attribute is mandatory for the home nursing context. The attribute should only be changed, if the condition significatly changes e.g. a pressure ulcer that is significantly worse or better. All other text descriptions and notes should be placed in Condition.note.text. For most use cases, it is important that notes explicitely state the author in Condition.note.author.

Condition.extension:dueTo is the reason for the condition, which is an optional attribute in FSIII. It references either KLCommonCareSocialCondition or KLCommonCrossSectorCondition.

Condition follow-up is documented using Condition.extension:followUpEncounter, which points to a future encounter, with Encounter.type= "opfølgning".

Condition.evidence.detail may hold a reference to both KLCommonCareSocialMatterOfInterest and KLCommonCareSocialEvaluation. Associated KLCommonCareSocialEvaluations are previous follow-up results. Associated KLCommonCareSocialMatterOfInterest's are information about the citizen recorded under the headings defined by FFB Themes, Areas (FSIII områder), which are related to this specific condition. E.g. if the condition is "J3.4 - Færden i forskellige omgivelser" then there might be associated information recorded as a KLCommonCareSocialMatterOfInterest within the code "J3 - Mobilitet".

Conditions may have several different versions. Those that are important from a municipality viewpoint may be followed using the extension:EventHistory. 

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|tilstandskode|Udtrykker hvilken klasse tilstanden tilhører.|Condition.code.coding|
|tilstandssværhedsgrad|Udtrykker hvilken klasse tilstandens sværhedsgrad har.|Condition.severity.coding|
|tilstandsstatus|Klasse der udtrykker en status for om tilstanden er til stede eller ej.|Condition.clinicalStatus og Condition.verificationStatus|
|tilstandsvurdering|Beskrivelse af en persontilstand |Condition.code.text|
|tilstandFagligtNotat|Beskrivelse af løbende status, der ikke ændrer på vurdering, og sværhedsgrad.|Condition.note.text|
|tilstandsoprettelsestid|tidsangivelse for hvornår tilstanden først blev oprettet i journalen|Condition.recordedDate|
|tilstandsafslutningstid|tidsangivelse for hvornår tilstanden er afsluttet. Med afsluttet menes at tilstanden ikke mere er et problem for borger.|Condition.abatementDateTime|
|tilstandsplanlagtOpfølgning|Kontakt, hvor det planlægges at følge op på tilstanden |Condition.extension:followUpEncounter|
|tilstandsårsag|Årsag til en persontilstand |Condition.extension:dueTo|
|tilstandssubjekt|Den borger som har tilstanden|Condition.subject|
|tilstandsansvarlig|Den fagperson, der bedømmer borgerns tilstand|Condition.asserter|
|tilstandsændringshistorie|Tidligere versioner af tilstanden, hvor der er sket klinisk relevante ændringer|Condition.extension:eventHistory|
|tilstandsevidens|Oplysning fra en udredning eller afklaring, der ligger til grund for denne tilstand, eller opfølgningsresultater, der er opfølgning på denne tilstand til forskellige tider.|Condition.evidence.detail|
|tilstandsfokus|Klasse der udtrykker, om en faggruppe har tilstanden i fokus for sine indsatser|Condition.category.coding|
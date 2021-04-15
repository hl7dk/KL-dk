### Scope and usage
KLCommonCareSocialFollowUp is used for documenting the result of a follow-up procedure, as documented by both FSIII and FFB. Follow-ups are documented using this profile, whether they are documented by suppliers during an intervention, or documented by autorities, at planned follow-ups.

The profile has a text-based follow-up results in Observation.valueCodeableConcept.text, and a structured Follow-up result in Observation.valueCodeableConcept.coding

The ObservationCode is mandatory, and fixed to a specific SNOMED CT code that signifies that this is an evaluation of a care plan (evaluering af indsats i bred forstand).

Note that this ressource may reference an Encounter. Use this opportunity only if the follow-up takes place in an actual meeting between a practitioner and citizen.

The focus of the follow-up can be documented in Observation.focus, so that it becomes explicite which conditions and interventions this follow-up result pertains to.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter, der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|opfølgningsresultatKode|Klasse, der udtrykker at der evalueres på den indsats der er igangsat.|Observation.code.coding|
|opfølgningsresultat|Tekst der udtrykker hvad resultatet af opfølgningen er.|Observation.valueCodeableConcept.text|
|opfølgningsresultatStruktureret|Struktureret resultat af en opfølgningen|Observation.valueCodeableConcept.coding|
|opfølgningsresultatSubjekt|Den borger, der er genstand for opfølgningen|Observation.subject|
|opfølgningsresultatKontakt|Den kontakt hvor opfølgningen er foretaget|Observation.encounter|
|opfølgningsresultatAnsvarlig|Den fagperson der har ansvaret for opfølgningen|Observation.performer|
|opfølgningsresultatTid|Det tidspunkt, hvor opfølgningen er foretaget|Observation.effectiveDateTime|
|opfølgningsresultatStatus|Kode der udtrykker, hvor i sin proces, opfølgningen er|Observation.status|
|opfølgningsresultatFokus|Den eller de tilstande og indsatser der er fokus for opfølgningen.|Observation.focus|
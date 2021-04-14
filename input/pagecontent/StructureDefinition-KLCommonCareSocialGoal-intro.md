### Scope and usage
In a Danish municipality setting, CommonCareSocialGoal is used to describe all the different kinds of goals and purposes defined by FSIII and FFB. Note that two specialized goal resources exist - use these for "FFB borgers mål og ønsker" og "Indsatsformål" if you want the CommonCareSocialCarePlan to work as intended.

The cateogory-attribute defines the different goals using the KLCommonGoalTypeCodes ValueSet. The goal-type often controls, which of the other attributes that are relevant to use. See more in the section "Bemærkninger vedr. eksempler"

The goal itself is described using Goal.target and/or Goal.description. The target may either be a severity related to functioning, or a changeValue. Goal.target.meassure may also be used to express the method by which a condition is evaluated without providing specific information about target.detail as described for "Indsatsmål" in FSIII (målmetode). The description may supplement the structured information and is used as primary description of the goal for categories that does not include structured data.

Goal.adresses has an extension (ConditionRank), which provide the means to prioritize the Conditions and MatterOfInterest that the goal addresses. The ConditionRank should be used in FFB to express the condition, which the goal primarily addresses (måltilstand), which is equivalent to rank 1. Other Condition or Information resources does not need to specify a rank. FFB only requires a Condition with rank 1 for "FFB Indsatsmål", relating more conditions and matterOfInteres ressources is optional.

The goal outcome attributes are expressed as required by "FFB Indsatsmål", with a note about outcome in Goal.outcomeCode.text, and the informer of that outcome stated in Goal.outcomeCode.extention:matterOfInterestInformer. Other than this, the goal outcome is often documented as a change in the condition. However, this is already handled by the Goal.adresses attribute. For reporting use cases, you just need to explicitely state at which points in time you need reporting of Goals and Conditions.

There may be several instanses of annotation stored in Goal.note.text, which describe how working with the goal progresses. Goal.note should be populated with a time and an author whenever relevant. Should not be confused with the Goal.description and Goal.outcomeCode.text.

Note that FFB, for some goals describe, whose goal it is. E.g. "borgers mål og ønsker" should be documented as described by the citizen. However, the Goal.expressedBy attribute should always be populated with the responsible practitioner. If describing the different roles of the documentation process in more detail is needed, use a Provanance resource and set the Goal as Provenance.target.

In Goal.extension:goalRelationship.type.text the string "based-on" define that the goal is based on another more overall goal. Goal.extension:goalRelationship.target references this overall goal. The relationship is used to link sub-goals (delmål) and intervention goals (indsatsmål) in FFB.

Goal.target.measure is used to express the type of observations, that should be performed to follow the goal, E.g. Pressure Ulcer Surface area observations, for goal related to curing an ulcer (FSIII målemetode). Goal.target.measure has a binding to an Observation ValueSet, which may be extended as needed. If possible, extend with observation codes fra SNOMED CT, and report the codes used to Local Government Denmark (KL).

The FHIR Goal ressource has a mandatory attribute Goal.lifecycleStatus with a binding to a status ValueSet. The whole ValueSet may be used, but you may constrain it, and only use "proposed" for all goals that are not yet active, "active" for active goals, and "completed" for all goals that are either reached or no longer being persued.

### Bemærkninger vedr. eksempler
Bemærk desuden at denne profil har et eksempel for hver type af mål:

* FSIII tilstandsmål (også kendt som forventet tilstand. Er kyttet til den tilstand der sættes mål for gennem Goal.adresses). Se: JudithForventetTilstand og MarkForventetTilstand
* FSIII indsatsmål (Det FSIII beskriver som udførers indsatsmål, ressourcen rummer også målemetode) Se: MarkIndsatsmaal
* FFB borgers mål og ønsker (Den overordnede beskrivelse der dokumenteres ifm. sagsåbning). Se: AndreasMaalOnsker
* Indsatsformål (Overordnet mål for en FFB social indsats, forventning om at den også kan anvendes for §140 forløb og §119 forløb). Se profilen KLCommonCareSocialPurpose - eksemplerne: AndreasIndsatsformaal og AndreasIndsatsformaal2
* FFB indsatsmål (FFB's mål med indsatsen, som relaterer sig til de tilstand der sættes mål for ifm en social indsats. Tilstandene relateres gennem Goal.adresses). Se profilen KLCommonCareSocialFFBGoal - eksempel: Andreasindsatsmaal
* FFB delmål (FFB's udfører mål) Se: AndreasDelmaal

### Conversions between Danish information model and FHIR-profile
Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter, der skal bruges til specifikation af indholdet.


{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|målkategori|Klasse, der udtrykker hvilket mål der er tale om.|Goal.category|
|målSværhedsgrad|En klasse, der udtrykker en tilstands mål for sværhedsgrad.|Goal.target[severitySlice]|
|måltype|En klasse der udtrykker, om målet er at indsatsen skal ændre eller fastholde en tilstand, og i hvilken grad.|Goal.target[changeValueSlice]|
|målbeskrivelse|Beskrivelse af hvad målet er.|Goal.description|
|målSubjekt|Den borger som målet er opstillet for.|Goal.subject|
|målAnsvarlig|Den fagperson der er ansvarlig for oprettelsen af målet|Goal.expressedBy|
|målrelateret|Den eller de Tilstande eller Oplysninger, der er relvant for målet.|Goal.addresses|
|målrelateretRang|Heltal, der udtrykker hvordan tilstanden er prioriteret, så der kan skelnes mellem primær tilstand og øvrige tilstande|Goal.addresses.extension:conditionRank|
|målnotat|Løbende notat, der fortæller hvordan det går med at arbejde med målet.|Goal.note.text|
|målvurdering|En beskrivelse af om målet er opfyldt.|Goal.outcomeCode.text|
|målvurderingsInformant|Klasse der udtrykker, hvem der har vurderet målet.|Goal.outcomeCode.extention:matterOfInterestInformer|
|målemetode|Den type af observationer der skal til for at følge med i dette mål.|Goal.target.measure|
|delmålBaseretPå|Det FFB indsatsmål, som et FFB delmål er baseret på.|Goal.extension:goalRelationship.target / Goal.extension:goalRelationship.type|
|målstatus|Status for målet|Goal.lifecycleStatus|































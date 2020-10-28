### Scope and usage
In a Danish municipality setting, CommonCareSocialGoal is used to describe all the different kinds of goals and purposes defined by FSIII and FFB. Note that two specialized goal resources exist - use these for "FFB livsmål" og "Indsatsformål" if you want the CommonCareSocialCarePlan to work as intended.

The cateogry-attribute defines the different goals using the KLCommonGoalTypeCodes ValueSet. The goal-type often controls which of the other attributes that are relevant to use.

The goal itself is described using Goal.target and/or Goal.description. The target may either be a severity related to functioning, or a changeValue. Goal.target.meassure may also be used to express the method by which a condition is evaluated without providing specific information about target.detail as described for "Indsatsmål" in FSIII (målmetode). The description may supplement the structured information and is used as primary description of the goal for categories that does not include structured data.

Goal.adresses has an extension (ConditionRank), which provide the means to prioritize the Conditions and Information that the goal addresses. The ConditionRank should be used in FFB to express which Condition that the goal primarily addresses (måltilstand), which is equivalent to rank 1. Other Condition or Information resources should have higher ranks (e.g. all others could have rank 2 or be ranked with increasing integers if that makes sense). FFB only requires a Condition with rank 1 for "FFB Indsatsmål", the rest is optional.

The goal outcome attributes are expressed as required by "FFB Indsatsmål", with an outcome severity in Goal.outcomeReference, and a note about outcome in Goal.outcome.code.text.

There may be several Goal.annotation instances, which describe how working with the goal progresses. Should not be confused with the Goal.description and Goal.outcome.code.text.

Note that FFB for some goals describe, whose goal it is. E.g. "Livsmål" should be documented as described by the citizen. However, the Goal.expressedBy attribute should always the populated with the responsible practitioner. If describing the different roles of the documentation process in more detail is needed, use a Provanance resource and set the Goal as Provenance.target.

The FHIR Goal ressource has a mandatory attribute Goal.lifecycleStatus with a binding to a status ValueSet. The whole ValueSet may be used, but you may reduce it, and only use "proposed" for all goals that are not yet active, "active" for active goals, and "completed" for all goals that are either reached or no longer being persued.

### Conversions between Danish information model and FHIR-profile
Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter, der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|målkategori|Den slags mål der er tale om.|Goal.category|
|målSværhedsgrad|En klasse, der udtrykker en tilstands mål for sværhedsgrad.|Goal.target.detail.coding.code|
|måltype|En klasse der udtrykker, om målet er at indsatsen skal ændre eller fastholde en tilstand, og i hvilken grad.|Goal.target.detail.coding.code|
|målbeskrivelse|Beskrivelse af hvad målet er.|Goal.description|
|målSubjekt|Den borger som målet er opstillet for.|Goal.subject|
|målAnsvarlig|Den fagperson der er ansvarlig for oprettelsen af målet|Goal.expressedBy|
|måltilstand|Den tilstand som målet er tilknyttet|Goal.adresses|
|målrelateret|Den eller de Tilstande eller Oplysninger, der ud over måltilstanden er relvante for målet.|Goal.adresses|
|målnotat|Løbende notat, der fortæller hvordan det går med at arbejde med målet.|Goal.annotation|
|målopfyldelse|Klasse der udtrykker hvordan det går med at opfylde målet.|Goal.outcomeReference|
|målresultat|En beskrivelse af om målet er opfyldt.|Goal.outcome.code.text|
|målemetode|Den type af observationer der skal til for at følge med i dette mål.|Goal.target.meassure|































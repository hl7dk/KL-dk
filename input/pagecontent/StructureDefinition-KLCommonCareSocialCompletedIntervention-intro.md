### Scope and usage
In a Danish municipality setting, CommonCareSocialCompletedIntervention is used to describe what activities has been delivered (e.g. a visit from a nurse to a citizen home where wound care is delivered). A CompletedIntervention always describes actual activities of one encounter. It should not be confused with PlannedIntervention, which describes the intention of activities, typically for several encounters.
The CompletedIntervention may point to the request-resource that authorized the intervention. This can be either a PlannedIntervention, where the municipality visitation has authorized the intervention or a ServiceRequest, if the request directly has initiated the intervention e.g. acute nurse care issued by a general practitioner. It should be blank for activities delivered without pre-authorization e.g. when a home care practitioner comes to clean the house but finds the citizen on the floor after a fall and helps with this.

Procedure.complication.coding should be set if the planned intervention has been delivered with some complication. If the complication code is set, the basedOn-attribute should point to the relevant PlannedIntervention OR the code attribute should be populated with a FSIII or FFB intervention code. The complication should be described in Procedure.complication.text.

Procedure.performedPeriod.start og Procedure.performedPeriod.end are only important if the time spend on one out of more interventions delivered in one encounter needs monitoring. E.g. one home care visit on the 20th of June with cleaning from 8:30-8:50 and help with food preparation from 8:50-9:00.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|leveretIndsatsstatus|Indikation af hvor i det kliniske forløb indsatsen er.|Procedure.status|
|leveretIndsatsAfvigelseskode|En klasse der, hvis den er til stede, angiver på hvilken måde indsatsen ikke er leveret i overensstemmelse med den PlanlagteIndsats.|Procedure.complication.coding|
|leveretIndsatsAfvigelsestekst|Beskrivelse af hvilken afvigelse der er ift. det planlagte|Procedure.complication.text|
|leveretIndsatsNotat|Beskrivelse af hvilken indsats der konkret er leveret.|Procedure.note.text|
|leveretIndsatsSubjekt|Den borger som indsatsen er leveret til.|Procedure.subject|
|leveretIndsatsDokumenterendeLeverandør|Den leverandør, som er ansvarlig for dokumentationen af den leverede indsats.|Procedure.recorder|
|leveretIndsatsKode|Klasse, der udtrykker hvad den leverede indsats omhandler.|Procedure.code.coding|
|leveretIndsatsbevilling|Den autorisation som leveringen er baseret på via en reference til den planlagte og bevilgede indsats eller en henvisning fra læge. Er kun fraværende når leverandøren leverer noget andet end det planlagte på eget initiativ.|Procedure.basedOn|
|leveretIndsatsKontakt|Den kontakt, hvor denne del af indsatsen leveres.|Procedure.encounter|
|leveretIndsatsStart|Starttidspunkt for levering af indsatsen.|Procedure.performedPeriod.start|
|leveretIndsatsSlut|Sluttidspunkt for levering af indsatsen.|Procedure.performedPeriod.end|






















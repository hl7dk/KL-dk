Profile:        KLCommonCareSocialServiceRequest
Parent:         ServiceRequest
Title:          "ServiceRequest"
Description:    "Referals/requests used in Danish municipalities"

* requester 1..1
* requester only Reference(Organization or KLCommonPractitioner) //organization used for people from the outside, KLCommonPractitioner for internal requests
* extension contains
    RequesterType named requesterType 0..1 and
    SubjectConsentToLiaising named subjectConsentToLiasing 0..1 and
    MunicipalityCaseNumber named officialmunicipalityCaseNumber 0..1 and
    MunicipalityCaseNumber named municipalitiSpecificCaseNumber 0..1

* extension[officialmunicipalityCaseNumber].valueIdentifier.use = #official
* extension[municipalitiSpecificCaseNumber].valueIdentifier.use = #usual

* code from KLServicesTypes
* orderDetail from KLInterventions
* subject only Reference(KLCommonCitizen)
* authoredOn 1..1
* reasonReference only Reference(KLCommonCareSocialFocusCondition or KLCommonCareSocialFollowUp) //kan måske slicies på "type" fordi der er hhv en observation og en condition

* requester ^short = "[DK] anledningAnsvarlig"
* extension[requesterType] ^short = "[DK] anledningFra"
* reasonCode.text ^short = "[DK] anledningsÅrsag"
* status ^short = "[DK] anledningsStatus"
* intent ^short = "[DK] anledningsHensigt"
* code.coding ^short = "[DK] anledningsIndsats"
* orderDetail.coding ^short = "[DK] anledningsAnmodetIndsats"
* subject ^short = "[DK] anledningsSubjekt"
* authoredOn ^short = "[DK] anledningstid"
* extension[subjectConsentToLiasing] ^short = "[DK] anledningBorgerIndforståetMed"
* reasonReference ^short = "[DK] Afhængig af datatype enten anledningsBegrundelse eller anledningsÅrsagsreference"
* extension[officialmunicipalityCaseNumber] ^short = "[DK] anledningDokumenteretISag"
* extension[municipalitiSpecificCaseNumber] ^short = "[DK] anledningDokumenteretISag"

Instance: HenvendelseFraMorVedrSocialIndsats
InstanceOf: KLCommonCareSocialServiceRequest
Title: "Henvendelse mor social indsats"
Description: "Henvendelse fra mor vedr. social indsats"
Usage: #example
* requester = Reference(SocialOgSundhedMorsoe)
* extension[requesterType].valueCodeableConcept = FSIII#A2 "Pårørende"
* extension[subjectConsentToLiasing].valueCodeableConcept = KLCommonCareSocialCodes#e67035da-9179-466b-99ad-ea86835d38c9 "indforstået"
* reasonCode.text = "Andreas er udviklingshæmmet og bor pt. hjemme hos sin mor. Moderen har fået svær gigt og har derfor ikke mulighed for at have ham boende længere, og Andreas ønsker derfor at komme i et botilbud."
* code = KLCommonCareSocialCodes#4a297733-4d66-4726-a933-590d55cf91e0 "Social indsats"
* orderDetail[0] = FFB#80aa8ea7-4ad8-405f-876a-4c0f89fde06a "Midlertidigt ophold"
* orderDetail[1] = FFB#638f44df-6bf2-47f8-9935-b8fdc83e5bf5 "Støtte til daglige opgaver i hjemmet"
* subject = Reference(Andreas)
* authoredOn = 2020-06-23
* status = REQUESTSTATUS#active
* intent = REQUESTINTENT#proposal
* reasonReference = Reference(AndreasMaalgruppeUdviklingshamning)

 Instance: HenvendelseFraMorVedrSocialIndsatsProvenance
 InstanceOf: Provenance
 Title: "Provenance, henvendelse mor social indsats"
 Description: "Ekstraoplysninger vedr. dokumentationsarbejdsgang og ansvar for henvendelse fra mor vedr. social indsats"
 Usage: #example
* target = Reference(HenvendelseFraMorVedrSocialIndsats)
* recorded = 2020-06-23T15:17:24+02:00
* agent[0].type = AGENTTYPE#author
* agent[0].who = Reference(BirteFraVisitationenMorsoe)
* agent[0].onBehalfOf = Reference(SocialOgSundhedMorsoe)
* agent[1].type = AGENTTYPE#informant
* agent[1].who = Reference(AndreasMor)
* reason = PROVENANCEREASON#TREAT

Instance: AndreasMor
InstanceOf: RelatedPerson
Title: "Andreas' Mor, Gitte Hansen"
Description: "Eksempel på pårørende Andreas' mor Gitte"
Usage: #example
* relationship.coding.code = #MTH
* relationship.coding.system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* name.given = "Gitte"
* name.family = "Hansen"
* patient = Reference(Andreas)

Instance: HenvisningFraLageVedrAkutSygepleje
InstanceOf: KLCommonCareSocialServiceRequest
Title: "Henvisning læge akut sygepleje"
Description: "Henvisning fra læge vedr. akut sygepleje"
Usage: #example
* requester = Reference(LaegerneHasserisBymidte)
* extension[requesterType].valueCodeableConcept = FSIII#A9 "Egen læge/vagtlæge"
* reasonCode.text = "Mark har efter et ildebefindende brug for at akutsygeplejen undersøger situationen og måler vitale værdier."
* code = KLCommonCareSocialCodes#490ab7be-ddb1-4a54-baf1-009fe6e8a83b "Hjemmesygepleje"
* orderDetail[0] = FSIII#G1.41 "Undersøgelser og måling af værdier"
* subject = Reference(Mark)
* authoredOn = 2020-06-21
* status = REQUESTSTATUS#active
* intent = REQUESTINTENT#order

Instance: HenvendelseVedrSygeplejeMark
InstanceOf: KLCommonCareSocialServiceRequest
Title: "Henvendelse vedr hjemmesygepleje"
Description: "Henvisning fra læge vedr. akut sygepleje"
Usage: #example
* requester = Reference(SundhedsforvaltningAalborg)
* extension[requesterType].valueCodeableConcept = FSIII#A1 "Borger"
* reasonCode.text = "Borger har henvendt sig pga. et sår, der skal undersøges nærmere."
* code = KLCommonCareSocialCodes#490ab7be-ddb1-4a54-baf1-009fe6e8a83b "Hjemmesygepleje"
* subject = Reference(Mark)
* authoredOn = 2020-06-21
* status = REQUESTSTATUS#active
* intent = REQUESTINTENT#proposal
* extension[officialmunicipalityCaseNumber].valueIdentifier.use = #official
* extension[officialmunicipalityCaseNumber].valueIdentifier.system = "https://data.gov.dk/id/organization"
* extension[officialmunicipalityCaseNumber].valueIdentifier.value = "524a66c5-d1b6-4cc4-adca-dad6d058a8f5"


Instance: HenvisningFraLageVedrAkutSygeplejeProvenance
InstanceOf: Provenance
Title: "Provenance, henvisning læge akut sygepleje"
 Description: "Ekstraoplysninger vedr. dokumentationsarbejdsgang og ansvar for henvisning fra læge vedr. akut sygepleje"
Usage: #example
* target = Reference(HenvisningFraLageVedrAkutSygepleje)
* recorded = 2020-06-21T15:56:24+02:00
* agent[0].type = AGENTTYPE#enterer
* agent[0].who = Reference(HanneFraVisitationenAalborg)
* agent[0].onBehalfOf = Reference(SundhedsforvaltningAalborg)
* agent[1].type = AGENTTYPE#legal
* agent[1].who = Reference(LaegerneHasserisBymidte)
* reason =  PROVENANCEREASON#TREAT

Instance: InternHenvendelseEfterOpfolgning
InstanceOf: KLCommonCareSocialServiceRequest
Title: "Intern henvendelse efter opfølgning"
Description: "Intern henvisning i hjemmeplejen, efter en opfølgning der viste behov for revisitation"
Usage: #example
* requester = Reference(HanneFraVisitationenAalborg)
* extension[requesterType].valueCodeableConcept = FSIII#A4 "Hjemmeplejen"
* reasonCode.text = "Sidste opfølgning på Marks hjemmepleje viste behov for revisitation fordi funktionsevnen er blevet bedre, særligt ift. mobilitet. Der skal ses på om nogle af §83 indsatserne, med fordel kan gøres til §83a for yderligere at styrke hverdags rehabiliteringsindsatsen og dermed borgers funktionsniveau."
* code = KLCommonCareSocialCodes#ad865929-7363-4b2d-a271-01993181fbaf "Hjemmepleje"
* orderDetail[0] = FSIII#H1.4 "Mobilitet"
* orderDetail[1] = FSIII#H2.2 "RH Hverdagens aktiviteter"
* subject = Reference(Mark)
* authoredOn = 2020-04-11
* status = REQUESTSTATUS#active
* intent = REQUESTINTENT#proposal
* reasonReference = Reference(MarkHjemmeplejeRevisitation)

Instance: InternHenvendelseEfterOpfolgningProvenance
InstanceOf: Provenance
Title: "Provenance til InternHenvendelseEfterOpfølgning"
Usage: #example
* target = Reference(InternHenvendelseEfterOpfolgning)
* recorded = 2020-04-11T09:06:15+02:00
* agent[0].type = AGENTTYPE#author
* agent[0].who = Reference(HanneFraVisitationenAalborg)
* agent[0].onBehalfOf = Reference(SundhedsforvaltningAalborg)
* reason =  PROVENANCEREASON#TREAT
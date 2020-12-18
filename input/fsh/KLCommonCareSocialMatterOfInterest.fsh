Profile:        KLCommonCareSocialMatterOfInterest
Parent:         Observation
Title:          "KLCommonCareSocialMatterOfInterest"
Description:    "Matter or area of interest in relation to the care of the citizen, as used in Danish municipalities (Oplysning/Område/Tema)"
* code from KLInformationCodes (required)
* value[x] only CodeableConcept
* valueCodeableConcept from KLSeveritiesFSIII
* subject only Reference(KLCommonCitizen)
* encounter only Reference(KLCommonCareSocialEncounter)

* performer 0..1
* performer only Reference(KLCommonPractitioner)
* basedOn 0..1 
* basedOn only Reference(KLCommonCareSocialServiceRequest)


* effective[x] 1..1
* effective[x] only dateTime

// * hasMember ^slicing.discriminator.type = #value
// * hasMember ^slicing.discriminator.path = "resolve().code" /*this is sliced by the code value of the target of the reference 
//                                                             there is a small risk that a self-reference to a home care area will pass the validator. 
//                                                             The alternative is to slice by profile, but this is said to take up a lot of computational power*/ 
// * hasMember ^slicing.rules = #open
// * hasMember ^slicing.ordered = false   // can be omitted, since false is the default
// * hasMember ^slicing.description = "Slice based on the code of the Observation, which is referenced"  // optional - does not appear

// //Declaring the slices, and their cardinalities, 
// * hasMember contains 
//     InformationSeverity 0..1

//* hasMember[InformationSeverity] only Reference(KLCommonCareSocialInformationSeverity)

* extension contains
   MatterOfInterestInformer named matterOfInterestInformer 0..1

* code ^short = "[DK] oplysningskode"
* valueCodeableConcept.text ^short = "[DK] oplysningstekst"
* valueCodeableConcept.coding ^short = "[DK] oplysningssværhedsgrad"
* subject ^short = "[DK] oplysningssubjekt"
* encounter ^short = "[DK] oplysningskontakt"
* performer ^short = "[DK] oplysningsansvarlig"
* basedOn ^short = "[DK] oplysningsordre"
* effectiveDateTime ^short = "[DK] oplysningstid"
* extension[matterOfInterestInformer] ^short = "[DK] oplysningsinformant"
* status ^short = "[DK] oplysningsstatus"


Instance: MobilityInformationJudith
InstanceOf: KLCommonCareSocialMatterOfInterest
Title: "MobilityInformationJudith"
Description: "Judith's mobility"
Usage: #example
* subject = Reference(Judith)
* code.coding.code = #J3
* code.coding.system = FSIII
* code.coding.display = "Mobilitet"
* effectiveDateTime = 2020-08-11T15:28:17-01:00
* valueCodeableConcept.text = "Judith har faldtendens, men er meget dedikeret ift. at lære at bruge sin rollator indendørs og udendørs, og desuden går hun en tur på 30min hver dag"
* valueCodeableConcept.coding = FSIII#B3
* performer = Reference(HanneFraVisitationenAalborg)
* status = #final

Instance: RespirationCirculationInformationMark
InstanceOf: KLCommonCareSocialMatterOfInterest
Title: "RespirationCirculationInformationMark"
Description: "Respiration and circulation for Mark"
Usage: #example
* subject = Reference(Mark)
* code.coding.code = #I7
* code.coding.system = FSIII
* code.coding.display = "Respiration og cirkulation"
* effectiveDateTime = 2020-06-05
* valueCodeableConcept.text = "Mark har tendens til hævede fødder og ben, så der er et potentielt problem med cirkulationen, som kan forvære Mark's tryksår"
* performer = Reference(HanneFraVisitationenAalborg)
* status = #final

Instance: SkinInformationMark
InstanceOf: KLCommonCareSocialMatterOfInterest
Title: "SkinInformationMark"
Description: "Skin information for Mark"
Usage: #example
* subject = Reference(Mark)
* code.coding.code = #I4
* code.coding.system = FSIII
* code.coding.display = "Hud og slimhinder"
* effectiveDateTime = 2020-06-05
* valueCodeableConcept.text = "Tryksår konstateret, ellers er Marks hud fin"
* performer = Reference(HanneFraVisitationenAalborg)
* status = #final

Instance: MentalInformationMads
InstanceOf: KLCommonCareSocialMatterOfInterest
Title: "MentalInformationMads"
Description: "Mads' mentale funktioner, borger"
Usage: #example
* subject = Reference(Mads)
* code.coding.code = #25c5c614-305f-46cd-9891-55d564fc30cf
* code.coding.system = FFB
* code.coding.display = "Mentale funktioner"
* effectiveDateTime = 2020-12-12T13:16:19-04:00
* valueCodeableConcept.text = "Besøg hos Mads, hvor hans mor, Malene, deltager, 3.
september 20xx: Mads fortæller, at han har svært ved at holde orden og have styr
på sine ting. Han vil gerne have noget af ”det der struktur”. Han
fortæller, at han bliver meget gal, når han bliver presset og ikke
kan overskue, det han skal. Så får han ondt bag i hovedet, og det
er som om, han ikke kan tænke. Det kan også ske, hvis andre ikke
behandler ham ordentligt eller ikke forstår ham"
* status = #final
* extension[matterOfInterestInformer].valueCodeableConcept = FFB#25b4e705-2e9a-47a2-b11a-c829316b9d3a
* performer = Reference(KristinaFraVoksensocialomraadet)

Instance: MentalInformationMadsOthers
InstanceOf: KLCommonCareSocialMatterOfInterest
Title: "MentalInformationMadsOthers"
Description: "Mads' mentale funktioner, oplyst af andre"
Usage: #example
* subject = Reference(Mads)
* code.coding.code = #25c5c614-305f-46cd-9891-55d564fc30cf
* code.coding.system = FFB
* code.coding.display = "Mentale funktioner"
* effectiveDateTime = 2020-12-12T13:16:19-04:00
* valueCodeableConcept.text = "Besøg hos Mads, hvor hans mor, Malene, deltager, 3.
september 20xx: Mads’ mor fortæller, at det altid har været nødvendigt at forberede
Mads i god tid, hvis der skulle ske noget ud over det sædvanlige.
Ligesom det har været nødvendigt at give tid til at omstille sig til at
skulle stoppe med en aktivitet og gå i gang med en anden.
Hun fortæller, at Mads kan koncentrere sig og har tendens til at
nørde, når han er særligt optaget af et emne, fx dinosaurer eller et
computerspil. Når Mads er usikker eller synes, at noget er svært,
er det en udfordring for ham at komme i gang og at fastholde sin
opmærksomhed.
Han tager ikke selv initiativ til at stå op, rydde op eller tage bad.
Det skal han mindes om, og da han var mindre, havde han stor
glæde af en liste over, hvad han skulle om morgenen, som hang
på køleskabet. Han kan godt lide, når tingene forgår i en fast
rækkefølge og er kendte. Mads’ mor kan også genkende Mads’
beskrivelse af, hvordan han får det, når han ikke kan overskue ting.
Han kan godt få nogle meget voldsomme raseriudbrud og smadre
døre og møbler.
Journal fra speciallæge XX, august 20xx: Obj.: Vågen og bevidsthedsklar. Ingen motorisk uro. Der ses tics i
ansigt og skulder, men ingen verbale tics. […] Svarer relevant på
spørgsmål og virker åben og ærlig. […] Skønnes normalbegavet med
en samlet IQ på 110. […] God formel kontakt. God øjenkontakt.
Normal mimik og gestus.
Sub.: Mads har store eksekutive vanskeligheder. Han har svært ved
skift og forandringer, har svært ved at afpasse tiden til aktiviteter.
Han er rigid og afhængig af ydre struktur. […] I samvær med andre
er der normale formelle kontaktevner, men Mads tager tingene
personligt og bogstaveligt. Forstår ironi og underforståethed,
men bliver ensporet ved mange stimuli. […] Der er lette problemer
med vedholdende opmærksomhed og afledning, men ingen
impulsivitet eller hyperaktivitet. […] Følelsesmæssigt bliver Mads
udadreagerende, når han er vred. Vreden udløses af naturlige
årsager, men han kan ikke rumme vreden, og reaktionerne er
overdrevne. […] Der ses ikke øvrige symptomer på angst, OCD,
depression eller psykose."
* status = #final
* extension[matterOfInterestInformer].valueCodeableConcept = FFB#63338442-7b2e-405b-acc0-142361ef19f1
* performer = Reference(KristinaFraVoksensocialomraadet)
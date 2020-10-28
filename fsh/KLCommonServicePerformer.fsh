Profile: KLCommonServicePerformer
Parent: CareTeam
Title: "CommonServicePerformer"
Description:    "Service performing CareTeam as expressed by Danish municipalities."

* category from KLServiceCodesFFB
* managingOrganization only Reference(KLCommonOrganization)

Instance: MidlertidigtOpholdBotilbuddetHvidbjerghus
InstanceOf: KLCommonServicePerformer
Usage: #example
Title: "MidlertidigtOpholdBotilbuddetHvidbjerghus"
Description: "Midlertidigt ophold efter servicelovens §107 på Hvidhjerghus"
* category = FFB#25de7444-3919-4dab-b844-8cec6c15f30e "Midlertidigt botilbud til voksne"
* managingOrganization = Reference(BotilbudetHvidbjerghus)

Instance: AlmBotilbud
InstanceOf: KLCommonServicePerformer
* category.coding.code = #498fe92c-d7f7-41cd-9404-5b38fe113be0          
* category.coding.display = "Almindeligt længerevarende botilbud til voksne"
* category.coding.system = "urn:oid:1.2.208.176.2.22"
* managingOrganization = Reference(Sommergården)

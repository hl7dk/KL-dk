### Background
This is the FKI FHIR implementation guide. FKI stands for "Fælleskommunal InformationsModel" in english "Common Municipality Information Model". The FKI FHIR profiles can be used to exchange and report health care and social care data from Danish municipalities. 

The health and care related data is a result of rutine documentation in home care nursing, home care, health promotion and prevention and physical rehabilitation. The documentation practise follows [FSIII](http://fs3.nu/).

Social care data results from rutine documentation in the area of adult social care. The documentation practise follows [VUM](https://socialstyrelsen.dk/udgivelser/metodehandbog-til-vum-2.0/) and [FFB](https://www.kl.dk/kommunale-opgaver/socialomraadet/faelles-faglige-begreber/materialer/)  

### FKI is a core model
FKI is a core model, which means that it is the recommended way to encapsulate the above menitioned data, but it does no in itself specify use cases. FKI has so far been used for two use cases:
* Reporting of municipality data to KLGateway, which is e.g. used for management information and national statistics. [Implementation guide KLGateway](http://build.fhir.org/ig/hl7dk/kl-gateway/)
* Structuring documentation tools, meassurements and observations commonly used in Danish municipalities. [Implementation guide for FFinst](http://build.fhir.org/ig/hl7dk/KL-dk-tools/branches/main/)

### Documentation in Danish
The documentation of the FHIR profiles is also available in a Danish edition for non-FHIR users. This edition is called [FKI Lægmandsforklaringen](./LaegmandsforklaringAlleModellerV0.1.pdf)

The HL7 FHIR-profiles are based on information modelling work done according to a common municipality architectural framework (Fælleskommunal rammearkitektur). The link is comming as soon as possible.

### Getting started
To get a comprehesion of the content included in FKI, and the way it may be combined to form meaningfull collections of information, starter-examples have been created.  

* Home care service requests and information gathering (Sagsåbning og sagsoplysning) in the home care area have been illustrated using the Judith-example.
* The difference between regular and acute home nursing including planning and carrying out interventions, and the use of the Encounter-profile have been illustrated in the Mark-example
* Adult social care information gathering and intervention planning is illustrated using the Andreas-example.
* Adult social care information gathering is also illustrated in the Mads-example. Here the focus is on illustrating how to make the finding informer explicite as required by FFB.

#### Judith example
* Judith is a citizen [KLCommonCareSocialMatterOfInterest](StructureDefinition-KLCommonCareSocialMatterOfInterest.html)


### Overview

### Versioning and change management

#### This implementation guide
This implementation guide is regularily updated, and stable versions published on simplifier.net via MedCom. Note that FSIII and FFB Code systems are included as copies in the implementation guide. This reults in a very simplistic versioning mechanism i.e. any time changes occur in either the model or municipality terminologies, a new version will be made available. The package number has three levels.
* First level updates are made when new areas of documentation are added to the model, which requires new community reviews of the model
* Second level updates are any updates that adds or removes content from either model or terminology.
* Third level updates are updates that only relates to naming and communication, which means that the FHIR validator will not have errors running on another minor version, than the current (except for som warnings if coding.displays' are changed)

#### Instance level
When implementing use cases exploiting the profiles in this implementation guide, there may be a need to keep track of temporal development in data. Without knowing the specific use cases and implementation paradigm, unambigious guidance about change management cannot be given. However, general guideance is available [here](./changeManagementFSIII_FFB) in Danish.



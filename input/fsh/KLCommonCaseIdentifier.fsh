Profile: KLCommonOfficialCaseIdentifier
Parent: Identifier
Title: "OfficialCaseIdentifier"
Description: "This structure holds official KL Case Identifiers"
* use = #official
* system = "https://data.gov.dk/id/organization"


Profile: KLCommonMunicipalitySpecificCaseIdentifier
Parent: Identifier
Title: "MunicipalitySpecificCaseIdentifier"
Description: "This structure holds Municipality specific KL Case Identifiers (kommunale sagsnumre)"
* use = #usual
* assigner 1..1
* assigner only Reference(KLCommonOrganization)
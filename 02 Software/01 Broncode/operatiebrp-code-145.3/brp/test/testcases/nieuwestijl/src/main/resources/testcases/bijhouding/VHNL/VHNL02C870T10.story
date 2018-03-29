Meta:
@auteur                 jozon
@status                 Klaar
@sleutelwoorden         Foutief
@regels                 R2229
@usecase                UCS-BY.HG

Narrative:
R2229 Voorvoegsel en scheidingsteken in Naamgebruik of beide ingevuld of beide niet

Scenario: Voorvoegsel niet gevuld scheidingsteken wel
          LT: VHNL02C870T10

Given alle personen zijn verwijderd

Given enkel initiele vulling uit bestand /LO3PL/VHNL02_reg_gesl_nm-Libby.xls
Given enkel initiele vulling uit bestand /LO3PL/VHNL02_reg_gesl_nm-Piet.xls

When voer een bijhouding uit VHNL02C870T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding/VHNL/expected/VHNL02C870T10.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

Then is in de database de persoon met bsn 690020041 niet als PARTNER betrokken bij een HUWELIJK
Then is in de database de persoon met bsn 373230217 niet als PARTNER betrokken bij een HUWELIJK
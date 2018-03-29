Meta:
@auteur                 jozon
@status                 Klaar
@regels                 R1872
@sleutelwoorden         voltrekkingHuwelijkInNederland, VHNL02C370T40, Prevalidatie
@usecase                UCS-BY.HG

Narrative:
R1872 Huwelijk en geregistreerd partnerschap, voltrekking huwelijk in Nederland, actie registratieAanvangHuwelijkGeregistreerdPartnerschap

Scenario: R1872 Datum aanvang relatie mag niet in de toekomst liggen
          LT: VHNL02C370T40




Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL/Libby.xls

When voer een bijhouding uit VHNL02C370T40.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding/VHNL/expected/VHNL02C370T40.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

Then is in de database de persoon met bsn 422531881 niet als PARTNER betrokken bij een HUWELIJK

Then lees persoon met anummer 1868196961 uit database en vergelijk met expected VHNL02C370T40-persoon1.xml





Meta:
@status                 Klaar
@usecase                BY.1.MR

Narrative:
Maak bijhoudingsresultaatbericht

Scenario: Hoogste meldingsniveau Fout Verwerking foutief
          LT: MBRB01C10T120



Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-MBRB/MBRB01C10T110-Karin_kind.xls
Given enkel initiele vulling uit bestand /LO3PL-MBRB/MBRB01C10T110-Kind.xls

Given Pseudo-persoon 4318183457 is vervangen door ingeschreven persoon 6848125217

When voer een bijhouding uit MBRB01C10T120.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding/MBRB/expected/MBRB01C10T120.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R



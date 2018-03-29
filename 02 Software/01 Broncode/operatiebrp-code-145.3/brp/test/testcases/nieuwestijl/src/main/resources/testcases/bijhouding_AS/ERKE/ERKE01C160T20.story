Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1726 Geslachtsnaam Nederlands kind moet overeenkomen met ouder

Scenario:   Geslachtsnaam niet NL Kind komt niet overeen
            LT: ERKE01C160T20

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-ERKE/ERKE01C160T20-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-ERKE/ERKE01C160T20-002.xls

Then heeft $OUWKIG_BSN$ de waarde van de volgende query: select bsn from kern.pers where voornamen = 'Marie'
Then heeft $NOUWKIG_BSN$ de waarde van de volgende query: select bsn from kern.pers where voornamen = 'Henk'

!-- Geboorte niet-Nederlands kind
When voer een bijhouding uit ERKE01C160T20a.xml namens partij 'Gemeente BRP 1'
Then heeft het antwoordbericht verwerking Geslaagd

Then heeft $RELATIE_ID$ de waarde van de volgende query: select r.id from kern.betr b join kern.relatie r on r.id = b.relatie join kern.pers p on b.pers = p.id where p.datgeboorte = '20160101' and r.srt=3
Then heeft $KIND_BETROKKENHEID$ de waarde van de volgende query: select b.id from kern.betr b join kern.relatie r on r.id = b.relatie join kern.pers p on b.pers = p.id where p.datgeboorte = '20160101' and r.srt=3

!-- Erkenning kind met wijziging geslachtsnaam
When voer een bijhouding uit ERKE01C160T20b.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_AS/ERKE/expected/ERKE01C160T20.xml voor expressie //brp:bhg_afsRegistreerErkenning_R
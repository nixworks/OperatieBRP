Meta:
@status                 Klaar
@sleutelwoorden         WPHW04C10T10

Narrative:
Als BRP wil ik valideren dat een bijhouding van het type Wijzigen partnergegevens GP identificatienummers,
samengestelde naam, geboorte en geslachtsaanduiding
correct geleverd wordt aan afnemers van het BRP.

Scenario: 0. Persoonsbeeld Init vulling
Given leveringsautorisatie uit  autorisatie/autorisatiealles
Given persoonsbeelden uit BIJHOUDING:WPHW04C10T10/de_partner_is_een_ingeschrevene_en_ident/dbstate001

Given verzoek geef details persoon:
|key|value
|leveringsautorisatieNaam|'autorisatiealles'
|zendendePartijNaam|'Gemeente Utrecht'
|bsn|563420777

Then heeft het antwoordbericht verwerking Geslaagd


Scenario: 1. Administratieve handeling van type samengestelde naam, geboorte en geslachtsaanduiding van partner worden gewijzigd
          LT: WPHW04C10T10
          Wijzigen partnergegevens huwelijk identificatienummers, samengestelde naam, geboorte en geslachtsaanduiding


Given leveringsautorisatie uit  autorisatie/autorisatiealles,
                                autorisatie/Attendering_Mutatielevering_afnemerindicatie


Given persoonsbeelden uit BIJHOUDING:WPHW04C10T10/de_partner_is_een_ingeschrevene_en_ident/dbstate003

When voor persoon 563420777 wordt de laatste handeling geleverd
When het mutatiebericht voor partij Gemeente Utrecht en leveringsautorisatie autorisatiealles is ontvangen en wordt bekeken
Then is het synchronisatiebericht gelijk aan expecteds/mutatiebericht_scenario1.xml voor expressie //brp:lvg_synVerwerkPersoon

When het volledigbericht voor partij Gemeente Utrecht en leveringsautorisatie Attendering met plaatsing en expressies is ontvangen en wordt bekeken
Then is het synchronisatiebericht gelijk aan expecteds/Volledigbericht_scenario1_aut_Attendering_mutlevering.xml voor expressie //brp:lvg_synVerwerkPersoon

SELECT * FROM autaut.his_bijhautorisatiesrtadmhnd hba JOIN autaut.bijhautorisatiesrtadmhnd ba ON hba.bijhautorisatiesrtadmhnd = ba.id JOIN autaut.bijhautorisatie b ON ba.bijhautorisatie = b.id JOIN kern.srtadmhnd s ON s.id = ba.srtadmhnd WHERE b.naam = 'Test Bijhoudingsautorisatie' AND s.naam = 'Geboorte in Nederland met erkenning na geboortedatum' AND extract(EPOCH FROM localtimestamp-tsreg)/3600 < 1;
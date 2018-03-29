Meta:
@status                 Klaar
@usecase                UCS-BY.0.VA

Narrative: Nevenactie Registratie verstrekkingsbeperking

Scenario:   Specifieke verstrekkingsbeperking , daarna Volledige vertrekkingsbeperking waardoor de Specifieke wordt beeindigd
            LT: VZIG04C20T50

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-VZIG/VZIG04C20T50-001.xls

When voer een bijhouding uit VZIG04C20T50a.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/VZIG/expected/VZIG04C20T50a.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R

Then in kern heeft SELECT COUNT(id) FROM kern.admhnd de volgende gegevens:
| veld                      | waarde |
| count                     | 2      |

When voer een bijhouding uit VZIG04C20T50b.xml namens partij 'Gemeente BRP 2'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/VZIG/expected/VZIG04C20T50b.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R

Then in kern heeft SELECT COUNT(id) FROM kern.admhnd de volgende gegevens:
| veld                      | waarde |
| count                     | 3      |

Then in kern heeft select count(1) from kern.his_persverstrbeperking v where v.actieinh is not null and v.tsreg is not null and  v.tsverval is not null and v.actieverval is not null de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then in kern heeft select count(1) from kern.persverstrbeperking v where v.partij is null and v.omsderde ='Carnavalsvereniging' and v.gemverordening ='27017' de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then in kern heeft select count(1) from kern.persverstrbeperking de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then in kern heeft select count(1) from kern.his_persverstrbeperking de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then in kern heeft select count(1) from kern.his_persindicatie v where v.actieinh is not null and v.tsreg is not null and  v.tsverval is null and v.actieverval is null and v.waarde ='true' de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then in kern heeft select count(1) from kern.persindicatie v where v.srt ='3' and v.waarde ='true' and v.indag ='true' de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then in kern heeft select count(1) from kern.his_persindicatie de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then in kern heeft select count(1) from kern.persindicatie de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |

Then lees persoon met anummer 7409364769 uit database en vergelijk met expected VZIG04C20T50-persoon1.xml
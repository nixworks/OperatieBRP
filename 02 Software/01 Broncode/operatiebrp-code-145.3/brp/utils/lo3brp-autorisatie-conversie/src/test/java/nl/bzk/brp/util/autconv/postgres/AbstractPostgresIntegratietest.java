/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.util.autconv.postgres;

import javax.inject.Inject;
import nl.bzk.brp.util.autconv.lo3naarbrp.Converteerder;
import org.junit.Assert;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;


@Rollback(value = false)
@ContextConfiguration(classes = AbstractPostgresIntegratietest.Configuratie.class)
public abstract class AbstractPostgresIntegratietest extends AbstractPostgresDataAccessTest {

    static {
        System.setProperty("brp.afleverpunt", "mijnuri");
        System.setProperty("spring.profiles.active", "copy");
    }

    @Inject
    private Converteerder converteerder;

    protected final Converteerder getConverteerder() {
        return converteerder;
    }

    protected final JdbcTemplate queryBuilder() {
        return new JdbcTemplate(getDataSource());
    }

    protected void assertAantalAutorisaties(int aantalBRP, int aantalGBA) {
        Assert.assertTrue(queryBuilder().queryForObject(
                "select count(*) from autaut.levsautorisatie where stelsel = 1", Integer.class) == aantalBRP);
        Assert.assertTrue(queryBuilder().queryForObject(
                "select count(*) from autaut.levsautorisatie where stelsel = 2", Integer.class) == aantalGBA);
    }

    @Configuration
    @Import(DataAccessTestConfiguratie.class)
    @ImportResource(value =  {"classpath:test-conversie-context.xml"} )
    public static class Configuratie {
    }
}
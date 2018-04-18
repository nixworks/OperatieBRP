/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.migratiebrp.test.isc.environment.kanaal.jms;

import javax.inject.Inject;
import javax.inject.Named;
import javax.jms.Destination;

import nl.bzk.migratiebrp.test.isc.environment.kanaal.LazyLoadingKanaal;

/**
 * VOISC Verzenden DLQ.
 */
public class VoiscVerzendenDlqKanaal extends LazyLoadingKanaal {

    /**
     * Kanaal naam.
     */
    public static final String KANAAL = "voisc_verzenden_dlq";

    /**
     * Constructor.
     */
    public VoiscVerzendenDlqKanaal() {
        super(new Worker(),
                new Configuration(
                        "classpath:configuratie.xml",
                        "classpath:infra-jms-isc.xml",
                        "classpath:infra-queues-isc-voisc.xml",
                        "classpath:infra-jmx-routering.xml"));
    }

    /**
     * Verwerker.
     */
    public static final class Worker extends AbstractIscQueueKanaal {
        @Inject
        @Named("voiscVerzendenDlqQueue")
        private Destination destination;

        @Override
        public String getKanaal() {
            return KANAAL;
        }

        @Override
        public Destination getUitgaandDestination() {
            return destination;
        }

        @Override
        public Destination getInkomendDestination() {
            return destination;
        }
    }

}
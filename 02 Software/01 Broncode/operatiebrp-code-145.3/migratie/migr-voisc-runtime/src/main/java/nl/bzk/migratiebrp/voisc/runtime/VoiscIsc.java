/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.migratiebrp.voisc.runtime;

import java.util.List;
import java.util.function.Consumer;
import nl.bzk.migratiebrp.voisc.database.entities.Bericht;

/**
 * VOISC ISC operaties.
 */
public interface VoiscIsc extends Consumer<List<Bericht>> {

    /**
     * Verstuur berichten naar ISC.
     * @param messagesToSend berichten
     */
    @Override
    void accept(List<Bericht> messagesToSend);
}
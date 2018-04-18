/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.migratiebrp.synchronisatie.dal.service.impl.delta.transformeer;

import nl.bzk.algemeenbrp.dal.domein.brp.entity.BRPActie;
import nl.bzk.migratiebrp.synchronisatie.dal.service.impl.delta.DeltaBepalingContext;
import nl.bzk.migratiebrp.synchronisatie.dal.service.impl.delta.VerschilGroep;

import java.util.ArrayList;

/**
 * Deze situatie herkent een gewijzigde rij waarbij tsverval, actie verval gevuld wordt en aand. verval leeg blijft. In
 * dit geval wordt GAAV gevuld zodat deze rij aan de nieuwe administratieve handeling hangt.
 */
public final class TransformatieDw011 extends AbstractTransformatie {

    private static final int VERWACHT_AANTAL_WIJZIGINGEN = 2;

    @Override
    public boolean accept(final VerschilGroep verschillen) {
        return isWijzigingOpFormeleHistorie(verschillen) && zijnHetVerwachtAantalVeldenGevuld(verschillen, VERWACHT_AANTAL_WIJZIGINGEN)
                && zijnVerwachteVervalVeldenGevuld(new ArrayList<>(verschillen.getVerschillen()), false);
    }

    @Override
    public VerschilGroep execute(
            final VerschilGroep verschilGroep,
            final BRPActie actieVervalTbvLeveringMuts,
            final DeltaBepalingContext deltaBepalingContext) {
        return voegActieVervalTbvLeveringMutatiesToeAanVerschilGroep(verschilGroep, actieVervalTbvLeveringMuts);
    }

    @Override
    public DeltaWijziging getDeltaWijziging() {
        return DeltaWijziging.DW_011;
    }

}
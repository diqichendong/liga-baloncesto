/*
 * ComparadorClasificacion
 */
package controlador;

import java.util.Comparator;
import modelo.entidades.Equipo;

/**
 *
 * @author Di Qi
 */
public class ComparadorClasificacion implements Comparator<Equipo> {
    @Override
    public int compare(Equipo e1, Equipo e2) {
        int res = 0;
        int puntos1 = e1.getPuntosClasificacion();
        int puntos2 = e2.getPuntosClasificacion();
        
        if (puntos1 == puntos2) {
                if (e1.getPuntosAnotados() - e1.getPuntosEncajados() > 
                        e2.getPuntosAnotados() - e2.getPuntosEncajados()) {
                    res = -1;
                } else {
                    res = 1;
                }
            } else {
                res = e2.getPuntosClasificacion() - e1.getPuntosClasificacion();
            }
        
        return res;
    }
}

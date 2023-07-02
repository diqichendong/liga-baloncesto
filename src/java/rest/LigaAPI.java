/*
 * Clase LigaAPI
 */
package rest;

import controlador.ComparadorClasificacion;
import java.util.Collections;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import modelo.dao.LigaJpaController;
import modelo.entidades.Liga;

/**
 *
 * @author Di Qi
 */
@Path("liga")
@Produces(MediaType.APPLICATION_JSON)
public class LigaAPI {
    @GET
    public Response ligas() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        LigaJpaController ljc = new LigaJpaController(emf);
        List<Liga> ligas = ljc.findLigaEntities();
        return Response.ok(ligas, MediaType.APPLICATION_JSON).build();
    }

    @GET
    @Path("/{nombre}")
    public Response clasificacion(@PathParam("nombre") String nombre) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        LigaJpaController ljc = new LigaJpaController(emf);
        Liga l = null;
        for (Liga liga : ljc.findLigaEntities()) {
            if (liga.getNombre().equals(nombre)) {
                l = liga;
                Collections.sort(l.getEquipos(), new ComparadorClasificacion());
                break;
            }
        }

        return Response.ok(l.getEquipos()).build();
    }
}

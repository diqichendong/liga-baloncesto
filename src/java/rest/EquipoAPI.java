/*
 * API REST EquipoAPI
 */
package rest;

import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import modelo.dao.EquipoJpaController;
import modelo.entidades.Equipo;

/**
 *
 * @author Di Qi
 */
@Path("equipo")
@Produces(MediaType.APPLICATION_JSON)
public class EquipoAPI {

    @GET
    public Response equipos() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        EquipoJpaController ejc = new EquipoJpaController(emf);
        List<Equipo> equipos = ejc.findEquipoEntities();
        return Response.status(200).entity(equipos.toArray()).build();
    }

    @GET
    @Path("/{nombre}")
    public Response equipoNombre(@PathParam("nombre") String nombre) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        EquipoJpaController ejc = new EquipoJpaController(emf);
        Equipo e = null;
        for (Equipo equipo : ejc.findEquipoEntities()) {
            if (equipo.getNombre().equals(nombre)) {
                e = equipo;
                break;
            }
        }

        return Response.ok(e).build();
    }
}

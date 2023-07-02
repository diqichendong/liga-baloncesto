/*
 * Modelo Entidad Equipo
 */
package modelo.entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManagerFactory;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Persistence;
import modelo.dao.LigaJpaController;

/**
 *
 * @author Di Qi
 */
@Entity(name = "equipos")
public class Equipo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Devuelve el número de partidos que ha jugado.
     *
     * @return Partidos jugados
     */
    public int getPartidosJugados() {
        return this.getListaPartidosJugados().size();
    }

    /**
     * Devuelve el número de partidos que ha ganado.
     *
     * @return Partidos ganados
     */
    public int getPartidosGanados() {
        int res = 0;
        for (Partido partido : this.getListaPartidosJugados()) {
            if ((partido.getLocal().equals(this) && partido.getPuntosLocal() > partido.getPuntosVisitante())
                    || (partido.getVisitante().equals(this) && partido.getPuntosVisitante() > partido.getPuntosLocal())) {
                res++;
            }
        }
        return res;
    }

    /**
     * Devuelve el número de partidos que ha perdido.
     *
     * @return Partidos perdidos
     */
    public int getPartidosPerdidos() {
        return getPartidosJugados() - getPartidosGanados();
    }
    
    /**
     * Devuelve los puntos conseguidos para la clasificación.
     * @return Puntos de clasificación
     */
    public int getPuntosClasificacion() {
        return 2 * this.getPartidosGanados() + this.getPartidosPerdidos();
    }
    
    /**
     * Devuelve el total de los puntos anotados
     * @return Puntos anotados
     */
    public int getPuntosAnotados() {
        int res = 0;
        for (Partido partido : this.getListaPartidosJugados()) {
            if (partido.getLocal().equals(this)) {
                res += partido.getPuntosLocal();
            }
            if (partido.getVisitante().equals(this)) {
                res += partido.getPuntosVisitante();
            }
        }
        return res;
    }
    
    /**
     * Devuelve el total de los puntos encajados
     * @return Puntos encajados
     */
    public int getPuntosEncajados() {
        int res = 0;
        for (Partido partido : this.getListaPartidosJugados()) {
            if (partido.getLocal().equals(this)) {
                res += partido.getPuntosVisitante();
            }
            if (partido.getVisitante().equals(this)) {
                res += partido.getPuntosLocal();
            }
        }
        return res;
    }

    /**
     * Devuelve la lista todos sus partidos
     *
     * @return Lista de todos los partidos
     */
    private List<Partido> getPartidos() {
        List<Partido> res = new ArrayList();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        LigaJpaController ljc = new LigaJpaController(emf);
        for (Liga liga : ljc.findLigaEntities()) {
            if (liga.getEquipos().contains(this)) {
                for (Jornada jornada : liga.getJornadas()) {
                    for (Partido partido : jornada.getPartidos()) {
                        res.add(partido);
                    }
                }
            }
        }
        return res;
    }
    
    /**
     * Devuelve una lista de los partidos que se han jugado ya
     * @return Lista de los partidos jugados
     */
    public List<Partido> getListaPartidosJugados() {
        List<Partido> res = new ArrayList();
        for (Partido partido : this.getPartidos()) {
            if ((partido.getLocal().equals(this) && partido.getPuntosLocal() > 0)
                    || (partido.getVisitante().equals(this) && partido.getPuntosVisitante() > 0)) {
                res.add(partido);
            }
        }
        return res;
    }
    
    /**
     * Devuelve el porcentaje de victorias del equipo
     * @return Porcentaje de victorias
     */
    public double getPorcentajeVictorias() {
        return ((double)this.getPartidosGanados()) / this.getPartidosJugados() * 100;
    }
    
    /**
     * Devuelve el porcentaje de victorias del equipo
     * @return Porcentaje de derrotas
     */
    public double getPorcentajeDerrotas() {
        return ((double)this.getPartidosPerdidos()) / this.getPartidosJugados() * 100;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Equipo)) {
            return false;
        }
        Equipo other = (Equipo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        if ((this.nombre == null && other.nombre != null) || (this.nombre != null && !this.nombre.equals(other.nombre))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.nombre;
    }

}

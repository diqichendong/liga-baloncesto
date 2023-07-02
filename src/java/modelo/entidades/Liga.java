/*
 * Modelo Entidad Liga
 */
package modelo.entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author Di Qi
 */
@Entity(name = "ligas")
public class Liga implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String nombre;
    @OneToMany(targetEntity = Equipo.class)
    private List<Equipo> equipos;
    @OneToMany(targetEntity = Jornada.class)
    private List<Jornada> jornadas;

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

    public List<Equipo> getEquipos() {
        return equipos;
    }

    public void setEquipos(List<Equipo> equipos) {
        this.equipos = equipos;
    }

    public List<Jornada> getJornadas() {
        return jornadas;
    }

    public void setJornadas(List<Jornada> jornadas) {
        this.jornadas = jornadas;
    }

    /**
     * Genera automáticamento todas las jornadas de la liga
     *
     * @param fechaInicial Fecha inicial de la primera jornada
     */
    public void generarJornadas(String fechaInicial) {
        //Partidos de ida y vuelta
        List<Partido> partidosIda = generarPartidosIda();
        List<Partido> partidosVuelta = generarPartidosVuelta(partidosIda);
        //Todos los partidos
        List<Partido> partidos = new ArrayList();
        partidos.addAll(partidosIda);
        partidos.addAll(partidosVuelta);
        partidos.add(null);

        this.jornadas = new ArrayList();
        Date fecha = null;

        //Bucle para crear las jornadas
        for (int i = 0; i < (this.equipos.size() - 1) * 2; i++) {
            Jornada jornada = new Jornada();

            jornada.setNumero(i + 1);

            jornada.setPartidos(new ArrayList());

            if (i == 0) {
                //Primera jornada con la fecha inicial introducida por el administrador
                jornada.setFechaStr(fechaInicial);
                fecha = new Date(jornada.getFecha().getTime() + 3600000 * 24 * 7);
            } else {
                //Resto de jornadas
                jornada.setFecha(new Date(fecha.getTime()));
                fecha = new Date(fecha.getTime() + 3600000 * 24 * 7);
            }

            //Añadimos los partidos a cada jornada
            for (int k = 0; k < this.equipos.size() / 2; k++) {
                jornada.getPartidos().add(partidos.remove(0));
            }

            this.jornadas.add(jornada);
        }
    }

    /**
     * Devuelve una lista con todos los partidos de ida (Método Round-Robin)
     *
     * @return Lista de partidos de ida
     */
    private List<Partido> generarPartidosIda() {
        List<Partido> res = new ArrayList();
        List<Equipo> equiposLocal = new ArrayList(this.equipos).subList(0, this.equipos.size() / 2);
        List<Equipo> equiposVisitante = new ArrayList(this.equipos).subList(this.equipos.size() / 2, this.equipos.size());

        for (int i = 0; i < this.equipos.size() - 1; i++) {
            for (int j = 0; j < equiposLocal.size(); j++) {
                Partido p = new Partido();
                p.setLocal(equiposLocal.get(j));
                p.setVisitante(equiposVisitante.get(j));
                p.setPuntosLocal(0);
                p.setPuntosVisitante(0);
                res.add(p);
            }
            equiposLocal.add(1, equiposVisitante.remove(0));
            equiposVisitante.add(equiposLocal.remove(equiposLocal.size() - 1));
        }

        return res;
    }

    /**
     * Dada una lista de partidos de ida genera otra lista igual con los equipos
     * locales y visitantes cambiados
     *
     * @param partidosIda Lista de partidos de ida
     * @return Lista de los partidos de vuelta
     */
    private List<Partido> generarPartidosVuelta(List<Partido> partidosIda) {
        List<Partido> res = new ArrayList();

        for (Partido partido : partidosIda) {
            Partido p = new Partido();
            p.setLocal(partido.getVisitante());
            p.setVisitante(partido.getLocal());
            p.setPuntosLocal(0);
            p.setPuntosVisitante(0);
            res.add(p);
        }

        return res;
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
        if (!(object instanceof Liga)) {
            return false;
        }
        Liga other = (Liga) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.nombre;
    }

}

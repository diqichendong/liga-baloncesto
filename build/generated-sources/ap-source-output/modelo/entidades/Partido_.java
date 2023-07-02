package modelo.entidades;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.entidades.Equipo;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-03-01T10:03:31")
@StaticMetamodel(Partido.class)
public class Partido_ { 

    public static volatile SingularAttribute<Partido, Equipo> visitante;
    public static volatile SingularAttribute<Partido, Long> id;
    public static volatile SingularAttribute<Partido, Integer> puntosVisitante;
    public static volatile SingularAttribute<Partido, Equipo> local;
    public static volatile SingularAttribute<Partido, Integer> puntosLocal;

}
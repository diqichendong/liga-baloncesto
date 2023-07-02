package modelo.entidades;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.entidades.Equipo;
import modelo.entidades.Jornada;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-03-01T10:03:31")
@StaticMetamodel(Liga.class)
public class Liga_ { 

    public static volatile ListAttribute<Liga, Jornada> jornadas;
    public static volatile SingularAttribute<Liga, Long> id;
    public static volatile SingularAttribute<Liga, String> nombre;
    public static volatile ListAttribute<Liga, Equipo> equipos;

}
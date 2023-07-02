package modelo.entidades;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.entidades.Partido;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-03-01T10:03:31")
@StaticMetamodel(Jornada.class)
public class Jornada_ { 

    public static volatile SingularAttribute<Jornada, Date> fecha;
    public static volatile SingularAttribute<Jornada, Integer> numero;
    public static volatile SingularAttribute<Jornada, Long> id;
    public static volatile ListAttribute<Jornada, Partido> partidos;

}
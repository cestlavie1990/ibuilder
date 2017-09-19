package entity;

import entity.Places;
import entity.WorkProcess;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-18T19:53:20")
@StaticMetamodel(Works.class)
public class Works_ { 

    public static volatile SingularAttribute<Works, Integer> recordId;
    public static volatile SingularAttribute<Works, Date> dateCreated;
    public static volatile SingularAttribute<Works, Places> recordIdPlace;
    public static volatile SingularAttribute<Works, String> name;
    public static volatile CollectionAttribute<Works, WorkProcess> workProcessCollection;

}
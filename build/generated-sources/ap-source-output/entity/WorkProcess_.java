package entity;

import entity.Types;
import entity.Works;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-07-09T18:36:12")
@StaticMetamodel(WorkProcess.class)
public class WorkProcess_ { 

    public static volatile SingularAttribute<WorkProcess, Integer> recordId;
    public static volatile SingularAttribute<WorkProcess, Date> date;
    public static volatile SingularAttribute<WorkProcess, String> quantity;
    public static volatile SingularAttribute<WorkProcess, String> notes;
    public static volatile SingularAttribute<WorkProcess, Works> recordIdWork;
    public static volatile CollectionAttribute<WorkProcess, Types> typesCollection;

}
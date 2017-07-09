package entity;

import entity.Objects;
import entity.Users;
import entity.Works;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-07-09T18:36:12")
@StaticMetamodel(Places.class)
public class Places_ { 

    public static volatile SingularAttribute<Places, Integer> recordId;
    public static volatile SingularAttribute<Places, Date> dateCreated;
    public static volatile CollectionAttribute<Places, Works> worksCollection;
    public static volatile SingularAttribute<Places, Objects> recordIdObject;
    public static volatile SingularAttribute<Places, String> name;
    public static volatile CollectionAttribute<Places, Users> usersCollection;

}
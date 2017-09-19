package entity;

import entity.Objects;
import entity.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-18T19:53:20")
@StaticMetamodel(Companies.class)
public class Companies_ { 

    public static volatile SingularAttribute<Companies, Integer> recordId;
    public static volatile CollectionAttribute<Companies, Objects> objectsCollection;
    public static volatile SingularAttribute<Companies, String> name;
    public static volatile SingularAttribute<Companies, Date> dateRegistration;
    public static volatile CollectionAttribute<Companies, Users> usersCollection;
    public static volatile SingularAttribute<Companies, String> email;

}
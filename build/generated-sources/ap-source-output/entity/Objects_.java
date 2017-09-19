package entity;

import entity.Companies;
import entity.Places;
import entity.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-18T19:53:20")
@StaticMetamodel(Objects.class)
public class Objects_ { 

    public static volatile SingularAttribute<Objects, Integer> recordId;
    public static volatile SingularAttribute<Objects, String> address;
    public static volatile SingularAttribute<Objects, Date> dateCreated;
    public static volatile SingularAttribute<Objects, String> name;
    public static volatile SingularAttribute<Objects, String> generalBuilder;
    public static volatile SingularAttribute<Objects, Companies> recordIdCompany;
    public static volatile CollectionAttribute<Objects, Places> placesCollection;
    public static volatile CollectionAttribute<Objects, Users> usersCollection;
    public static volatile SingularAttribute<Objects, Boolean> isActive;
    public static volatile SingularAttribute<Objects, String> customer;

}
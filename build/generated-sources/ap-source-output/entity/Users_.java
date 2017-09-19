package entity;

import entity.Companies;
import entity.GroupUsers;
import entity.Objects;
import entity.Places;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-18T19:53:20")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, Integer> recordId;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> role;
    public static volatile CollectionAttribute<Users, Objects> objectsCollection;
    public static volatile SingularAttribute<Users, String> name;
    public static volatile SingularAttribute<Users, Date> dateRegistration;
    public static volatile SingularAttribute<Users, Companies> recordIdCompany;
    public static volatile CollectionAttribute<Users, GroupUsers> groupUsersCollection;
    public static volatile CollectionAttribute<Users, Places> placesCollection;
    public static volatile SingularAttribute<Users, String> position;
    public static volatile SingularAttribute<Users, String> login;

}
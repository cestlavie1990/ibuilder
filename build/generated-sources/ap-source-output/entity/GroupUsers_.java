package entity;

import entity.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-18T19:53:20")
@StaticMetamodel(GroupUsers.class)
public class GroupUsers_ { 

    public static volatile SingularAttribute<GroupUsers, Integer> recordId;
    public static volatile SingularAttribute<GroupUsers, Users> userLogin;
    public static volatile SingularAttribute<GroupUsers, String> groupName;

}
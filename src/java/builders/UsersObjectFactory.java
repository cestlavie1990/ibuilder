package builders;

import entity.Users;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mr.Minakov
 */
public class UsersObjectFactory {

    public static List<UsersObject> createList(final List<Users> usersList) {
        List<UsersObject> list = new ArrayList<>();
        for (Users u : usersList) {
            list.add(new UsersObject(u.getRecordId(), u.getName()));
        }
        return list;
    }

}

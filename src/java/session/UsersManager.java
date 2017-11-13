package session;

import entity.Companies;
import entity.GroupUsers;
import entity.Users;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Mr.Minakov
 */
@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class UsersManager {

    @PersistenceContext(unitName = "IBuilderPU")
    private EntityManager em;

    @Resource
    private SessionContext context;

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Integer createUser(final String login, final String password, final String passwordConfirm,
            final String username, final String position, final Companies company, final String role) {
        try {
            if (hasEmptyParameter(password, passwordConfirm, login, username)) {
                return 2;
            } else if (!password.equals(passwordConfirm)) {
                return 3;
            } else if (isLoginUsed(login)) {
                return 4;
            } else {
                Users user = addUser(company, password, login, username, position, role);
                addGroupForUser(user, "ADMIN_GROUP");
                return 0;
            }
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
            return 1;
        }
    }

    private void addGroupForUser(final Users user, final String groupName) {
        GroupUsers groupUsers = new GroupUsers();
        groupUsers.setUserLogin(user);
        groupUsers.setGroupName(groupName);
        em.persist(groupUsers);
    }

    private Users addUser(final Companies company, final String password, final String login,
            final String username, final String position, final String role) {
        Users user = new Users();
        user.setLogin(login);
        user.setName(username);
        user.setPassword(DigestUtils.md5Hex(password));
        user.setRecordIdCompany(company);
        user.setRole(role);
        user.setDateRegistration(new Date());
        user.setPosition(position);
        em.persist(user);
        return user;
    }

    private boolean isLoginUsed(final String login) {
        List resultList = em.createNamedQuery("Users.findByLogin").setParameter("login", login).getResultList();
        return resultList.size() > 0;
    }

    private Boolean hasEmptyParameter(final String password, final String passwordConfirm, final String login, final String username) {
        return (password.isEmpty() || passwordConfirm.isEmpty() || login.isEmpty() || username.isEmpty());
    }

}

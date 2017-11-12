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
public class UserManager {

    @PersistenceContext(unitName = "IBuilderPU")
    private EntityManager em;

    @Resource
    private SessionContext context;

    @EJB
    private CompaniesFacade companiesFacade;

    @EJB
    private UsersFacade usersFacade;

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void createUser(final String login, final String password, final String username,
            final String position, final Companies company) {

    }

    private void addGroupForUser(final Users user, final String groupName) {
        GroupUsers groupUsers = new GroupUsers();
        groupUsers.setUserLogin(user);
        groupUsers.setGroupName(groupName);
        em.persist(groupUsers);
    }

    private boolean isLoginUsed(final String login) {
        List resultList = em.createNamedQuery("Users.findByLogin").setParameter("login", login).getResultList();
        return resultList.size() > 0;
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

}

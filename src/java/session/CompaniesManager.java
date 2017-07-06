package session;

import entity.Companies;
import entity.Users;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
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
public class CompaniesManager {

    @PersistenceContext(unitName = "IBuilderPU")
    private EntityManager em;

    @Resource
    private SessionContext context;

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Integer addCompanyAndUser(final String email, final String companyName, final String password,
            final String passwordConfirm, final String login, final String username, final String position) {
        try {
            if (hasEmptyParameter(email, companyName, password, passwordConfirm, login, username)) {
                return 2;
            } else if (!password.equals(passwordConfirm)) {
                return 3;
            } else if (isEmailUsed(email)) {
                return 4;
            } else if (isLoginUsed(login)) {
                return 5;
            } else {
                Companies company = addCompany(email, companyName);
                addUser(company, password, login, username, position);
                return 0;
            }
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
            return 1;
        }
    }

    private Companies addCompany(final String email, final String companyName) {
        Companies company = new Companies();
        company.setEmail(email);
        company.setName(companyName);
        company.setDateRegistration(new Date());
        em.persist(company);
        return company;
    }

    private void addUser(final Companies company, final String password, final String login, final String username, final String position) {
        Users user = new Users();
        user.setLogin(login);
        user.setName(username);
        user.setPassword(DigestUtils.md5Hex(password));
        user.setRecordIdCompany(company);
        user.setRole("ADMINISTRATOR");
        user.setDateRegistration(new Date());
        user.setPosition(position);
        em.persist(user);
    }

    private Boolean hasEmptyParameter(final String email, final String companyName, final String password,
            final String passwordConfirm, final String login, final String username) {
        return (email.isEmpty() || companyName.isEmpty() || password.isEmpty()
                || passwordConfirm.isEmpty() || login.isEmpty() || username.isEmpty());
    }

    private Boolean isEmailUsed(final String email) {
        List resultList = em.createNamedQuery("Companies.findByEmail").setParameter("email", email).getResultList();
        return resultList.size() > 0;
    }

    private Boolean isLoginUsed(final String login) {
        List resultList = em.createNamedQuery("Users.findByLogin").setParameter("login", login).getResultList();
        return resultList.size() > 0;
    }
}

package session;

import entity.Companies;
import entity.Users;
import java.util.Date;
import javax.annotation.Resource;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
            if (!hasNullParameter(email, companyName, password, passwordConfirm, login, username)
                    && password.equals(passwordConfirm)) {
                Companies company = addCompany(email, companyName);
                addUser(company, password, login, username, position);
                return 0;
            } else {
                return 2;
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
        user.setPassword(password);
        user.setRecordIdCompany(company);
        user.setRole("ADMINISTRATOR");
        user.setDateRegistration(new Date());
        user.setPosition(position);
        em.persist(user);
    }

    private Boolean hasNullParameter(final String email, final String companyName, final String password,
            final String passwordConfirm, final String login, final String username) {
        return (email == null || companyName == null || password == null
                || passwordConfirm == null || login == null || username == null);
    }
}

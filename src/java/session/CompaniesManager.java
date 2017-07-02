package session;

import entity.Companies;
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
    public Integer addCompany(final String email, final String name) {
        try {
            Companies company = new Companies();
            company.setDateRegistration(new Date());
            company.setEmail(email);
            company.setName(name);
            em.persist(company);
            return 0;
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
            return 1;
        }
    }
}

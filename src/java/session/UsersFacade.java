package session;

import entity.Companies;
import entity.Objects;
import entity.Users;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Mr.Minakov
 */
@Stateless
public class UsersFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "IBuilderPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }
    
    public Users findByRecordId(final Integer recordId) {
        Users user = (Users) em.createNamedQuery("Users.findByRecordId").setParameter("recordId", recordId).getSingleResult();
        return user;
    }

    public Users findByLogin(final String login) {
        Users user = (Users) em.createNamedQuery("Users.findByLogin").setParameter("login", login).getSingleResult();
        return user;
    }

    public List<Objects> getObjects(final Integer recordId) {
        return em.createNamedQuery("Users.getObjects").setParameter("recordId", recordId).getResultList();
    }

    public List<Objects> getObjectsByStatus(final Integer recordId, final boolean status) {
        return em.createNamedQuery("Users.getObjectsByStatus").setParameter("recordId", recordId).setParameter("status", status).getResultList();
    }

    public List<Users> findByObject(final Integer recordId) {
        return em.createNamedQuery("Users.findByObject").setParameter("recordId", recordId).getResultList();
    }
    
    public List<Users> findByCompany(final Companies company) {
        return em.createNamedQuery("Users.findByCompany").setParameter("company", company).getResultList();
    }
    
    public List<Users> findNameAndLoginByCompany(final Companies company) {
        return em.createNamedQuery("Users.findNameAndLoginByCompany").setParameter("company", company).getResultList();
    }

}

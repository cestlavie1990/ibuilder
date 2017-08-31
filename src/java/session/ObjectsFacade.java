package session;

import entity.Companies;
import entity.Objects;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Mr.Minakov
 */
@Stateless
public class ObjectsFacade extends AbstractFacade<Objects> {

    @PersistenceContext(unitName = "IBuilderPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ObjectsFacade() {
        super(Objects.class);
    }
    
    public List findObjectsListByCompany(final Companies company) {
        List resultList = em.createNamedQuery("Objects.findByCompany").setParameter("company", company).getResultList();
        return resultList;
    }
    
    public List findObjectsByCompanyAndStatus(final Companies company, final boolean status) {
        return em.createNamedQuery("Objects.findByCompanyAndStatus").setParameter("company", company).setParameter("status", status).getResultList();
    }
    
        public Objects findObjectByRecordId(final Integer recordId) {
        return (Objects) em.createNamedQuery("Objects.findByRecordId").setParameter("recordId", recordId).getSingleResult();
    }
    
}

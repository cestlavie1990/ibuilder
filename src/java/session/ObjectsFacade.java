/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
        List resultList = em.createNamedQuery("Objects.findByCompany").setParameter("recordIdCompany", company).getResultList();
        return resultList;
    }
    
}

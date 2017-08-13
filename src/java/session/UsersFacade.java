/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

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

    public Users findByLogin(final String login) {
        Users user = (Users) em.createNamedQuery("Users.findByLogin").setParameter("login", login).getSingleResult();
        return user;
    }
    
    public List<Objects> getObjects(final Integer recordId) {
        return em.createNamedQuery("Users.getObjects").setParameter("recordId", recordId).getResultList();
    }

}

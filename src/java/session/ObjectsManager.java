package session;

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
import entity.Users;
import entity.Objects;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mr.Minakov
 */
@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ObjectsManager {

    @PersistenceContext(unitName = "IBuilderPU")
    private EntityManager em;

    @Resource
    private SessionContext context;

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void createObjects(final Users user, final String name, final String address,
            final String customer, final String generalBuilder, final Date dateStart) {
        try {
            List<Users> usersCollection = new ArrayList<>();
            usersCollection.add(user);

            Objects object = new Objects();
            object.setName(name);
            object.setAddress(address);
            object.setCustomer(customer);
            object.setGeneralBuilder(generalBuilder);
            object.setRecordIdCompany(user.getRecordIdCompany());
            object.setDateCreated(dateStart);
            object.setUsersCollection(usersCollection);

            em.persist(object);
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void createObjects(final Users user, final String name, final String address,
            final String customer, final String generalBuilder) {
        try {
            List<Users> usersCollection = new ArrayList<>();
            usersCollection.add(user);

            Objects object = new Objects();
            object.setName(name);
            object.setAddress(address);
            object.setCustomer(customer);
            object.setGeneralBuilder(generalBuilder);
            object.setRecordIdCompany(user.getRecordIdCompany());
            object.setDateCreated(new Date());
            object.setUsersCollection(usersCollection);
            
            em.persist(object);
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
    }

}

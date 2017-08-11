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
import javax.ejb.EJB;

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
    public Objects createObjects(final Users user, final String name, final String address,
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

            return em.merge(object);
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
            throw new UnsupportedOperationException();
        }
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void addConnection(Users user, Objects object) {
        try {
            List<Objects> objectsCollection;
            List<Users> usersCollection;

            if (user.getObjectsCollection().size() == 0) {
                objectsCollection = new ArrayList<>();
            } else {
                objectsCollection = (ArrayList<Objects>) user.getObjectsCollection();
            }

            if (object.getUsersCollection().size() == 0) {
                usersCollection = new ArrayList<>();
            } else {
                usersCollection = (ArrayList<Users>) object.getUsersCollection();
            }

            objectsCollection.add(object);
            usersCollection.add(user);

            user.setObjectsCollection(objectsCollection);
            object.setUsersCollection(usersCollection);

            em.refresh(user);
            em.refresh(object);
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
    }

}

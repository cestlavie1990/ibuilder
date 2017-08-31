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
import java.text.SimpleDateFormat;
import java.util.Collection;
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

    @EJB
    private ObjectsFacade objectsFacade;

    @Resource
    private SessionContext context;

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void createObject(final Users user, final String name, final String address,
            final String customer, final String generalBuilder, final String dateStart) {
        try {

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
            Date date = dateFormat.parse(dateStart);

            Objects object = new Objects();
            object.setName(name);
            object.setAddress(address);
            object.setCustomer(customer);
            object.setGeneralBuilder(generalBuilder);
            object.setRecordIdCompany(user.getRecordIdCompany());
            object.setDateCreated(date);
            object.addUserToCollection(user);

            em.persist(object);
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void createObject(final Users user, final String name, final String address,
            final String customer, final String generalBuilder) {
        try {
            String uqIndex = "" + Math.random() + name;

            Objects object = new Objects();
            object.setName(name);
            object.setAddress(address);
            object.setCustomer(customer);
            object.setGeneralBuilder(generalBuilder);
            object.setRecordIdCompany(user.getRecordIdCompany());
            object.setDateCreated(new Date());
            object.addUserToCollection(user);

            em.persist(object);
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void deleteObject(final Integer recorIdObject, final Users user) {
        try {
            Objects object = objectsFacade.findObjectByRecordId(recorIdObject);
            if (isUserHasObject(object, user) && isAdministrator(user)) {
                em.remove(object);
            } else {
                throw new IllegalArgumentException();
            }

        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }

    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void editObject(final Integer recorIdObject, final Users user, final String name,
            final String address, final String customer, final String generalBuilder, final String dateStart) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
            Date date = dateFormat.parse(dateStart);

            Objects object = objectsFacade.findObjectByRecordId(recorIdObject);

            if (isUserHasObject(object, user)) {
                object.setName(name);
                object.setAddress(address);
                object.setCustomer(customer);
                object.setGeneralBuilder(generalBuilder);
                object.setDateCreated(date);
                em.refresh(object);
            } else {
                throw new IllegalArgumentException();
            }
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void editObject(final Integer recorIdObject, final Users user, final String name,
            final String address, final String customer, final String generalBuilder) {
        try {
            Objects object = objectsFacade.findObjectByRecordId(recorIdObject);

            if (isUserHasObject(object, user)) {
                object.setName(name);
                object.setAddress(address);
                object.setCustomer(customer);
                object.setGeneralBuilder(generalBuilder);
                em.refresh(object);
            } else {
                throw new IllegalArgumentException();
            }
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
    }

    private boolean isAdministrator(final Users user) {
        return user.getRole().equals("ADMINISTRATOR");
    }

    private boolean isUserHasObject(final Objects object, final Users user) {
        Collection<Objects> objectsCollection = user.getObjectsCollection();
        return objectsCollection.contains(object);
    }

}

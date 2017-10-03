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
import exceptions.IncorrectDateException;
import exceptions.IncorrectObjectKeyException;
import exceptions.UserHasNotObjectException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    public boolean createObject(final Users user, final String name, final String address,
            final String customer, final String generalBuilder, final String dateStart) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
            Date date = dateFormat.parse(dateStart);
            String uqKey = "" + Math.random();

            if (isDateCorrect(date)) {
                Objects object = new Objects();
                object.setName(name);
                object.setAddress(address);
                object.setCustomer(customer);
                object.setGeneralBuilder(generalBuilder);
                object.setRecordIdCompany(user.getRecordIdCompany());
                object.setDateCreated(date);
                object.addUserToCollection(user);
                object.setIsActive(true);
                object.setUqKey(uqKey);

                em.persist(object);
                return true;
            }

        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
        return false;
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public boolean deleteObject(final Integer recorIdObject, final Users user, final String uqKey) {
        try {
            Objects object = objectsFacade.findObjectByRecordId(recorIdObject);
            if (isObjectDataCorrect(object, uqKey) && isAdministrator(user)) {
                em.remove(object);
                return true;
            } else {
                throw new IllegalArgumentException();
            }
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
        return false;
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public boolean editObject(final Integer recorIdObject, final Users user, final String name, final String address,
            final String customer, final String generalBuilder, final String dateStart, final String uqKey) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
            Date date = dateFormat.parse(dateStart);

            Objects object = objectsFacade.findObjectByRecordId(recorIdObject);

            if (isDateCorrect(date) && isObjectDataCorrect(object, uqKey)) {
                object.setName(name);
                object.setAddress(address);
                object.setCustomer(customer);
                object.setGeneralBuilder(generalBuilder);
                object.setDateCreated(date);
                em.merge(object);
                return true;
            }

        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
        return false;
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public boolean changeStatus(final Integer recorIdObject, final Users user, final boolean makeActive, final String uqKey) {
        try {
            Objects object = objectsFacade.findObjectByRecordId(recorIdObject);
            if (isObjectDataCorrect(object, uqKey)) {
                object.setIsActive(makeActive);
                em.merge(object);
                return true;
            }
        } catch (Exception e) {
            context.setRollbackOnly();
            e.printStackTrace();
        }
        return false;
    }

    private boolean isAdministrator(final Users user) {
        return user.getRole().equals("ADMINISTRATOR");
    }

    private boolean isObjectDataCorrect(final Objects object, final String uqKey) throws IncorrectObjectKeyException {
        if (object.getUqKey().equals(uqKey)) {
            return true;
        } else {
            throw new IncorrectObjectKeyException();
        }
    }

    private boolean isDateCorrect(final Date date) throws IncorrectDateException {
        Calendar calendar = Calendar.getInstance();
        calendar.set(1000, 0, 1);
        Date dateMin = calendar.getTime();
        calendar.set(9999, 11, 31);
        Date dateMax = calendar.getTime();
        if (date.before(dateMax) && date.after(dateMin)) {
            return true;
        } else {
            throw new IncorrectDateException();
        }
    }

    private boolean isUserHasObject(final Objects object, final Users user) throws UserHasNotObjectException {
        Collection<Objects> objectsCollection = user.getObjectsCollection();
        if (objectsCollection.contains(object)) {
            return true;
        } else {
            throw new UserHasNotObjectException();
        }
    }
}

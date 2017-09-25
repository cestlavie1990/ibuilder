package controller;

import entity.Companies;
import entity.Objects;
import entity.Users;
import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.ObjectsFacade;
import session.ObjectsManager;
import session.UsersFacade;

/**
 *
 * @author Mr.Minakov
 */
@ServletSecurity(
        @HttpConstraint(rolesAllowed = {"admin"}))
public class ObjectsServlet extends HttpServlet {

    @EJB
    private ObjectsManager objectsManager;

    @EJB
    private UsersFacade usersFacade;

    @EJB
    private ObjectsFacade objectsFacade;

    @Override
    public void init() throws ServletException {
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Users user = getUserPrincipal(request);

        Integer countAllActiveObjects = getObjectsByCompanyAndStatus(user.getRecordIdCompany(), true).size();
        String username = user.getName();
        String companyName = user.getRecordIdCompany().getName();
        Collection<Objects> objectsByUser = getObjectsByUser(user);
        Collection<Objects> activeObjects = getObjectsByStatus(user, true);
        Collection<Objects> finishedObjects = getObjectsByStatus(user, false);

        getServletContext().setAttribute("username", username);
        getServletContext().setAttribute("companyName", companyName);
        getServletContext().setAttribute("countAllActiveObjects", countAllActiveObjects);
        getServletContext().setAttribute("objects", objectsByUser);
        getServletContext().setAttribute("activeObjects", activeObjects);
        getServletContext().setAttribute("finishedObjects", finishedObjects);

        request.getRequestDispatcher("/WEB-INF/private/objects.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("btnAction");

        if (action.equals("add")) {
            addObject(request);
        } else if (action.equals("delete")) {
            deleteObject(request);
        } else if (action.equals("edit")) {
            editObject(request);
        } else if (action.equals("changeStatusToActive")) {
            changeStatus(request, true);
        } else if (action.equals("changeStatusToFinished")) {
            changeStatus(request, false);
        }

        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void addObject(HttpServletRequest request) {
        Enumeration<String> parameters = request.getParameterNames();
        String name = null, address = null, customer = null, generalBuilder = null, dateStart = null;

        while (parameters.hasMoreElements()) {
            String parameter = parameters.nextElement();
            if (parameter.equals("nameObj")) {
                name = request.getParameter(parameter);
            } else if (parameter.equals("addressObj")) {
                address = request.getParameter(parameter);
            } else if (parameter.equals("nameCustomerObj")) {
                customer = request.getParameter(parameter);
            } else if (parameter.equals("nameGenBuilderObj")) {
                generalBuilder = request.getParameter(parameter);
            } else if (parameter.equals("dateStartObj")) {
                dateStart = request.getParameter(parameter);
            }
        }

        Users user = getUserPrincipal(request);

        boolean result = objectsManager.createObject(user, name, address, customer, generalBuilder, dateStart);
        if (result) {
            request.setAttribute("messageResult", "objectAdded");
        } else {
            request.setAttribute("messageResult", "fail");
        }
    }

    private void deleteObject(HttpServletRequest request) {
        try {
            String objectId = request.getParameter("objectId");
            Integer recordIdObject = Integer.parseInt(objectId);
            Users user = getUserPrincipal(request);
            boolean result = objectsManager.deleteObject(recordIdObject, user);
            if (result) {
                request.setAttribute("messageResult", "objectDeleted");
            } else {
                request.setAttribute("messageResult", "fail");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void editObject(HttpServletRequest request) {
        try {
            String objectId = request.getParameter("objectId");
            Integer recordIdObject = Integer.parseInt(objectId);
            Users user = getUserPrincipal(request);

            Enumeration<String> parameters = request.getParameterNames();
            String name = null, address = null, customer = null, generalBuilder = null, dateStart = null;

            while (parameters.hasMoreElements()) {
                String parameter = parameters.nextElement();
                if (parameter.equals("editNameObj")) {
                    name = request.getParameter(parameter);
                } else if (parameter.equals("editAddressObj")) {
                    address = request.getParameter(parameter);
                } else if (parameter.equals("editNameCustomerObj")) {
                    customer = request.getParameter(parameter);
                } else if (parameter.equals("editNameGenBuilderObj")) {
                    generalBuilder = request.getParameter(parameter);
                } else if (parameter.equals("editDateStartObj")) {
                    dateStart = request.getParameter(parameter);
                }
            }

            boolean result = objectsManager.editObject(recordIdObject, user, name, address, customer, generalBuilder, dateStart);
            if (result) {
                request.setAttribute("messageResult", "objectChanged");
            } else {
                request.setAttribute("messageResult", "fail");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void changeStatus(HttpServletRequest request, boolean makeActive) {
        try {
            String objectId = request.getParameter("objectId");
            Integer recordIdObject = Integer.parseInt(objectId);
            Users user = getUserPrincipal(request);
            boolean result = objectsManager.changeStatus(recordIdObject, user, makeActive);
            if (result) {
                request.setAttribute("messageResult", "statusChanged");
            } else {
                request.setAttribute("messageResult", "fail");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private Users getUserPrincipal(HttpServletRequest request) {
        request.setAttribute("login", request.getUserPrincipal().getName());

        String login = request.getAttribute("login").toString();

        Users user = usersFacade.findByLogin(login);

        return user;
    }

    private List<Objects> getObjectsByCompanyAndStatus(final Companies company, final boolean status) {
        return objectsFacade.findObjectsByCompanyAndStatus(company, status);
    }

    private List<Objects> getObjectsByStatus(final Users user, final boolean status) {
        return usersFacade.getObjectsByStatus(user.getRecordId(), status);
    }

    private List<Objects> getObjectsByUser(final Users user) {
        return usersFacade.getObjects(user.getRecordId());
    }

}

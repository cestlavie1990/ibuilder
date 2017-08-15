package controller;

import entity.Objects;
import entity.Users;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        getServletContext().setAttribute("user", user);

        getServletContext().setAttribute("objects", getObjectsCollectionForUser(user));

        request.getRequestDispatcher("/WEB-INF/private/objects.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        addObject(request);

        response.sendRedirect("objects");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

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

        if (!dateStart.isEmpty()) {
            objectsManager.createObject(user, name, address, customer, generalBuilder, dateStart);
        } else {
            objectsManager.createObject(user, name, address, customer, generalBuilder);
        }
    }

    private Users getUserPrincipal(HttpServletRequest request) {
        request.setAttribute("login", request.getUserPrincipal().getName());

        String login = request.getAttribute("login").toString();

        Users user = usersFacade.findByLogin(login);

        return user;
    }

    private List<Objects> getObjectsCollectionForUser(final Users user) {
        return usersFacade.getObjects(user.getRecordId());
    }

}

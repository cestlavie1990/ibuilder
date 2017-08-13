package controller;

import entity.Objects;
import entity.Users;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    private String login;

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
        if ("/logout".equals(request.getServletPath())) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("registration");
        }
        request.setAttribute("login", request.getUserPrincipal().getName());

        login = request.getAttribute("login").toString();

        Users user = usersFacade.findByLogin(login);

        getServletContext().setAttribute("user", user);

        getServletContext().setAttribute("objects", usersFacade.getObjects(user.getRecordId()));

        request.getRequestDispatcher("/WEB-INF/private/objects.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
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

        Users user = usersFacade.findByLogin(login);

        if (!dateStart.isEmpty()) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
                Date date;
                date = dateFormat.parse(dateStart);
                objectsManager.createObject(user, name, address, customer, generalBuilder, date);
            } catch (ParseException ex) {
                throw new IllegalArgumentException();
            }
        } else {
            objectsManager.createObject(user, name, address, customer, generalBuilder);
        }

        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

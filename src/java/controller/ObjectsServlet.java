package controller;

import entity.Users;
import java.io.IOException;
import java.util.Enumeration;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.ObjectsFacade;
import session.UsersFacade;

/**
 *
 * @author Mr.Minakov
 */
@ServletSecurity(
        @HttpConstraint(rolesAllowed = {"admin"}))
public class ObjectsServlet extends HttpServlet {

    @EJB
    private ObjectsFacade objectsFacade;

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
        if ("/logout".equals(request.getServletPath())) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("registration");
        }
        request.setAttribute("login", request.getUserPrincipal().getName());

        String login = request.getAttribute("login").toString();

        Users user = usersFacade.findByLogin(login);

        getServletContext().setAttribute("user", user);

        getServletContext().setAttribute("objects", objectsFacade.findObjectsListByCompany(user.getRecordIdCompany()));

        request.getRequestDispatcher("/WEB-INF/private/objects.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Enumeration<String> parameters = request.getParameterNames();
        
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package controller;

import entity.Users;
import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.UsersFacade;

/**
 *
 * @author Mr.Minakov
 */
@ServletSecurity(
        @HttpConstraint(rolesAllowed = {"admin"}))
public class UserManagmentServlet extends HttpServlet {

    @EJB
    private UsersFacade usersFacade;

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
        Collection<Users> usersByCompany = usersFacade.findByCompany(user.getRecordIdCompany());
        Collection<Users> nameAndLoginListByCompany = usersFacade.findNameAndLoginByCompany(user.getRecordIdCompany());

        getServletContext().setAttribute("username", user.getName());
        getServletContext().setAttribute("countAllUsers", usersByCompany.size());
        getServletContext().setAttribute("nameAndLoginList", nameAndLoginListByCompany);

        request.getRequestDispatcher("/WEB-INF/private/userManagment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private Users getUserPrincipal(HttpServletRequest request) {
        request.setAttribute("login", request.getUserPrincipal().getName());

        String login = request.getAttribute("login").toString();

        Users user = usersFacade.findByLogin(login);

        return user;
    }
}

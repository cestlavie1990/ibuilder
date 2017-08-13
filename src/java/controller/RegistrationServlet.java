package controller;

import java.io.IOException;
import java.util.Enumeration;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.CompaniesManager;

/**
 *
 * @author Mr.Minakov
 */
public class RegistrationServlet extends HttpServlet {

    @EJB
    CompaniesManager companiesManager;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/WEB-INF/views/registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String email = null, companyName = null, password = null,
                passwordConfirm = null, login = null, username = null, position = null;
        Enumeration<String> parameters = request.getParameterNames();
        while (parameters.hasMoreElements()) {
            String parameter = parameters.nextElement();
            if (parameter.equals("email")) {
                email = request.getParameter(parameter);
            } else if (parameter.equals("companyName")) {
                companyName = request.getParameter(parameter);
            } else if (parameter.equals("password")) {
                password = request.getParameter(parameter);
            } else if (parameter.equals("passwordConfirm")) {
                passwordConfirm = request.getParameter(parameter);
            } else if (parameter.equals("login")) {
                login = request.getParameter(parameter);
            } else if (parameter.equals("username")) {
                username = request.getParameter(parameter);
            } else if (parameter.equals("position")) {
                position = request.getParameter(parameter);
            }
        }
        Integer codeOperation = companiesManager.addCompanyAndUser(email, companyName, password, passwordConfirm, login, username, position);
        if (codeOperation == 0) {
            response.sendRedirect("registration_finished");
        } else {
            if (codeOperation == 2) {
                request.setAttribute("notif", "Введены не все данные");
            } else if (codeOperation == 3) {
                request.setAttribute("notif", "Введённые пароли не совпадают");
            } else if (codeOperation == 4) {
                request.setAttribute("notif", "Такой email уже существует");
            } else if (codeOperation == 5) {
                request.setAttribute("notif", "Такой логин уже существует");
            } else {
                request.setAttribute("notif", "Произошла неизвестная ошибка при регистрации. Пожалуйста, попробуйте позже");
            }
            doGet(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

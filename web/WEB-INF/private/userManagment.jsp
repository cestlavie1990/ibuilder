<%-- 
    Document   : addUser
    Created on : Nov 6, 2017, 6:04:06 PM
    Author     : Mr.Minakov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/moment-with-locales.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Управление пользователями</title>
    </head>
    <body class="page">
        <nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <div class="dropdown">
                        <span class="text"><c:out value="${username}" /></span>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="Настройки">
                            <i class="glyphicon glyphicon-cog" style="color: white"></i>
                        </a>
                        <ul class="dropdown-menu" id="navbarList">
                            <li><a href="#"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> Редактировать профиль</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i> Управление пользователями</a></li>
                            <li><a href="logout"><i class="glyphicon glyphicon-off" aria-hidden="true"></i> Выход</a></li>
                        </ul>
                    </div>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><button type="button" class="btn btn-default btn-sm navbar-btn" style="margin-right: 15px"><i class="glyphicon glyphicon-off" aria-hidden="true"></i> Выход</button></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid content">
            <div class="row text-center">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <div class="box1">
                        <h4><c:out value="${companyName}" /></h4>       
                        <p>Общее количество сотрудников: <strong><c:out value="${countAllUsers}" /></strong></p>
                    </div>
                    <div class="box3">
                        <h4>Сотрудники</h4>
                        <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#createUserModal" style="margin-bottom: 5px;">
                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> Добавить</button>
                            <c:forEach var="user" items="${nameAndLoginList}" varStatus="сounter">
                            <button type="button" class="btn btn-default objSelect" id="userSelect${сounter.index}">
                                <c:out value='${user[0]}'/> (<c:out value='${user[1]}'/>)
                            </button>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 about-col">
                    <div class="box2">

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade text-center" id="createUserModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4>Создание нового пользователя</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="userManagment">
                            <p>
                                <label for="login">Логин</label>
                                <input type="text" name="login" class="form-control" id="login" placeholder="Придумайте логин" required>
                            </p>
                            <p>
                                <label for="password">Пароль</label>
                                <input type="text" name="password" class="form-control" id="password" placeholder="Придумайте пароль" required>
                            </p>
                            <p>
                                <label for="username">Имя сотрудника</label>
                                <input type="text" name="username" class="form-control" id="username" placeholder="Введите имя">
                            </p>
                            <p>
                                <label for="position">Должность</label>
                                <input type="text" name="position" class="form-control" id="position" placeholder="Введите должность">
                            </p>
                            <p>
                                <button type="submit" class="btn btn-default" id="btnAddObj" name="btnAction" value="createUser">Создать</button>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

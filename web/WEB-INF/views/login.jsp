<%-- 
    Document   : login
    Created on : Jul 8, 2017, 7:00:01 PM
    Author     : Mr.Minakov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Авторизация</title>
    </head>
    <body class="page">        
        <div class="cont-page auth text-center">
            <form action="j_security_check" method="POST">
                <p>
                    <label for="login">Логин:</label>
                    <input type="text" name="j_username" class="form-control" placeholder="Введите логин:">
                </p>                        
                <p>
                    <label for="pwd">Пароль:</label>
                    <input type="password" name="j_password" class="form-control" placeholder="Введите пароль:">
                </p>
                <p>
                    <label><input type="checkbox"> Запомнить меня</label>
                </p> 
                <button type="submit" class="btn btn-primary">Вход</button>
                <button type="button" class="btn btn-primary" onclick="location.href = '/ibuilder/registration'">Регистрация</button>
            </form>
            <a href="#">Забыли пароль?</a>            
        </div>
    </body>
</html>

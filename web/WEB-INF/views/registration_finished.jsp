<%-- 
    Document   : registration_finished
    Created on : Jul 3, 2017, 1:06:37 PM
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
        <title>Регистрация завершена</title>
    </head>
    <body class="page">        
        <div class="cont-page reg-finished text-center">
            <h3>Регистрация успешно завершена!</h3>
            <p>Воспользуйтесь формами ниже, чтобы войти в аккаунт</p>
            <form method="POST" class="reg-attr" style="margin: 0px 300px 0px 300px">
                <p>
                    <label for="login">Логин:</label>
                    <input type="text" name="login" class="form-control" id="login" placeholder="Введите логин:">                                    
                </p>
                <p>
                    <label for="password">Пароль:</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Введите пароль">
                </p>
                <p>
                    <button type="submit" class="btn btn-primary">Войти</button>                                    
                </p>
            </form>
        </div>
    </body>
</html>

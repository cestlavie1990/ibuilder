<%-- 
    Document   : error
    Created on : Jul 5, 2017, 8:11:43 AM
    Author     : Mr.Minakov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ошибка авторизации</title>
    </head>
    <body class="page">        
        <div class="auth-error text-center">
            <h3>Ошибка!</h3>
            <h4>Неправильный логин или пароль.</h4>
            <p><a href="/ibuilder/objects">Попробовать ещё раз</a></p>
            <p>Если у Вашей компании нет аккаунта, Вы можете <a href="/ibuilder/registration">пройти регистрацию</a></p>
            <p>Если Вы забыли логин или пароль, то можете <a href="#">перейти к восстановлению</a></p>            
        </div>
    </body>
</html>

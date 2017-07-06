<%-- 
    Document   : error
    Created on : Jul 5, 2017, 8:11:43 AM
    Author     : Mr.Minakov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ошибка авторизации</title>
    </head>
    <body class="page">        
        <div class="cont-page auth-error text-center">
            <h3>Ошибка!</h3>
            <h4>Неправильный логин или пароль.</h4>
            <p><a href="/ibuilder/">Попробовать ещё раз</a></p>
            <p>Если у Вашей компании нет аккаунта, Вы можете <a href="/ibuilder/registration">пройти регистрацию</a></p>
            <p>Если Вы забыли логин или пароль, то можете <a href="#">перейти к восстановлению</a></p>            
        </div>
    </body>
</html>

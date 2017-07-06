<%-- 
    Document   : registration
    Created on : Jun 19, 2017, 2:23:59 PM
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
        <title>Регистрация профиля</title>
    </head>
    <body class="page">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="reg-process">
                        <section>
                            <div class="reg-text text-center">
                                <c:if test="${notif ne null}">
                                    <div class="notif">
                                        <span>${notif}</span> 
                                    </div>
                                </c:if>
                                <h2 class="text-center">Регистрация профиля</h2>
                                <p>Пожалуйста, заполните пустые поля</p>
                            </div>
                            <div class="row">
                                <form method="POST" action="registration" class="reg-attr">
                                    <p>
                                        <label for="email">Email:</label>
                                        <input type="email" name="email" class="form-control" id="email" placeholder="Введите адрес почты">                                    
                                    </p>
                                    <p>
                                        <label for="login">Логин:</label>
                                        <input type="text" name="login" class="form-control" id="login" placeholder="Введите логин:">                                    
                                    </p>
                                    <p>
                                        <label for="companyName">Полное название организации:</label>
                                        <input type="text" name="companyName" class="form-control" id="companyName-reg" placeholder='ООО "Иван и co"'>                                    
                                    </p>
                                    <p>
                                        <label for="password">Пароль:</label>
                                        <input type="password" name="password" class="form-control" id="password" placeholder="Введите пароль">
                                    </p>
                                    <p>
                                        <label for="passwordConfirm">Повтор пароля:</label>
                                        <input type="password" name="passwordConfirm" class="form-control" id="passwordConfirm" placeholder="Повторите пароль">                                    
                                    </p>
                                    <p>
                                        <label for="username">Имя:</label>
                                        <input type="text" name="username" class="form-control" id="username" placeholder="Иван Петров">                                    
                                    </p>
                                    <p>
                                        <label for="position">Должность:</label>
                                        <input type="text" name="position" class="form-control" id="position" placeholder="Генеральный директор">                                    
                                    </p>
                                    <p>
                                        <button type="submit" class="btn btn-primary">Зарегистрироваться</button>                                    
                                    </p>
                                </form>
                            </div>    
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

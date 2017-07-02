<%-- 
    Document   : registration
    Created on : Jun 19, 2017, 2:23:59 PM
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
        <title>Регистрация профиля</title>
    </head>
    <body class="page">
        <aside class="leftAside">
            <h2>Что нужно для регистрации</h2>
            <p>Что бы регистрация прошла успешно, заполните все поля и нажмите на
                кнопку "Зарегистрироваться"
            </p>
        </aside>
        <section>
            <article>
                <h1>Регистрация</h1>
                <div class="text-article">
                    <c:if test="${notif ne null}">
                        <div class="notif">
                            <span>${notif}</span> 
                        </div>
                    </c:if>
                    <form method="POST" action="registration">
                        <p>
                            <label for="name">Имя компании</label>
                            <input type="text" name="name" id="name"/>
                        </p>
                        <p>
                            <label for="email">E-Mail</label>
                            <input type="email" name="email" id="email"/>
                        </p>
                        <p>
                            <label for="password">Пароль</label>
                            <input type="password" name="password" id="password"/>

                            <label for="passwordConfirm">Повторите пароль</label>
                            <input type="password" name="passwordConfirm" id="passwordConfirm"/>
                        </p>
                        <p>
                            <button type="submit">Зарегистрироваться</button>
                        </p>
                    </form>
                </div>
            </article>
        </section>
        <!--
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="reg-process">
                        <div class="reg-text text-center">
                            <h2 class="text-center">Регистрация профиля</h2>
                            <p>Пожалуйста, заполните пустые поля</p>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <form class="reg-attr" style="margin-left: 50px">
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control" id="email" placeholder="Введите адрес почты">
                                    </div>                            
                                    <div class="form-group">
                                        <label for="login-reg">Логин:</label>
                                        <input type="text" class="form-control" id="login-reg2" placeholder="Введите логин:">
                                    </div>                            
                                    <div class="form-group">
                                        <label for="company-reg">Полное название организации:</label>
                                        <input type="text" class="form-control" id="company-reg" placeholder='ООО "Иван и co"'>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6">
                                <form class="reg-attr" style="margin-right: 50px">
                                    <div class="form-group">
                                        <label for="pwd-reg1">Пароль:</label>
                                        <input type="password" class="form-control" id="pwd-reg1" placeholder="Введите пароль">
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd-reg2">Повтор пароля:</label>
                                        <input type="password" class="form-control" id="pwd-reg2" placeholder="Повторите пароль">
                                    </div>                            
                                    <div class="form-group">
                                        <label for="name-reg">Имя:</label>
                                        <input type="text" class="form-control" id="name-reg" placeholder="Иван Петров">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <form class="reg-attr text-center" style="padding-bottom: 20px">
                            <button type="button" class="btn btn-primary" onclick="location.href = 'index.jsp'">Зарегистрироваться</button>
                        </form>                         
                    </div>
                </div>
            </div>
        </div>
        -->
    </body>
</html>

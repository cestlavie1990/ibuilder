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
                        <form class="reg-attr text-center">
                            <button type="button" class="btn btn-primary">Зарегистрироваться</button>
                        </form>                         
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

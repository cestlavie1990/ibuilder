<%-- 
    Document   : index
    Created on : Jun 19, 2017, 2:30:47 PM
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
        <title>Ibulider - Ваш строительный менеджер</title>
    </head>
    <body class="page">
        <div class="container">            
            <div class="row">
                <div class="col-md-9 text-center">
                    <div class="logo">
                        <h2>iBuilder</h2>
                        <p>Ваш надёжный помощник в управлении строительством</p><br>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <div class="registration">
                        <form>
                            <div class="form-group">
                                <label for="login">Логин:</label>
                                <input type="text" class="form-control" id="login" placeholder="Введите логин:">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Пароль:</label>
                                <input type="password" class="form-control" id="pwd" placeholder="Введите пароль:">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox"> Запомнить меня</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Вход</button>
                        </form> 
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="about">
                        <h2>О приложении</h2>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

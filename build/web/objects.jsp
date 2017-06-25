<%-- 
    Document   : objects
    Created on : Jun 19, 2017, 2:24:59 PM
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
    </head>
    <body class="page">
        <div class="obj-page">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile text-center">
                        <h4>Иван Петров</h4>
                        <img class="avatar" src="avatars/004-agreement.png" width="128px" height="128px">
                        <h5>ООО "Лев"</h5>
                        <h5>генеральный директор</h5>
                        <p>активных объектов: 6</p>
                        <button type="button" class="btn btn-primary btn-xs">Профиль</button>
                        <button type="button" class="btn btn-primary btn-xs">Настройки</button>
                        <button type="button" class="btn btn-primary btn-xs">Добавить пользователя</button>
                    </div>
                    <div class="objects-info text-center">                        
                        <h4>Объекты строительства</h4>
                        <button type="button" class="btn btn-primary btn-xs">Добавить объект</button>
                        <button type="button" class="btn btn-primary btn-xs">Удалить объекты</button><div class="active-obj">
                            <a href="#active-obj" data-toggle="collapse">
                                <strong>Активные объекты</strong>
                            </a>
                            <div id="active-obj" class="collapse" style="background-color: #EDEEF0">
                                <p>о. Новая Голландия</p>
                                <p>Кушелевская дорога</p>
                                <p>Заозёрная ул.</p>
                            </div>
                        </div>
                        <div class="finished-obj">
                            <a href="#finished-obj" data-toggle="collapse">
                                <strong>Завершённые объекты</strong>
                            </a>
                            <div id="finished-obj" class="collapse" style="background-color: #EDEEF0">
                                <p>Московское шоссе</p>
                                <p>Кременчугская ул.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">

                </div>
            </div>
        </div>
    </body>
</html>



<!--
<div class="obj-page" style="margin: 15px 30px 0px 30px">                
    <div class="objects-container text-center">
        <div class="row">
            <div class="col-md-3">
                <div class="profile" style="padding-bottom: 5px;">
                    <h4>Иван Петров</h4>
                    <img class="avatar" src="avatars/004-agreement.png" width="128px" height="128px">
                    <h5>ООО "Лев"</h5>
                    <h5>генеральный директор</h5>
                    <p>активных объектов: 6</p>
                    <button type="button" class="btn btn-primary btn-xs">Профиль</button>
                    <button type="button" class="btn btn-primary btn-xs">Настройки</button>
                </div>
            </div>
            <div class="col-md-9">
                <div class="about-obj">
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <h3>Здесь будет отображаться информация о выбранном объекте строительства</h3>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>                        
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="objects">
                    <h4>Объекты строительства</h4>
                    <button type="button" class="btn btn-primary btn-xs">Добавить объект</button>
                    <button type="button" class="btn btn-primary btn-xs">Удалить объекты</button><br>
                    <div class="active-obj">
                        <a href="#active-obj" data-toggle="collapse">
                            <strong>Активные объекты</strong>
                        </a>
                        <div id="active-obj" class="collapse" style="background-color: #EDEEF0">
                            <p>о. Новая Голландия</p>
                            <p>Кушелевская дорога</p>
                            <p>Заозёрная ул.</p>
                        </div>
                    </div>
                    <div class="finished-obj">
                        <a href="#finished-obj" data-toggle="collapse">
                            <strong>Завершённые объекты</strong>
                        </a>
                        <div id="finished-obj" class="collapse" style="background-color: #EDEEF0">
                            <p>Московское шоссе</p>
                            <p>Кременчугская ул.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <h3>Выберите объект строительства из списка</h3>
            </div>
        </div>
    </div>
</div>
-->

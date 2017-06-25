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
                        <button type="button" class="btn btn-primary btn-xs">Удалить объекты</button>
                        <a href="#active-obj" data-toggle="collapse" id="active-obj-btn">
                            <strong><p>Активные объекты</p></strong>
                        </a>
                        <ul class="nav nav-pills nav-stacked collapse" id="active-obj">
                            <li><a data-toggle="pill" href="#obj-content">о. Новая Голландия</a></li>
                            <li><a data-toggle="pill" href="#">Заозёрная ул.</a></li>
                            <li><a data-toggle="pill" href="#">Кременчугская ул.</a></li>
                        </ul>
                        <a href="#finished-obj" data-toggle="collapse" id="finished-obj-btn">
                            <strong><p>Завершённые объекты</p></strong>
                        </a>
                        <ul class="nav nav-pills nav-stacked collapse" id="finished-obj">
                            <li><a href="#"><p>Московское шоссе</p></a></li>
                            <li><a href="#"><p>Кушелевская дор.</p></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="objects-about">
                        <div class="tab-content text-center">
                            <div id="obj-content" class="tab-pane fade">
                                <h4>объект: о. Новая Голландия</h4>
                                <h5>адрес: наб. Адмиралтейского канала д. 2</h5>
                                <h5>заказчик: ООО "Новая Голландия Девелопмент"</h5>
                                <h5>генеральный подрядчик: ООО "Арсенал-Строй"</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

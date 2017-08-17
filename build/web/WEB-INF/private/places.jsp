<%-- 
    Document   : places
    Created on : Jun 19, 2017, 2:25:14 PM
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
        <div class="cont-page">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile text-center">
                        <h4>Иван Петров</h4>
                        <p><button type="button" class="btn btn-primary btn-xs" onclick="location.href = 'logout'">Выйти из профиля</button></p>
                        <img class="avatar" src="avatars/004-agreement.png" width="128px" height="128px">
                        <h5>ООО "Лев"</h5>
                        <h5>генеральный директор</h5>
                        <p>активных объектов: 6</p>
                        <button type="button" class="btn btn-primary btn-xs">Профиль</button>
                        <button type="button" class="btn btn-primary btn-xs">Настройки</button>
                        <button type="button" class="btn btn-primary btn-xs">Добавить пользователя</button>
                    </div>
                    <div class="info text-center">                        
                        <h4>Участки строительства</h4>
                        <button type="button" class="btn btn-primary btn-xs">Добавить</button>
                        <button type="button" class="btn btn-primary btn-xs">Удалить</button>
                        <ul class="nav nav-pills nav-stacked">
                            <li class="active"><a data-toggle="pill" href="#place-content">Корпус №8</a></li>
                            <li><a data-toggle="pill" href="#">Корпус №1</a></li>
                            <li><a data-toggle="pill" href="#">Арестантская башня</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content text-center" id="tab-cont">
                        <div id="place-content" class="tab-pane fade in active">
                            <div class="objects-about">
                                <h4>объект: о. Новая Голландия</h4>
                                <h5>адрес: наб. Адмиралтейского канала д. 2</h5>
                                <h5>заказчик: ООО "Новая Голландия Девелопмент"</h5>
                                <h5>генеральный подрядчик: ООО "Арсенал-Строй"</h5>
                            </div>
                            <div class="place-works">
                                <h4>Участок строительства: Корпус №8</h4>
                                <h5>Текущие работы:</h5>
                                <button type="button" class="btn btn-primary btn-md">Добавить</button>
                                <button type="button" class="btn btn-primary btn-md">Удалить</button>
                                <button type="button" class="btn btn-primary btn-md" onclick="location.href = 'objects.jsp'">Вернуться назад</button>
                                <ul class="nav nav-pills nav-stacked" id="works">
                                    <li><a href="works.jsp"><p>Усиление фундамента БИС</p></a></li>
                                    <li><a href="works.jsp"><p>Кирпичная кладка стен</p></a></li>
                                    <li><a href="works.jsp"><p>Бетонирование</p></a></li>
                                </ul>                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

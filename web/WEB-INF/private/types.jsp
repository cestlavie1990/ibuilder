<%-- 
    Document   : workprocess
    Created on : Jun 19, 2017, 2:26:14 PM
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
                        <h4>Производимые работы</h4>
                        <button type="button" class="btn btn-primary btn-xs">Добавить</button>
                        <button type="button" class="btn btn-primary btn-xs">Удалить</button>
                        <ul class="nav nav-pills nav-stacked">
                            <li class="active"><a data-toggle="pill" href="#work-content">Усиление фундамента БИС</a></li>
                            <li><a data-toggle="pill" href="#">Кирпичная кладка стен</a></li>
                            <li><a data-toggle="pill" href="#">Бетонирование</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content text-center" id="tab-cont">
                        <div id="type-content" class="tab-pane fade in active">
                            <div class="objects-about">
                                <h4>объект: о. Новая Голландия</h4>
                                <h5>адрес: наб. Адмиралтейского канала д. 2</h5>
                                <h5>заказчик: ООО "Новая Голландия Девелопмент"</h5>
                                <h5>генеральный подрядчик: ООО "Арсенал-Строй"</h5>
                            </div>
                            <div class="created-types">
                                <h4>Усиление фундамента БИС</h4>
                                <button type="button" class="btn btn-primary btn-md">Добавить тип</button>
                                <button type="button" class="btn btn-primary btn-md">Удалить</button>
                                <button type="button" class="btn btn-primary btn-md" onclick="location.href = 'works.jsp'">Вернуться назад</button>
                                <a href="#type_1" data-toggle="collapse" id="btn-collapse">
                                    <p>БИС-20, измеряется в п.м.</p>
                                </a>
                                <div class="table-type collapse" id="type_1">
                                    <table class="table table-striped table-bordered table-hover table-condensed">
                                        <thead>
                                            <tr>
                                                <th>№ п/п</th>
                                                <th>Материал</th>
                                                <th>Единица измерения</th>
                                                <th>Нормативный расход</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Бетон В25</td>
                                                <td>куб.м</td>
                                                <td>0,1</td>
                                            </tr>
                                            <tr>                                            
                                                <td>2</td>
                                                <td>труба d=210</td>
                                                <td>п.м.</td>
                                                <td>1,0</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Присадка морозостойкая</td>
                                                <td>л.</td>
                                                <td>2,5</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>                                
                                <button type="button" class="btn btn-primary btn-md">Добавить материал</button>
                                <button type="button" class="btn btn-primary btn-md">Стереть</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : objects
    Created on : Jun 19, 2017, 2:24:59 PM
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
    </head>
    <body class="page">
        <div class="cont-page">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile text-center">
                        <h4>${user.name}</h4>
                        <img class="avatar" src="avatars/004-agreement.png" width="128px" height="128px">
                        <h5>${user.getRecordIdCompany().name}</h5>
                        <c:if test="${user.position ne null}">
                            <h5>${user.position}</h5>
                        </c:if>                        
                        <p>активных объектов: <strong>${objects.size()}</strong></p>
                        <button type="button" class="btn btn-primary btn-xs">Профиль</button>
                        <button type="button" class="btn btn-primary btn-xs">Настройки</button>
                        <button type="button" class="btn btn-primary btn-xs">Добавить пользователя</button>
                    </div>
                    <div class="info text-center">                        
                        <h4>Объекты строительства</h4>
                        <button type="button" class="btn btn-primary btn-xs">Добавить</button>
                        <button type="button" class="btn btn-primary btn-xs">Удалить</button>
                        <a href="#active-obj" data-toggle="collapse" id="btn-collapse">
                            <strong><p>Активные объекты</p></strong>
                        </a>
                        <ul class="nav nav-pills nav-stacked collapse" id="active-obj">
                            <section>
                                <c:forEach var="object" items="${objects}">
                                    <a data-toggle="pill" href="#obj-content" id="objectName"><li>${object.name}</li></a>     
                                        </c:forEach>                           
                            </section>
                        </ul>
                    </div>
                </div>
                <script>
                    objectName.onclick = function (element) {
                       var idObject = element.target.id;
                    };
                </script>
                <div class="col-md-9">
                    <div class="tab-content text-center" id="tab-cont">
                        <div id="obj-content" class="tab-pane fade">
                            <div class="objects-about">
                                <h4>объект: о. Новая Голландия</h4>
                                <h5>адрес: наб. Адмиралтейского канала д. 2</h5>
                                <h5>заказчик: ООО "Новая Голландия Девелопмент"</h5>
                                <h5>генеральный подрядчик: ООО "Арсенал-Строй"</h5>
                            </div>
                            <div class="objects-places">
                                <h4>Участки строительства</h4>
                                <button type="button" class="btn btn-primary btn-md">Добавить</button>
                                <button type="button" class="btn btn-primary btn-md">Удалить</button>
                                <ul class="nav nav-pills nav-stacked" id="places">
                                    <li><a href="#"><p>Корпус №8</p></a></li>
                                    <li><a href="#"><p>Корпус №1</p></a></li>
                                    <li><a href="#"><p>Арестантская башня</p></a></li>
                                </ul>                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

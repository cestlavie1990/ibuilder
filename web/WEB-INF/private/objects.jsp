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
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/moment-with-locales.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Объекты строительства</title>
    </head>
    <body class="page">
        <nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <div class="dropdown">
                        <span class="text"><c:out value="${username}" /></span>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="Настройки">
                            <i class="glyphicon glyphicon-cog" style="color: white"></i>
                        </a>
                        <ul class="dropdown-menu" id="navbarList">
                            <li><a href="#"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> Редактировать профиль</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i> Добавить пользователя</a></li>
                            <li><a href="logout"><i class="glyphicon glyphicon-off" aria-hidden="true"></i> Выход</a></li>
                        </ul>
                    </div>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><button type="button" class="btn btn-default btn-sm navbar-btn" style="margin-right: 15px"><i class="glyphicon glyphicon-off" aria-hidden="true"></i> Выход</button></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid content">
            <div class="row text-center">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <div class="box1">
                        <h4><c:out value="${companyName}" /></h4>
                        <p>Всего активных объектов: <strong>${countAllActiveObjects}</strong></p>
                        <p>На контроле: <strong>${activeObjects.size()}</strong></p>
                    </div>
                    <div class="box3">
                        <h4>Объекты строительства</h4>
                        <a href="#active-obj" data-toggle="collapse" id="active-obj-btn">
                            <p style="margin-top: 5px;"><i class="glyphicon glyphicon-equalizer" aria-hidden="true"></i> Активные объекты</p>
                        </a>
                        <ul class="nav nav-pills nav-stacked collapse" id="active-obj">
                            <li><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#addObjModal" onclick="addObject()"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i> Добавить</button></li>
                        </ul>
                        <a href="#finished-obj" data-toggle="collapse" id="finished-obj-btn">
                            <p style="margin-top: 5px;"><i class="glyphicon glyphicon-check" aria-hidden="true"></i> Завершённые объекты</p>
                        </a>
                        <ul class="nav nav-pills nav-stacked collapse" id="finished-obj">
                        </ul>
                    </div>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 about-col">
                </div>
            </div>
        </div>

    </body>
    <script>
        function getActiveObjects() {
            var arrayObjects = [];
            var index = 0;
        <c:forEach var="object" items="${activeObjects}">
            var places = [];
            var count = 0;
            <c:forEach var="place" items="${object.placesCollection}">
            places[count] = {
                recordId: '<c:out value="${place.recordId}" />',
                name: '<c:out value="${place.name}" />',
                dateCreated: '<c:out value="${place.dateCreated}" />'
            };
            ++count;
            </c:forEach>
            arrayObjects[index] = {
                recordId: '<c:out value="${object.recordId}" />',
                name: '<c:out value="${object.name}" />',
                address: '<c:out value="${object.address}" />',
                customer: '<c:out value="${object.customer}" />',
                generalBuilder: '<c:out value="${object.generalBuilder}" />',
                dateCreated: '<c:out value="${object.dateCreated}" />',
                placesCollection: places
            };
            ++index;
        </c:forEach>
            return arrayObjects;
        }

        function getFinishedObjects() {
            var arrayObjects = [];
            var index = 0;
        <c:forEach var="object" items="${finishedObjects}">
            var places = [];
            var count = 0;
            <c:forEach var="place" items="${object.placesCollection}">
            places[count] = {
                recordId: '<c:out value="${place.recordId}" />',
                name: '<c:out value="${place.name}" />',
                dateCreated: '<c:out value="${place.dateCreated}" />'
            };
            ++count;
            </c:forEach>
            arrayObjects[index] = {
                recordId: '<c:out value="${object.recordId}" />',
                name: '<c:out value="${object.name}" />',
                address: '<c:out value="${object.address}" />',
                customer: '<c:out value="${object.customer}" />',
                generalBuilder: '<c:out value="${object.generalBuilder}" />',
                dateCreated: '<c:out value="${object.dateCreated}" />',
                placesCollection: places
            };
            ++index;
        </c:forEach>
            return arrayObjects;
        }

        var activeObjects = getActiveObjects();
        var finishedObjects = getFinishedObjects();


        function showActiveObjects() {
            if (activeObjects.length === 0) {
                $('#active-obj').append('<h5>Активные объекты отсутствуют</h5>');
            } else {
                for (var i = 0; i < activeObjects.length; i++) {
                    $('#active-obj').append('<li><button type="button" class="btn btn-default" value="' + i + '" id="objSelect" onclick="loadInfo(this, 0)">' + activeObjects[i].name + '</button></li>');
                }
            }
        }

        function showFinishedObjects() {
            if (finishedObjects.length === 0) {
                $('#finished-obj').append('<h5>Пока нет завершённых объектов</h5>');
            } else {
                for (var i = 0; i < finishedObjects.length; i++) {
                    $('#finished-obj').append('<li><button type="button" class="btn btn-default" value="' + i + '" id="objSelect" onclick="loadInfo(this, 1)">' + finishedObjects[i].name + '</button></li>');
                }
            }
        }

        function deleteObject(index, value) {
            var objects = [];
            if (value === 0) {
                objects = activeObjects;
            } else if (value === 1) {
                objects = finishedObjects;
            }
            $('#deleteObj').remove();
            $('.page').append('<div class="modal fade" id="deleteObj" role="dialog">' +
                    '<div class="modal-dialog">' +
                    '<div class="modal-content text-center">' +
                    '<div class="modal-header">' +
                    '<button type="button" class="close" data-dismiss="modal">×</button>' +
                    '<h4>Удаление объекта строительства</h4>' +
                    '</div>' +
                    '<div class="modal-body" style="color: #2D2D30">' +
                    '<form method="POST" action="objects">' +
                    '<p>Вы уверены, что хотите удалить объект <strong>' + objects[index].name + '</strong>?</p>' +
                    '<p>После удаления данные уже невозможно будет восстановить</p>' +
                    '<input type="hidden" name="objectId" value="' + objects[index].recordId + '">' +
                    '<p>' +
                    '<button type="submit" class="btn btn-default" id="btnDeleteObj" name="btnAction" value="delete">Удалить</button>' +
                    '<button type="reset" class="btn btn-default" data-dismiss="modal">Отмена</button>' +
                    '</p>' +
                    '</form>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>');
        }

        function addObject() {
            $('#addObjModal').remove();
            $('.page').append('<div class="modal fade text-center" id="addObjModal" role="dialog">' +
                    '<div class="modal-dialog">' +
                    '<div class="modal-content">' +
                    '<div class="modal-header">' +
                    '<button type="button" class="close" data-dismiss="modal">×</button>' +
                    '<h4>Добавление объекта строительства</h4>' +
                    '</div>' +
                    '<div class="modal-body">' +
                    '<form method="POST" action="objects">' +
                    '<p>' +
                    '<label for="nameObj">Название объекта строительства</label>' +
                    '<input type="text" name="nameObj" class="form-control" id="nameObj" placeholder="Введите название объекта:" required>' +
                    '</p>' +
                    '<p>' +
                    '<label for="addressObj">Адрес объекта строительства</label>' +
                    '<input type="text" name="addressObj" class="form-control" id="addressObj" placeholder="Введите адрес объекта:">' +
                    '</p>' +
                    '<p>' +
                    '<label for="nameCustomerObj">Название компании заказчика</label>' +
                    '<input type="text" name="nameCustomerObj" class="form-control" id="nameCustomerObj" placeholder="Заказчик:">' +
                    '</p>' +
                    '<p>' +
                    '<label for="nameGenBuilderObj">Название компании генподрядчика</label>' +
                    '<input type="text" name="nameGenBuilderObj" class="form-control" id="nameGenBuilderObj" placeholder="Генподрядчик:">' +
                    '</p>' +
                    '<p>' +
                    '<label for="dateStartObj">Дата начала работ</label>' +
                    '<input type="text" name="dateStartObj" class="form-control" id="dateStartObj" placeholder="Выберите дату:" required>' +
                    '</p>' +
                    '<p>' +
                    '<button type="submit" class="btn btn-default" id="btnAddObj" name="btnAction" value="add">Добавить</button>' +
                    '</p>' +
                    '</form>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>');
            $("#dateStartObj").datetimepicker({language: "ru", pickTime: false});
        }

        function editObject(index, value) {
            var objects = [];
            if (value === 0) {
                objects = activeObjects;
            } else if (value === 1) {
                objects = finishedObjects;
            }
            $('#editObject').remove();
            $('.page').append('<div class="modal fade text-center" id="editObject" role="dialog">' +
                    '<div class="modal-dialog">' +
                    '<div class="modal-content">' +
                    '<div class="modal-header">' +
                    '<button type="button" class="close" data-dismiss="modal">×</button>' +
                    '<h4>Редактирование объекта ' + objects[index].name + '</h4>' +
                    '</div>' +
                    '<div class="modal-body">' +
                    '<form method="POST" action="objects">' +
                    '<input type="hidden" name="objectId" value="' + objects[index].recordId + '">' +
                    '<p>' +
                    '<label for="editNameObj">Название объекта строительства</label>' +
                    '<input type="text" name="editNameObj" class="form-control" id="editNameObj" value="' + objects[index].name + '" required>' +
                    '</p>' +
                    '<p>' +
                    '<label for="editAddressObj">Адрес объекта строительства</label>' +
                    '<input type="text" name="editAddressObj" class="form-control" id="editAddressObj"value="' + objects[index].address + '">' +
                    '</p>' +
                    '<p>' +
                    '<label for="editNameCustomerObj">Название компании заказчика</label>' +
                    '<input type="text" name="editNameCustomerObj" class="form-control" id="editNameCustomerObj" value="' + objects[index].customer + '">' +
                    '</p>' +
                    '<p>' +
                    '<label for="editNameGenBuilderObj">Название компании генподрядчика</label>' +
                    '<input type="text" name="editNameGenBuilderObj" class="form-control" id="editNameGenBuilderObj" value="' + objects[index].generalBuilder + '">' +
                    '</p>' +
                    '<p>' +
                    '<label for="editDateStartObj">Дата начала работ</label>' +
                    '<input type="text" name="editDateStartObj" class="form-control" id="editDateStartObj" value="' + objects[index].dateCreated + '" required>' +
                    '</p>' +
                    '<p>' +
                    '<button type="submit" class="btn btn-default" id="btnEditObj" name="btnAction" value="edit">Изменить</button>' +
                    '</p>' +
                    '</form>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>');
            $("#editDateStartObj").datetimepicker({language: "ru", pickTime: false});
        }

        function changeStatus(index, value) {
            $('#changeStatus').remove();
            if (value === 0) {
                changeStatusToFinished(index);
            } else if (value === 1) {
                changeStatusToActive(index);
            }
        }

        function changeStatusToFinished(index) {
            $('.page').append('<div class="modal fade" id="changeStatus" role="dialog">' +
                    '<div class="modal-dialog">' +
                    '<div class="modal-content text-center">' +
                    '<div class="modal-header">' +
                    '<button type="button" class="close" data-dismiss="modal">×</button>' +
                    '<h4>Изменение статуса объекта</h4>' +
                    '</div>' +
                    '<div class="modal-body" style="color: #2D2D30">' +
                    '<form method="POST" action="objects">' +
                    '<p>Вы уверены, что хотите сделать завершённым объект <strong>' + activeObjects[index].name + '</strong>?</p>' +
                    '<p>В завершённые объекты нельзя будет добавлять новые данные</p>' +
                    '<input type="hidden" name="objectId" value="' + activeObjects[index].recordId + '">' +
                    '<p>' +
                    '<button type="submit" class="btn btn-default" id="btnChangeStatus" name="btnAction" value="changeStatusToFinished">Изменить</button>' +
                    '<button type="reset" class="btn btn-default" data-dismiss="modal">Отмена</button>' +
                    '</p>' +
                    '</form>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>');
        }

        function changeStatusToActive(index) {
            $('.page').append('<div class="modal fade" id="changeStatus" role="dialog">' +
                    '<div class="modal-dialog">' +
                    '<div class="modal-content text-center">' +
                    '<div class="modal-header">' +
                    '<button type="button" class="close" data-dismiss="modal">×</button>' +
                    '<h4>Изменение статуса объекта</h4>' +
                    '</div>' +
                    '<div class="modal-body" style="color: #2D2D30">' +
                    '<form method="POST" action="objects">' +
                    '<p>Вы уверены, что хотите сделать активным объект <strong>' + finishedObjects[index].name + '</strong>?</p>' +
                    '<input type="hidden" name="objectId" value="' + finishedObjects[index].recordId + '">' +
                    '<p>' +
                    '<button type="submit" class="btn btn-default" id="btnChangeStatus" name="btnAction" value="changeStatusToActive">Изменить</button>' +
                    '<button type="reset" class="btn btn-default" data-dismiss="modal">Отмена</button>' +
                    '</p>' +
                    '</form>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>');
        }

        function loadInfo(button, value) {
            var index = button.value;
            var objects = [];
            if (value === 0) {
                objects = activeObjects;
            } else if (value === 1) {
                objects = finishedObjects;
            }
            $('.box2').remove();
            $('.box4').remove();
            $('.about-col').append('<div class="box2">' +
                    '<div class="row subbox0">' +
                    '<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 subbox1">' +
                    '<p>Объект: <strong>' + objects[index].name + '</strong></p>' +
                    '<p>Адрес: <strong>' + objects[index].address + '</strong></p>' +
                    '<p>Начало производства работ: <strong>' + objects[index].dateCreated + '</strong></p>' +
                    '</div>' +
                    '<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 subbox2">' +
                    '<p>Заказчик: <strong>' + objects[index].customer + '</strong></p>' +
                    '<p>Генеральный подрядчик: <strong>' + objects[index].generalBuilder + '</strong></p>' +
                    '<p>Проектировщик: <strong>не указан</strong></p>' +
                    '</div>' +
                    '<p>Начальник участка: <strong>' + '<c:out value="${username}" />' + '</strong></p>' +
                    '<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#editObject" onclick="editObject(' + index + ',' + value + ')"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> Изменить</button>' +
                    (value === 0 ?
                            '<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#changeStatus" onclick="changeStatus(' + index + ',' + value + ')"><i class="glyphicon glyphicon-check" aria-hidden="true"></i> Сделать завершённым</button>' :
                            '<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#changeStatus" onclick="changeStatus(' + index + ',' + value + ')"><i class="glyphicon glyphicon-equalizer" aria-hidden="true"></i> Сделать активным</button>') +
                    '<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#deleteObj" onclick="deleteObject(' + index + ',' + value + ')"><i class="glyphicon glyphicon-minus" aria-hidden="true"></i> Удалить</button>' +
                    '</div>' +
                    '</div>' +
                    '<div class="box4"></div>');
            if (objects[index].placesCollection.length === 0) {
                $('.box4').append('<p>Участки строительства отсутствуют</p>');
            } else {
                $('.box4').append('<p>Участки строительства</p>');
                for (var i = 0; i < objects[index].placesCollection.length; i++) {
                    $('.box4').append('<p><button type="submit" class="btn btn-default btn-md" style="width: 75%">' + objects[index].placesCollection[i].name + '</button></p>');
                }
            }
            $('.box4').append('<p><button type="submit" class="btn btn-default btn-md"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i> Добавить участок</button></p>');
        }

        function showMessage() {
            $('#messageResult').remove();
            var message = null;
            var messageHeader = "Операция выполнена";
            if ("${messageResult}" === "statusChanged") {
                message = "Статус объекта был изменён";
            } else if ("${messageResult}" === "objectAdded") {
                message = "Объект успешно добавлен";
            } else if ("${messageResult}" === "objectChanged") {
                message = "Объект успешно изменён";
            } else if ("${messageResult}" === "objectDeleted") {
                message = "Объект успешно удален";
            } else if ("${messageResult}" === "fail") {
                messageHeader = "Произошла ошибка";
                message = "Пожалуйста, попробуйте ещё раз или свяжитесь с техподдержкой";
            }
            if (message !== null) {
                $('.page').append('<div class="modal fade" id="messageResult" role="dialog" data-backdrop="static" data-keyboard="false">' +
                        '<div class="modal-dialog">' +
                        '<div class="modal-content text-center">' +
                        '<div class="modal-header">' +
                        '<button type="button" class="close" data-dismiss="modal" onclick="refreshPage()">×</button>' +
                        '<h4>' + messageHeader + '</h4>' +
                        '</div>' +
                        '<div class="modal-body" style="color: #2D2D30">' +
                        '<p>' + message + '</p>' +
                        '<button type="button" class="btn btn-default" onclick="refreshPage()">Закрыть</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>');
                $("#messageResult").modal('show');
            }
        }

        function refreshPage() {
            window.location.replace('objects');
        }


        $(document).ready(function () {
            showActiveObjects();
            showFinishedObjects();
            showMessage();
        });
    </script>
    <!--<c:if test="${finishedObjects.size() == 0}">
        <h5>Пока нет завершённых объектов</h5>
    </c:if>  
    <c:forEach var="object" items="${finishedObjects}" varStatus="сounter">
        <li><button type="button" class="btn btn-default" value="${сounter.index}" id="objSelect" onclick="loadInfo(this, 1)">${object.name}</button></li>
    </c:forEach>-->
</html>

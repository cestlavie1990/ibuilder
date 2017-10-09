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
                                <c:forEach var="object" items="${activeObjects}" varStatus="сounter">
                                <li>
                                    <button type="button" class="btn btn-default objSelect" id="objSelect${object.recordId}"
                                            data-id="${object.recordId}"
                                            data-key="${object.uqKey}"
                                            data-name="<c:out value='${object.name}' />" 
                                            data-address="<c:out value='${object.address}' />" 
                                            data-customer="<c:out value='${object.customer}' />"
                                            data-genbuilder="<c:out value='${object.generalBuilder}' />" 
                                            data-date="<c:out value='${object.dateCreated}' />" 
                                            data-status="<c:out value='${object.isActive}' />">
                                        <c:out value='${object.name}' />
                                    </button>
                                </li>
                            </c:forEach>
                        </ul>
                        <a href="#finished-obj" data-toggle="collapse" id="finished-obj-btn">
                            <p style="margin-top: 5px;"><i class="glyphicon glyphicon-check" aria-hidden="true"></i> Завершённые объекты</p>
                        </a>
                        <ul class="nav nav-pills nav-stacked collapse" id="finished-obj">
                            <c:forEach var="object" items="${finishedObjects}" varStatus="сounter">
                                <li>
                                    <button type="button" class="btn btn-default objSelect" id="objSelect${object.recordId}"
                                            data-id="${object.recordId}"
                                            data-key="${object.uqKey}"
                                            data-name="<c:out value='${object.name}' />" 
                                            data-address="<c:out value='${object.address}' />" 
                                            data-customer="<c:out value='${object.customer}' />"
                                            data-genbuilder="<c:out value='${object.generalBuilder}' />" 
                                            data-date="<c:out value='${object.dateCreated}' />" 
                                            data-status="<c:out value='${object.isActive}' />">
                                        <c:out value='${object.name}' />
                                    </button>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 about-col">
                    <div class="box2">
                        <div class="row subbox0">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 subbox1">
                                <p>Объект: <strong id="objNameText"></strong></p>
                                <p>Адрес: <strong id="objAddressText"></strong></p>
                                <p>Начало производства работ: <strong id="objDateText"></strong></p>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 subbox2">
                                <p>Заказчик: <strong id="objCustomerText"></strong></p>
                                <p>Генеральный подрядчик: <strong id="objGenBuilderText"></strong></p>
                                <p>Проектировщик: <strong>не указан</strong></p>
                            </div>
                            <p>Начальник участка: <strong><c:out value="${username}" /></strong></p>
                            <button type="button" class="btn btn-default btn-md editObjBtn" id="" 
                                    data-toggle="modal" 
                                    data-target="#editObject" 
                                    data-editId="" 
                                    data-editKey="" 
                                    data-editName="" 
                                    data-editAddress="" 
                                    data-editCustomer="" 
                                    data-editGenBuilder="" 
                                    data-editDate="">
                                <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> Изменить</button>
                            <button type="button" class="btn btn-default btn-md changeStatusBtn" id=""
                                    data-toggle="modal" 
                                    data-target="#changeStatus" 
                                    data-chId="" 
                                    data-chKey="" 
                                    data-chName="" 
                                    data-chStatus="">
                            </button>
                            <button type="button" class="btn btn-default btn-md deleteObjBtn" id=""
                                    data-toggle="modal" 
                                    data-target="#deleteObj" 
                                    data-delId="" 
                                    data-delKey="" 
                                    data-delName="">
                                <i class="glyphicon glyphicon-minus" aria-hidden="true"></i> Удалить</button>
                        </div>
                    </div>
                    <div class="box4">
                        <p><button type="submit" class="btn btn-default btn-md"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i> Добавить участок</button></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="deleteObj" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content text-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4>Удаление объекта строительства</h4>
                    </div>
                    <div class="modal-body" style="color: #2D2D30">
                        <form method="POST" action="objects">
                            <p>Вы уверены, что хотите удалить объект <strong id="delObjNameText"></strong>?</p>
                            <p>После удаления данные уже невозможно будет восстановить</p>
                            <input type="hidden" id="delObjectId" name="objectId" value="">
                            <input type="hidden" id="delObjectKey" name="objectKey" value="">
                            <p>
                                <button type="submit" class="btn btn-default" name="btnAction" value="delete">Удалить</button>
                                <button type="reset" class="btn btn-default" data-dismiss="modal">Отмена</button>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade text-center" id="editObject" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4>Редактирование объекта </h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="objects">
                            <input type="hidden" id="editObjectId" name="objectId" value="">
                            <input type="hidden" id="editObjectKey" name="objectKey" value="">
                            <p>
                                <label for="editNameObj">Название объекта строительства</label>
                                <input type="text" name="editNameObj" class="form-control" id="editNameObj" value="" required>
                            </p>
                            <p>
                                <label for="editAddressObj">Адрес объекта строительства</label>
                                <input type="text" name="editAddressObj" class="form-control" id="editAddressObj" value="">
                            </p>
                            <p>
                                <label for="editNameCustomerObj">Название компании заказчика</label>
                                <input type="text" name="editNameCustomerObj" class="form-control" id="editNameCustomerObj" value="">
                            </p>
                            <p>
                                <label for="editNameGenBuilderObj">Название компании генподрядчика</label>
                                <input type="text" name="editNameGenBuilderObj" class="form-control" id="editNameGenBuilderObj" value="">
                            </p>
                            <p>
                                <label for="editDateStartObj">Дата начала работ</label>
                                <input type="text" name="editDateStartObj" class="form-control" id="editDateStartObj" value="" required>
                            </p>
                            <p>
                                <button type="submit" class="btn btn-default" id="btnEditObj" name="btnAction" value="edit">Изменить</button>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="changeStatus" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content text-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4>Изменение статуса объекта</h4>
                    </div>
                    <div class="modal-body" style="color: #2D2D30">
                        <form method="POST" action="objects">
                            <p>Вы уверены, что хотите сделать завершённым объект <strong id="chStatusNameText"></strong>?</p>
                            <p>В завершённые объекты нельзя будет добавлять новые данные</p>
                            <input type="hidden" id="chStatusObjectId" name="objectId" value="">
                            <input type="hidden" id="chStatusObjectKey" name="objectKey" value="">
                            <p>
                                <button type="submit" class="btn btn-default" id="btnSubmitChangeStatus" name="btnAction" value="">Изменить</button>
                                <button type="reset" class="btn btn-default" data-dismiss="modal">Отмена</button>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.about-col').hide();
            $("#dateStartObj").datetimepicker({language: "ru", pickTime: false});
            $("#editDateStartObj").datetimepicker({language: "ru", pickTime: false});
            showMessage();
        });

        //Меню
        $('.objSelect').click(function () {
            var id = $(this).data('id');
            var key = $(this).data('key');
            var name = $(this).data('name');
            var address = $(this).data('address');
            var date = $(this).data('date');
            var customer = $(this).data('customer');
            var genBuilder = $(this).data('genbuilder');
            var status = $(this).data('status');

            $('.about-col').show();
            $('#objNameText').html(name);
            $('#objAddressText').html(address);
            $('#objDateText').html(date);
            $('#objCustomerText').html(customer);
            $('#objGenBuilderText').html(genBuilder);

            $('.deleteObjBtn').attr('id', 'deleteObjBtn' + id);
            $('.deleteObjBtn').attr('data-delName', name);
            $('.deleteObjBtn').attr('data-delId', id);
            $('.deleteObjBtn').attr('data-delKey', key);

            $('.editObjBtn').attr('id', 'editObjBtn' + id);
            $('.editObjBtn').attr('data-editName', name);
            $('.editObjBtn').attr('data-editId', id);
            $('.editObjBtn').attr('data-editKey', key);
            $('.editObjBtn').attr('data-editAddress', address);
            $('.editObjBtn').attr('data-editCustomer', customer);
            $('.editObjBtn').attr('data-editGenBuilder', genBuilder);
            $('.editObjBtn').attr('data-editDate', date);

            if (status) {
                $('.changeStatusBtn').html('<i class="glyphicon glyphicon-check" aria-hidden="true"></i> Сделать завершенным');
            } else {
                $('.changeStatusBtn').html('<i class="glyphicon glyphicon-equalizer" aria-hidden="true"></i> Сделать активным');
            }
            $('.changeStatusBtn').attr('id', 'changeStatusBtn' + id);
            $('.changeStatusBtn').attr('data-chName', name);
            $('.changeStatusBtn').attr('data-chId', id);
            $('.changeStatusBtn').attr('data-chKey', key);
            $('.changeStatusBtn').attr('data-chStatus', status);
        });

        //Изменить статус
        $('.changeStatusBtn').click(function () {
            var status = $(this).attr('data-chStatus');

            $('#chStatusNameText').html($(this).attr('data-chName'));
            $('#chStatusObjectId').val($(this).attr('data-chId'));
            $('#chStatusObjectKey').val($(this).attr('data-chKey'));

            if (status === "true") {
                $('#btnSubmitChangeStatus').val('toFinished');
            } else {
                $('#btnSubmitChangeStatus').val('toActive');
            }
        });

        //Удаление
        $('.deleteObjBtn').click(function () {
            $('#delObjNameText').html($(this).attr('data-delName'));
            $('#delObjectId').val($(this).attr('data-delId'));
            $('#delObjectKey').val($(this).attr('data-delKey'));
        });

        //Редактирование
        $('.editObjBtn').click(function () {
            $('#editObjNameText').html($(this).attr('data-editName'));
            $('#editObjectId').val($(this).attr('data-editId'));
            $('#editObjectKey').val($(this).attr('data-editKey'));
            $('#editNameObj').val($(this).attr('data-editName'));
            $('#editAddressObj').val($(this).attr('data-editAddress'));
            $('#editNameCustomerObj').val($(this).attr('data-editCustomer'));
            $('#editNameGenBuilderObj').val($(this).attr('data-editGenBuilder'));
            $('#editDateStartObj').val($(this).attr('data-editDate'));
        });

        //Добавление
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
    </script>
</html>

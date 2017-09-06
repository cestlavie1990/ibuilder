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
        <script type="text/javascript" src="js/moment-with-locales.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Объекты строительства</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <div class="dropdown">
                        <span class="text">${username}</span>
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
                        <li><button type="button" class="btn btn-default btn-sm navbar-btn"><i class="glyphicon glyphicon-off" aria-hidden="true"></i> Выход</button></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="main-row">
            <div class="list-cell">
                <div class="box1">
                    <h4>${companyName}</h4>
                    <p>Всего активных объектов: <strong>${countAllActiveObjects}</strong></p>
                    <p>На контроле: <strong>${activeObjects.size()}</strong></p>
                </div>
                <div class="box2">
                    <h4>Объекты строительства</h4>
                    <a href="#active-obj" data-toggle="collapse" id="active-obj-btn">
                        <p style="margin-top: 5px;"><i class="glyphicon glyphicon-equalizer" aria-hidden="true"></i> Активные объекты</p>
                    </a>
                    <ul class="nav nav-pills nav-stacked collapse" id="active-obj">
                        <li><button type="submit" class="btn btn-default btn-sm"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i> Добавить</button></li>
                            <c:if test="${activeObjects.size() == 0}">
                            <h5>Активные объекты отсутствуют</h5>
                        </c:if>
                        <c:forEach var="i" begin="0" end="${activeObjects.size()-1}">
                            <li>
                                <button type="button" class="btn btn-default" value="${i}" id="objSelect" onclick='loadInfoA(this)'>
                                    ${activeObjects.get(i).name}
                                </button>
                            </li>
                        </c:forEach>
                    </ul>
                    <a href="#finished-obj" data-toggle="collapse" id="finished-obj-btn">
                        <p style="margin-top: 5px;"><i class="glyphicon glyphicon-check" aria-hidden="true"></i> Завершённые объекты</p>
                    </a>
                    <ul class="nav nav-pills nav-stacked collapse" id="finished-obj">
                        <c:if test="${finishedObjects.size() == 0}">
                            <h5>Завершённые объекты отсутствуют</h5>
                        </c:if>
                        <c:forEach var="i" begin="0" end="${finishedObjects.size()-1}">
                            <li>
                                <button type="button" class="btn btn-default" value="${i}" id="objSelect" onclick='loadInfoF(this)'>
                                    ${finishedObjects.get(i).name}
                                </button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="about-cell">
                <div class="area1">
                    <p>Пулковское ш.</p>
                    <p>адрес: Пулковское шоссе д. 35</p>
                    <p>заказчик: ОАО "ЛСР-БАЗОВЫЕ"</p>
                    <p>генеральный-подрядчик: ЗАО "ЛСР"</p>
                    <p>дата начала работ: 21.07.2017</p>
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
                recordId: '${place.recordId}',
                name: '${place.name}',
                dateCreated: '${place.dateCreated}'
            };
            ++count;
            </c:forEach>
            arrayObjects[index] = {
                recordId: '${object.recordId}',
                name: '${object.name}',
                address: '${object.address}',
                customer: '${object.customer}',
                generalBuilder: '${object.generalBuilder}',
                dateCreated: '${object.dateCreated}',
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
                recordId: '${place.recordId}',
                name: '${place.name}',
                dateCreated: '${place.dateCreated}'
            };
            ++count;
            </c:forEach>
            arrayObjects[index] = {
                recordId: '${object.recordId}',
                name: '${object.name}',
                address: '${object.address}',
                customer: '${object.customer}',
                generalBuilder: '${object.generalBuilder}',
                dateCreated: '${object.dateCreated}',
                placesCollection: places
            };
            ++index;
        </c:forEach>
            return arrayObjects;
        }

        var activeObjects = getActiveObjects();
        var finishedObjects = getFinishedObjects();

        function loadInfoA(button) {
            $('.area1').remove();
            $('.about-cell').append('<div class="area1" id="del"><p>' + button.value + '</p></div>');
        }

        function loadInfoF(button) {
            //alert(finishedObjects[button.value].name + " " + finishedObjects[button.value].recordId);
        }
    </script>
    <!--<body class="page">
        <div class="cont-page">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile text-center">
                        <h4>${user.name}</h4>
                        <p><button type="button" class="btn btn-primary btn-xs" onclick="location.href = 'logout'">Выйти из профиля</button></p>
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
    <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#addObjModal">Добавить</button>
    <a href="#active-obj" data-toggle="collapse" id="btn-collapse">
        <strong><p>Активные объекты</p></strong>
    </a>
    <ul class="nav nav-pills nav-stacked collapse" id="active-obj">
    <c:forEach var="object" items="${objects}">
        <a data-toggle="pill" href="#obj-content${object.recordId}" class="objectName"><li>${object.name}</li></a>     
    </c:forEach>
</ul>

<div class="modal fade" id="addObjModal" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4>Добавление объекта строительства</h4>
    </div>
    <div class="modal-body" style="color: #2D2D30">                                        
        <form method="POST" action="objects" class="reg-attr">
            <p>
                <label for="nameObj">Название объекта строительства</label>
                <input type="text" name="nameObj" class="form-control" id="nameObj" placeholder="Введите название объекта:">
            </p>
            <p>
                <label for="addressObj">Адрес объекта строительства</label>
                <input type="text" name="addressObj" class="form-control" id="addressObj" placeholder="Введите адрес объекта:">                                    
            </p>
            <p>
                <label for="nameCustomerObj">Название компании заказчика</label>
                <input type="text" name="nameCustomerObj" class="form-control" id="nameCustomerObj" placeholder="Заказчик:">                                    
            </p>
            <p>
                <label for="nameGenBuilderObj">Название компании генподрядчика</label>
                <input type="text" name="nameGenBuilderObj" class="form-control" id="nameGenBuilderObj" placeholder="Генподрядчик:">                                    
            </p>
            <p>
                <label for="dateStartObj">Дата начала работ</label>
                <input type="text" name="dateStartObj" class="form-control" id="dateStartObj" placeholder="Выберите дату:">
                <script type="text/javascript">
                    $(function () {
                        $('#dateStartObj').datetimepicker({language: 'ru', pickTime: false});
                    });
                </script>
            </p>
            <p>
                <button type="submit" class="btn btn-primary disabled" id="btnAddObj" name="btnAction" value="add">Добавить</button>                                    
            </p>                 
        </form>
    </div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-9">
<div class="tab-content text-center" id="tab-cont">
    <c:forEach var="object" items="${objects}">
        <div id="obj-content${object.recordId}" class="tab-pane fade">
            <div class="objects-about">
                <h4><strong>объект: ${object.name}</strong></h4>
                <h5>адрес: <strong>${object.address}</strong></h5>
                <h5>заказчик: <strong>${object.customer}</strong></h5>
                <h5>генеральный подрядчик: <strong>${object.generalBuilder}</strong></h5>
                <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editObjModal${object.recordId}">Изменить</button>

        <c:if test="${user.getRole() eq 'ADMINISTRATOR'}">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#deleteObjModal${object.recordId}">Удалить объект</button>

            <div class="modal fade" id="deleteObjModal${object.recordId}" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4>Удаление объекта строительства</h4>
                        </div>
                        <div class="modal-body" style="color: #2D2D30">                                        
                            <form method="POST" action="objects" class="reg-attr">
                                <p>Вы уверены, что хотите удалить объект <strong>${object.name}</strong>?</p>
                                <p>После удаления данные уже невозможно будет восстановить</p>
                                <input type="hidden" name="objectId" value="${object.recordId}">
                                <p>
                                    <button type="submit" class="btn btn-primary" id="btnDeleteObj" name="btnAction" value="delete">Удалить</button>
                                    <button type="reset" class="btn btn-primary" data-dismiss="modal">Отмена</button>
                                </p>                 
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <div class="modal fade" id="editObjModal${object.recordId}" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4>Редактирование объекта ${object.name}</h4>
                    </div>
                    <div class="modal-body" style="color: #2D2D30">                                        
                        <form method="POST" action="objects" class="reg-attr">
                            <input type="hidden" name="objectId" value="${object.recordId}">
                            <p>
                                <label for="editNameObj">Название объекта строительства</label>
                                <input type="text" name="editNameObj" class="form-control" id="editNameObj" placeholder="Введите название объекта:" value='${object.name}'>
                            </p>
                            <p>
                                <label for="editAddressObj">Адрес объекта строительства</label>
                                <input type="text" name="editAddressObj" class="form-control" id="editAddressObj" placeholder="Введите адрес объекта:" value='${object.address}'>                                    
                            </p>
                            <p>
                                <label for="editNameCustomerObj">Название компании заказчика</label>
                                <input type="text" name="editNameCustomerObj" class="form-control" id="editNameCustomerObj" placeholder="Заказчик:" value='${object.customer}'>                                    
                            </p>
                            <p>
                                <label for="editNameGenBuilderObj">Название компании генподрядчика</label>
                                <input type="text" name="editNameGenBuilderObj" class="form-control" id="editNameGenBuilderObj" placeholder="Генподрядчик:" value='${object.generalBuilder}'>                                    
                            </p>
                            <p>
                                <label for="editDateStartObj">Дата начала работ</label>
                                <input type="text" name="editDateStartObj" class="form-control" id="editDateStartObj" placeholder="Выберите дату:">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#editDateStartObj').datetimepicker({language: 'ru', pickTime: false});
                                    });
                                </script>
                            </p>
                            <p>
                                <button type="submit" class="btn btn-primary" id="btnEditObj" name="btnAction" value="edit">Изменить</button>
                                <button type="reset" class="btn btn-primary" data-dismiss="modal">Отмена</button>
                            </p>                 
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="objects-places">
        <h4>Участки строительства</h4>
        <button type="button" class="btn btn-primary btn-md">Добавить</button>
        <button type="button" class="btn btn-primary btn-md">Удалить</button>
        <ul class="nav nav-pills nav-stacked" id="places">
        <c:if test="${object.getPlacesCollection().size() eq 0}">
            <h3>Объект не имеет участков строительства</h3>
            <h4>Чтобы добавить участок нажмите на соответствующую кнопку сверху</h4>
        </c:if>                                            
        <c:if test="${object.getPlacesCollection().size() gt 0}">
            <c:forEach var="place" items="${object.getPlacesCollection()}">
                <li><a href="#"><p>${place.name}</p></a></li>
            </c:forEach>
        </c:if>
</ul>                        
</div>
</div>
    </c:forEach>
</div>
</div>
</div>
</div>
<script type="text/javascript">
$(document).on('input', '#nameObj', function () {
if ($('#nameObj').val().trim().length !== 0) {
$('#btnAddObj').removeClass('disabled');
} else {
$('#btnAddObj').addClass('disabled');
}
});
$(document).on('input', '#editNameObj', function () {
if ($('#editNameObj').val().trim().length !== 0) {
$('#btnEditObj').removeClass('disabled');
} else {
$('#btnEditObj').addClass('disabled');
}
});
</script>
</body>-->
</html>

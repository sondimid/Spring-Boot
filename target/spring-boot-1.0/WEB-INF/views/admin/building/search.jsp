<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingSearch" value="/admin/building-search"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        Danh Sách Tòa Nhà
    </title>
</head>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb" style="font-family: 'Times New Roman', Times, serif;">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#" style="font-size: large;">Home</a>
                </li>
                <li class="active" style="font-size: larger;">Tìm Kiếm Tòa Nhà</li>
            </ul><!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form class="form-search">
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content" style="font-family: 'Times New Roman', Times, serif;">

            <div class="page-header">
                <h1 style="font-family: 'Times New Roman', Times, serif;">
                    Tìm Kiếm Tòa Nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm Kiếm</h4>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body" style="font-family:'Times New Roman', Times, serif">
                            <div class=" widget-main">
                                <form:form id="listForm" action="${buildingSearch}" method="GET"
                                           modelAttribute="buildingSearch">
                                    <input type="hidden" name="currentPage" value="${currentPage}"/>
                                    <div class="row">
                                        <form class="form-horizontal" role="form" id="buildingId">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <label class="name">
                                                            Tên Tòa Nhà
                                                        </label>
                                                        <form:input type="text" class="form-control" path="name"/>
                                                    </div>

                                                    <div class="col-xs-6">
                                                        <label class="name">
                                                            Diện Tích Sàn
                                                        </label>
                                                        <form:input type="number" class="form-control"
                                                                    path="floorArea"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-2">
                                                        <label class="name">
                                                            Quận Hiện Có
                                                        </label>
                                                        <form:select class="form-control" path="district">
                                                            <form:option value="">---Chọn Quận----</form:option>
                                                            <form:options items="${districts}"></form:options>
                                                        </form:select>
                                                    </div>

                                                    <div class="col-xs-5">
                                                        <label class="name">
                                                            Phường
                                                        </label>
                                                        <form:input type="text" class="form-control" path="ward"/>
                                                    </div>

                                                    <div class="col-xs-5">
                                                        <label class="name">
                                                            Đường
                                                        </label>
                                                        <form:input type="text" class="form-control" path="street"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-4">
                                                        <label class="name">
                                                            Số Tâng Hầm
                                                        </label>
                                                        <form:input type="number" class="form-control"
                                                                    path="numberOfBasement"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">
                                                            Hướng
                                                        </label>
                                                        <form:input type="text" class="form-control"
                                                                    path="direction"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">
                                                            Hạng
                                                        </label>
                                                        <form:input type="number" class="form-control"
                                                                    path="level"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label class="name">
                                                            Diện Tích Từ
                                                        </label>
                                                        <form:input class="form-control" path="rentAreaFrom"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">
                                                            Diện Tích Đến
                                                        </label>
                                                        <form:input class="form-control" path="rentAreaTo"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">
                                                            Giá Thuê Từ
                                                        </label>
                                                        <form:input type="number" class="form-control"
                                                                    path="rentPriceFrom"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">
                                                            Giá Thuê Đến
                                                        </label>
                                                        <form:input type="number" class="form-control"
                                                                    path="rentPriceTo"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-5">
                                                        <label class="name">
                                                            Tên Quản Lý
                                                        </label>
                                                        <form:input type="text" class="form-control"
                                                                    path="managerName"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">
                                                            Điện Thoại Người Quản Lý
                                                        </label>
                                                        <form:input type="text" class="form-control"
                                                                    path="managerPhone"/>
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <label class="name">
                                                            Chọn Nhân Viên Phụ Trách
                                                        </label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">---Chọn Nhân Viên---</form:option>
                                                            <form:options items="${listStaffs}"></form:options>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <form:checkboxes items="${type}" path="typeCode"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button class="btn btn-info"
                                                                style="margin-top: 10px; border-radius: 10px;"
                                                                name="btnSearchBuilding">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                 height="16" fill="currentColor" class="bi bi-search"
                                                                 viewBox="0 0 16 16">
                                                                <path
                                                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                                            </svg>
                                                            Tìm Kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pull-right" style="margin-top: 10px; margin-bottom: 5px">
                    <a href="/admin/building-edit">
                        <div class="btn btn-info" title="Thêm Tòa Nhà"
                             style="border-radius: 10px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                <path
                                        d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                <path
                                        d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                <path
                                        d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </div>
                    </a>

                </div>
                <table id="simple-table" class="table table-striped table-bordered table-hover"
                       style="margin-top: 30px">
                    <thead>
                    <tr>
                        <th class="center">
                            <label class="pos-rel">
                            </label>
                        </th>
                        <th>Tên Tòa Nhà</th>
                        <th>Địa Chỉ</th>
                        <th>Số Tầng Hầm</th>
                        <th>Tên Quản Lý</th>
                        <th>Số Điện Thoại</th>
                        <th>Diện Tích Sàn</th>
                        <th>Diện Tích Trống</th>
                        <th>Giá Thuê</th>
                        <th>Diện Tích Thuê</th>
                        <th>Phí Dịch Vụ</th>
                        <th>Phí Môi Giới</th>
                        <th>Thao Tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${buildingResponses}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" name="checkList" value="${item.id}" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>${item.name}</td>
                            <td>${item.address}</td>
                            <td>${item.numberOfBasement}</td>
                            <td>${item.managerName}</td>
                            <td>${item.managerPhone}</td>
                            <td>${item.floorArea}</td>
                            <td>${item.emptyArea}</td>
                            <td>${item.rentPrice}</td>
                            <td>${item.rentArea}</td>
                            <td>${item.serviceFee}</td>
                            <td>${item.brokerageFee}</td>
                            <td>
                                <div style="display: flex; align-items: center;">
                                    <button class="btn btn-xs btn-info" title="Giao Tòa Nhà"
                                            style="margin-right: 10px; border-radius: 10px; font-size:larger"
                                            onclick="assignmentBuilding(${item.id})">
                                        <i class="ace-icon glyphicon glyphicon-list" style="margin: auto"></i>
                                    </button>

                                    <a href="/admin/building-edit-${item.id}">
                                        <button class="btn btn-xs btn-info2" title="Sửa Thông Tin Tòa Nhà"
                                                style="margin-right: 10px; border-radius: 10px; font-size:larger">
                                            <i class="ace-icon fa fa-cog" style="margin: auto"></i>
                                        </button>
                                    </a>

                                    <button class="btn btn-xs btn-danger" title="Xóa Tòa Nhà" type="button"
                                            onclick="deleteBuilding(${item.id})"
                                            style="border-radius: 10px; font-size:larger">
                                        <i class="ace-icon glyphicon glyphicon-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example">
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <button class="pagination-button" data-page="${currentPage - 1}">Previous</button>
                        </c:if>

                        <c:if test="${currentPage <= 1}">
                            <button class="pagination-button disable" disabled>Previous</button>
                        </c:if>

                        <li class="page-item">
                            <a class="page-link current-page">
                                ${currentPage}
                            </a>
                        </li>

                        <c:if test="${currentPage < totalPages}">
                            <button class="pagination-button" data-page="${currentPage + 1}">Next</button>
                        </c:if>

                        <c:if test="${currentPage >= totalPages}">
                            <button class="pagination-button disable" disabled>Next</button>
                        </c:if>
                    </div>
                </nav>


                <div class="pull-right" style="margin-top: 10px">
                    <div class="btn btn-danger" title="Xóa Tòa Nhà" id=btnDeleteBuildings
                         style="border-radius: 10px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                             fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                            <path
                                    d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                            <path
                                    d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                            <path
                                    d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.row -->
</div><!-- /.main-content -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh Sách Nhân Viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" style="margin-top: 30px"
                       id="staffList">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th class="center">Tên Nhân Viên</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

                <input type="hidden" value="" id="buildingIdAssignment"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" style="border-radius: 15px;"
                        id="btnAssignmentBuilding">Giao Tòa Nhà
                </button>
                <button type="button" class="btn btn-danger" data-dismiss="modal"
                        style="border-radius:  15px;">Đóng
                </button>
            </div>
        </div>

    </div>
</div>
<!-- Modal Success -->
<div class="modal fade" id="successModal" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #3498db; color: white; border-radius: 10px;">
            <!-- Modal Body with centered "Success" text -->
            <div class="modal-body text-center">
                <h2>Success</h2>
            </div>

            <!-- Modal Footer with a centered button -->
            <div class="modal-footer justify-content-center" style="border-top: none;">
                <button type="button" class="btn btn-light btn-lg" data-dismiss="modal" style="color: #3498db;"
                        id="btnOkModal">
                    OK
                </button>
            </div>
        </div>
    </div>
</div>

<style>
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
    }

    .pagination-button {
        background-color: #75a3bb;
        color: white;
        border: none;
        padding: 10px 20px;
        margin: 0 5px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .pagination-button:hover {
        background-color: #75a3bb; /* Màu nền khi hover */
    }

    .pagination-button:disabled {
        background-color: #c8ccd6; /* Màu nền cho nút bị vô hiệu hóa */
        cursor: not-allowed; /* Con trỏ không cho phép */
    }

    .page-link {
        text-decoration: none;
        color: #007bff;
        padding: 10px 15px;
        font-size: 18px;
    }

    #SuccessModal .modal-content {
        background-color: #3498db; /* Blue background */
    }

    #SuccessModal .modal-body h2 {
        font-size: 36px;
        font-weight: bold;
    }

    #SuccessModal .btn-light {
        background-color: white;
        border: none;
        padding: 10px 20px;
    }

    #SuccessModal .btn-light:hover {
        background-color: #ecf0f1;
    }
</style>
<script>

    function changePage(page) {
        $('#listForm').append('<input type="hidden" name="page" value="' + page + '"/>');
        $('#listForm').submit();
    }

    $('.pagination-button').click(function (e) {
        e.preventDefault();
        var page = $(this).data('page');
        changePage(page);
    });

    $('#btnOkModal').click(function () {
        window.location.href = "/admin/building-search";
    });

    function addOrUpdateBuilding(buildingId) {
        var data = {};
        data['id'] = buildingId;
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
        });
    }

    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
        loadStaffs(buildingId);
        $('#buildingIdAssignment').val(buildingId);
    }

    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingIdAssignment').val();
        var staffs = $('#staffList tbody input[type="checkbox"]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffIds'] = staffs;
        $.ajax({
            type: "POST",
            url: "${buildingAPI}" + "/assignmentBuilding",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
        });
        $('#successModal').modal();
    })

    function loadStaffs(buildingId) {
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + '/staffs',
            success: function (response) {
                var row = "";
                $.each(response.data, function (index, item) {
                    row += " <tr> ";
                    row += " <td class='text-center'> ";
                    row += " <input type='checkbox' value='" + item.staffId + "' id='checkbox_" + item.staffId + "' " + (item.checked ? "checked" : "") + ">";
                    row += " </td> ";
                    row += " <td class='text-center'>" + item.fullName + "</td>";
                    row += " </tr> ";
                });
                $('#staffList tbody').html(row);
            }
        });
    }

    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    })

    function deleteBuilding(data) {
        var buildingId = [data]
        deleteBuildings(buildingId);
    }

    $('#btnDeleteBuildings').click(function (e) {
        e.preventDefault();
        var buildingIds = $('#simple-table tbody input[type="checkbox"]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    })

    function deleteBuildings(data) {
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
        });
        $('#successModal').modal();
    }
</script>
</html>


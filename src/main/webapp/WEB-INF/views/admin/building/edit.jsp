<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm Tòa Nhà</title>
</head>
<body>
<div class="main-content" style="font-family: 'Times New Roman', Times, serif;">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }

            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#" style="font-size: large;">Home</a>
                </li>
                <li class="active" style="font-size: larger;">Thêm Tòa Nhà</li>
            </ul><!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form class="form-search">
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Thêm Tòa Nhà
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <form:form id="formList" method="GET" modelAttribute="buildingEdit">
                    <form class="form-horizontal" role="form">
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">Tên Tòa Nhà</label>
                            </div>
                            <div class="col-xs-10">
                                <form:input path="name" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">

                            <div class="col-xs-2">
                                <label class="name">
                                    Quận
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:select class="form-control" path="district">
                                    <form:option value="">---Chọn Quận----</form:option>
                                    <form:options items="${districts}"></form:options>
                                </form:select>
                            </div>
                        </div>

                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Phường
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="ward" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Đường
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="street" class="form-control"/>
                            </div>
                        </div>


                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Kết Cấu
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="structure" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Số Tầng Hầm
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="numberOfBasement" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Diện Tích Sàn
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="floorArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Hướng
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="direction" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Hạng
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="level" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Diện Tích Thuê
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="rentArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Giá Thuê
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="rentPrice" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Mô Tả Giá
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="rentPriceDescription" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Phí Dịch Vụ
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="serviceFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Phí Ô Tô
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="carFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Phí Mô Tô
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="motoFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Phí Ngoài Giờ
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="overtimeFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Tiền Điện
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="electricityFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Đặt Cọc
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="deposit" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Thanh Toán
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="payment" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Thời Hạn Thuê
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="rentTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Thời Gian Trang Trí
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="decorationTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Tên Quản Lý
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="managerName" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    SĐT Quản Lý
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="managerPhone" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="col-xs-2">
                                <label class="name">
                                    Phí Môi Giới
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <form:input path="brokerageFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px" id="typeCode">
                            <div class="col-xs-2">
                                <label class="name">
                                    Loại Tòa Nhà
                                </label>
                            </div>

                            <div class="col-xs-6">
                                <form:checkboxes items="${type}" path="type"/>
                            </div>

                        </div>

                        <div class="col-xs-12" style="margin-top:15px; margin-bottom: 30px;">
                            <div class="col-xs-2">
                                <label class="name">
                                    Hình Ảnh
                                </label>
                            </div>

                            <div class="col-xs-10">
                                <input type="image" id="form-field-23" class="form-control"
                                       style="width: 100%; height: auto;">
                            </div>
                        </div>
                        <div class="col-xs-12" style="text-align: center">
                            <c:if test="${not empty buildingEdit.id}">
                                <button class="btn btn-info" id="btnAddOrUpdateBuilding" type="button"
                                        style="font-size: 18px; margin-right: 25px; border-radius: 10px;">
                                    Sửa Thông Tin Tòa Nhà
                                </button>

                                <button class="btn btn-danger" id="btnCancel" type="button"
                                        style="font-size: 18px; margin-right: 25px; border-radius: 10px;">
                                    Cancel
                                </button>
                            </c:if>
                            <c:if test="${empty buildingEdit.id}">
                                <button class="btn btn-info" id="btnAddOrUpdateBuilding" type="button"
                                        style="font-size: 18px; margin-right: 25px; border-radius: 10px">
                                    Thêm Mới Tòa Nhà
                                </button>
                                <button class="btn btn-danger" id="btnCancel" type="button"
                                        style="font-size: 18px; margin-right: 25px; border-radius: 10px;">
                                    Cancel
                                </button>
                            </c:if>
                        </div>
                        <form:hidden path="id" id="buildingId"></form:hidden>
                    </form>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Success -->
<div class="modal fade" id="addSuccessModal" style="display: none;" aria-hidden="true">
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
    #addSuccessModal .modal-content {
        background-color: #3498db; /* Blue background */
    }

    #addSuccessModal .modal-body h2 {
        font-size: 36px;
        font-weight: bold;
    }

    #addSuccessModal .btn-light {
        background-color: white;
        border: none;
        padding: 10px 20px;
    }

    #addSuccessModal .btn-light:hover {
        background-color: #ecf0f1;
    }
</style>

<script>
    $('#btnAddOrUpdateBuilding').click(function () {
        var data = {};
        var type = [];
        var formData = $('#formList').serializeArray();
        $.each(formData, function (i, value) {
            if (value.name != 'type') {
                data["" + value.name + ""] = value.value;
            } else {
                type.push(value.value);
            }
        });
        data['type'] = type;
        //call api
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
        });

        $('#addSuccessModal').modal();

    });

    $('#btnCancel').click(function () {
        window.location.href = "/admin/building-search";
    });

    $('#btnOkModal').click(function () {
        window.location.href = "/admin/building-search";
    });
</script>
</body>
</html>

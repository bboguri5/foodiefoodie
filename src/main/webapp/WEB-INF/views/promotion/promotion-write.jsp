<%@ page contentType='text/html; charset=UTF-8' language='java' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>document</title>
</head>
<body>
    <div class="box_general padding_bottom">
        <div class="header_box version_2">
            <h2><i class="fa fa-dollar"></i>Pricing</h2>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h6>Item</h6>
                <table id="pricing-list-container" style="width:100%;">
                    <tbody><tr class="pricing-list-item">
                        <td>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Title">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Description">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Price">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                <tr class="pricing-list-item">
                        <td>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Title">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Description">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Price">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr></tbody></table>
                <a href="#0" class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>Add Item</a>
            </div>
        </div>
        <!-- /row-->
    </div>

</body>
</html>
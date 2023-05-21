<%@ page import="entity.Nguoi" %>
<%@ page import="entity.Donhang" %>
<%@ page import="entity.DHNK" %>
<%@ page import="dao.DAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="css/default.css">
  <link rel="stylesheet" href="css/layout.css">
  <title>Express_DN</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div id="listOrderXNK"> 
        <div class="container e">
          <div class="formAddOrder">
            <h2 class="tiltle_order b" >CHI TIẾT ĐƠN HÀNG</h2>
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item">

                <div class="accordion-body">
                <div class="readMoreForm">
                  <form action="" class="row g-6">
                    <div class="c"> <p class="title_formAccor">MĐH: <span class="d">${id}</span></p><p class="title_formAccor">Trạng thái: <span class="d">${hh.trangthai}</span></p></div>
                    <p class="title_formAccor">Thông tin khách hàng</p>
                    <div class="col-md-3">
                      <label for="validationSenderName" class="form-label">Tên khách hàng:</label>
                      <div class="input-group has-validation">
                        <input type="text" class="form-control" id="input_nameSender" value="${kh.ten}" disabled>
                      </div>
                    </div>

                    <div class="col-md-3">
                      <label for="validationSenderCCCD" class="form-label">Số CCCD/CMND:</label>
                      <div class="input-group has-validation">
                        <input type="text" class="form-control "value="${kh.cmnd}"id="input_CCCDSender" disabled>
                      </div>
                    </div>

                    <div class="col-md-3">
                      <label for="validationSenderPhone" class="form-label">Số Điện Thoại:</label>
                      <div class="input-group has-validation">
                        <input type="text" class="form-control" value="${kh.sdt}" id="input_gmailSender" disabled>
                      </div>
                    </div>
                
                    <div class="col-md-3">
                      <label for="validationNameSenderGmail" class="form-label">Gmail:</label>
                      <input type="text" class="form-control" id="input_gmailSender" value="${kh.email}" disabled>
                    </div>
                    <p class="title_address">Địa chỉ người gửi:</p>
                    <div class="col-md-3">
                      <select class="form-select" id="selectCity" disabled>
                   
                        <option selected disabled>Đà Nẵng</option>
                        <option>Hà Nội</option>
                        <option>Tp.Hồ Chí Minh</option>
                        <option>Quảng Nam</option>
                      </select>
                    </div>

                    <div class="col-md-3">
                      <select class="form-select" id="selectDistrict" disabled>
  
                        <option selected disabled>Hải Châu</option>
                        <option>Liên chiểu</option>
                        <option>Cẩm Lệ</option>
                        <option>Hoà Vang</option>
                      </select>
                    </div>

                    <div class="col-md-3">
                      <select class="form-select" id="selectVillage" disabled>
                   
                        <option selected disabled>Thanh Bình</option>
                        <option>Hoà Khánh Bắc</option>
                        <option>Hoà Khánh Nam</option>
                        <option>Thuận Phước</option>
                      </select>
                    </div>

                    <div class="col-md-3">
                      <div class="input-group has-validation">
                        <input type="text" class="form-control"value="${kh.diachi}" id="inputNumberAddress" disabled>
                      </div>
                    </div>
                    <p class="title_formAccor">Thông tin hàng hóa</p>
                            <div class="inf-GoodsTable">
                              <table class="table" id="table_ImportGood">
                                <thead>
                                  <tr>
                                    <th scope="col">Tên hàng hoá</th>
                                    <th scope="col">Loại Hàng</th>
                                    <th scope="col">Cân nặng</th>
                                    <th scope="col">Ghi chú</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>${hh.ten}</td>
                                    <td>${hh.loai}</td>
                                    <td>${hh.ngaytao}</td>
                                    <td>...</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                            <p class="title_formAccor">Nhập kho</p>
                                  <div class="accordion-body">
                                    <div class="inf-GoodsTable">
                                      <table class="table" id="table_ImportGood">
                                        <thead>
                                          <tr>
                                            <th scope="col">Mã phiếu nhập</th>
                                            <th scope="col">Kho</th>
                                            <th scope="col">Ngày nhập</th>
                                            <th scope="col">Nhân viên</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td>${pn.id}</td>
                                            <td>${pn.kho}/${pn.khu}</td>
                                            <td>${pn.ngaytao}</td>
                                            <td>${pn.ten}</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <p class="title_formAccor">Xuất kho</p>
                                  <div class="accordion-body">
                                    <div class="inf-GoodsTable">
                                      <table class="table" id="table_ImportGood">
                                        <thead>
                                          <tr>
                                            <th scope="col">Mã phiếu xuất</th>
                                            <th scope="col">Hình thức</th>
                                            <th scope="col">Ngày xuất</th>
                                            <th scope="col">Nhân viên</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td>${px.id}</td>
                                            <td>${px.loai}</td>
                                            <td>${px.ngaytao}</td>
                                            <td>${px.ten}</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <div class="btn_AddOrder">
                                    <div onclick="(navigateToLink('main.jsp'))" class="btn btn-dark button1" >Quay lại</div>
                                    <div class="btn btn-primary button2">In</div>
                                  </div>
                  </form>
                </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
      crossorigin="anonymous"></script>
    <script src="js/main.js"></script>
</body>
</html>
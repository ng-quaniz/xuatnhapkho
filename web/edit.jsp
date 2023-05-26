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

     <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
      crossorigin="anonymous"></script>
    <script src="js/main.js"></script>
  <title>Express_DN</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
 <div id="listOrder4">
                  <div class="container">
                    <h2>Chỉnh sửa</h2>
                    <div class="formAddOrder" action="addD" method="post">
                      <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
    
                          <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
                            <div class="accordion-body">
                              <div class="sender_form">
                                <form action="edit?id=${id}" method="post" class="row g-6"  >
                                    <div class="c"> <p class="title_formAccor">Mã đơn hàng: <span class="d">${id}</span></p></div>
                                <p class="title_formAccor">Thông Tin Khách Hàng : <span>${kh.id}</span></p>
                                  <div class="col-md-3">
                                    <label for="validationSenderName" class="form-label">Tên khách hàng:</label>
                                    <div class="input-group has-validation">
                                      <input name="edit_tenk" type="text" class="form-control "placeholder="" id="input_nameSender" value="${kh.ten}" required>
                                    </div>
                                  </div>
  
                                  <div class="col-md-3">
                                    <label for="validationSenderCCCD" class="form-label">Số CCCD/CMND:</label>
                                    <div class="input-group has-validation">
                                      <input name ="edit_cmndk" type="text" class="form-control "placeholder="" id="input_CCCDSender" value="${kh.cmnd}"  required>
                                    </div>
                                  </div>
  
                                  <div class="col-md-3">
                                    <label for="validationSenderPhone" class="form-label">Số Điện Thoại:</label>
                                    <div class="input-group has-validation">
                                      <input name="edit_sdtk" type="text" class="form-control "placeholder="" id="input_gmailSender" value="${kh.sdt}"  required>
                                    </div>
                                  </div>
                              
                                  <div class="col-md-3">
                                    <label for="validationNameSenderGmail" class="form-label">Email:</label>
                                    <input name ="edit_emailk" type="text" class="form-control " id="input_gmailSender" value="${kh.email}"  required>
                                  </div>
                                  <p class="title_address">Địa chỉ khách hàng: </p>
                                  <div class="col-md-3">
                                    <select class="form-select" id="selectCity" required>
                                    
                                      <option selected>Đà Nẵng</option>
                                      <option>Hà Nội</option>
                                      <option>Tp.Hồ Chí Minh</option>
                                      <option>Quảng Nam</option>
                                    </select>
                                  </div>
  
                                  <div class="col-md-3">
                                    <select class="form-select" id="selectDistrict" required>
           
                                      <option selected>Hải Châu</option>
                                      <option>Liên chiểu</option>
                                      <option>Cẩm Lệ</option>
                                      <option>Hoà Vang</option>
                                    </select>
                                  </div>
  
                                  <div class="col-md-3">
                                    <select class="form-select" id="selectVillage" required>
                               
                                      <option selected>Thanh Bình</option>
                                      <option>Hoà Khánh Bắc</option>
                                      <option>Hoà Khánh Nam</option>
                                      <option>Thuận Phước</option>
                                    </select>
                                  </div>
  
                                  <div class="col-md-3">
                                    <div class="input-group has-validation">
                                      <input name ="edit_dchik" type="text" class="form-control"placeholder="" id="inputNumberAddress" value="${kh.diachi}"  required>
                                    </div>
                                  </div>

                                  <p class="title_formAccor">Thông Tin Hàng Hoá : </p>
                                  
                                    <div class="col-md-12">
                                    <p class="form-label">Mã đơn hàng - Loại:</p>
                                    <input class="form-control" value="${hh.id}: ${hh.loai}" disabled>

                                  </div>
                                  <div class="col-md-6">
                                    <label for="validationGoodsName" class="title_address">Tên hàng hoá:</label>
                                    <div class="input-group has-validation">
                                      <input name="edit_tenh" type="text" class="form-control " value="${hh.ten}"  required>
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <label for="validationReceiverGoodWeight" class="title_address">Cân nặng (Kg):</label>
                                    <div class="input-group has-validation">
                                      <input name="edit_cannang" type="text" class="form-control " value="${hh.ngaytao}" required>
                                    </div>
                                  </div>
                                                                 
                                  
                                    <div class="btn_AddOrder">
                                        <div onclick="(navigateToLink('loadCT?id=${id}'))" class="btn btn-dark button4" >Quay lại</div>
                                        <input type="submit" class="btn btn-primary"  value="Tạo Đơn">
                                        </div>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      
                    </div>
                  </div>
                </div>
                                          
    
</body>
</html>
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
    <div id="listOrderXNK"> 
        <div class="container e">
          <div class="formAddOrder">
            <h2 class="tiltle_order b" >Đơn Nhập Kho</h2>
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item" >

                <div class="accordion-body">
                <div class="readMoreForm">
                  <form  class="row g-6" id="myForm">
                      <div class="c"> <p class="title_formAccor">Mã: <span class="d" id="name">${pn.id}-${id}</span></p><p class="title_formAccor">Ngày nhập: <span class="d">${pn.ngaytao}</span></p></div>
                        <div class="c"> <p class="title_formAccor">Kho: <span class="d" id="name">${pn.kho}</span>  Khu: <span class="d" id="name">${pn.khu}</span> </p></div>
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
                                    <th scope="col">Mã hàng hóa </th>
                                    <th scope="col">Tên hàng hoá</th>
                                    <th scope="col">Loại Hàng - loại chứa</th>
                                    <th scope="col">Cân nặng</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>${hh.id}</td>
                                    <td>${hh.ten}</td>
                                    <td>${hh.loai}</td>
                                    <td>${hh.ngaytao}</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                  </form>
                                                                                       
                                    
                </div>
                </div>
              </div>
                                          <div class="btn_AddOrder">
                                    <div onclick="(navigateToLink('loadCT?id=${id}'))" class="btn btn-dark button4" >Quay lại</div>
                                    <div class="btn btn-primary button3" onclick="exportToPDF()">Xuất</div>
                                  </div>
            </div>
          </div>
                                          
        </div>
                                     
      </div>
                                          
    
</body>
</html>
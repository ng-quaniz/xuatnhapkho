<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="entity.Nguoi" %>
<%@ page import="entity.Donhang" %>
<%@page import="java.util.*"%>
<%@ page import="entity.Loai" %>
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
  <div class="wrapper">
<jsp:include page="header.jsp"></jsp:include>
    <div class="employ_form">
      <div class="container-fluid">
        <div class="d-flex align-items-start">
          <nav class="nav flex-column nav-pills me-3" id="navbar-tab" role="tablist" aria-orientation="vertical">
              <button class="nav-link active" id="tab_list_order" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">ĐƠN HÀNG</button>
              <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">NHẬP KHO</button>
              <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">XUẤT KHO</button>
              <button class="nav-link" id="tab_add_order" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">TẠO ĐƠN HÀNG</button>
          </nav>
          <main class="tab-content" id="v-pills-tabContent">
            <!--đơn hàng -->
            <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="tab_list_order" tabindex="0">
              <div class="list_order" id="listOrder1">
                <div class="container">
                  <h2 class="tiltle_order">ĐƠN HÀNG</h2>
                <form action="" class="form_Listorder">
                  <div class="input_item">
                    <input type="input" name="search_input" class="form-control">
                    <i class="bi bi-search"></i>
                  </div>
                </form>
                <table>
                  <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Tên đơn hàng</th>
                        <th scope="col">Tên khách hàng</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Ngày tạo đơn</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%  DAO dao = new DAO(); 
                            List<Donhang> listD = dao.getAllDonhang();
                            for(Donhang d : listD) {%>
                      <tr>
                        <th scope="row"><%=d.getId()%></th>
                        <td><%=d.getTen()%></td>
                        <td><%=d.getLoai()%></td>
                        <td><%=d.getTrangthai()%></td>
                        <td><%=d.getNgaytao()%></td>
                      </tr>
                      <%};%>
                    </tbody>
                  </table>
                </table>
                <nav aria-label="Page navigation example" class="pagi_btn">
                  <ul class="pagination">
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">
                          <<</span>
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">>></span>
                      </a>
                    </li>
                  </ul>
                </nav>
                </div>
              </div>
            </div>
            <!-- nhập kho -->
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="0">
              <section class="list_order" id="listImportWare">
                <h2 class="tiltle_order">NHẬP KHO</h2>
                <div id="tableNK"> 
                  <form id="search" class="form_Listorder">
                    <div class="input_item">
                      <input type="input" name="search_input" class="form-control">
                      <i class="bi bi-search"></i>
                    </div>
                  </form>
                  <table>
                    <table class="table" id="tableImportWare">
                      <thead>
                        <tr>
                          <th scope="col">Mã đơn hàng</th>
                          <th scope="col">Tên Đơn hàng</th>
                          <th scope="col">Loại hàng hoá</th>
                          <th scope="col">Ngày</th>
                          <th scope="col">Ghi chú</th>
                        </tr>
                      </thead>
                      <tbody>
                            <%
                            List<Donhang> listDD = dao.getAllDonhangDD();
                            for(Donhang d : listDD) {%>
                           <tr  onclick="selectRow(this)">
                          <td scope="row"><%=d.getId()%></td>
                          <td><%=d.getTen()%></td>
                          <td><%=d.getLoai()%></td>
                          <td><%=d.getNgaytao()%></td>
                          <td><%=d.getTrangthai()%></td>
                        </tr>                      
                        <%};%>
                      </tbody>
                    </table>
                  </table>
                  <nav id="nupage" aria-label="Page navigation example" class="pagi_btn">
                    <ul class="pagination">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          <span class="sr-only">
                            <<</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">6</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">>></span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </section>
              <!-- form NK -->
              <div id="listOrder2"> 
                <div class="container a" >
                    <div id="myDiv" class="formAddOrder" >
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                          <div class="accordion-item">
                            <div class="accordion-body">
                                <div class="GoodsForm">
                                    <form action="addPN" class="row g-2" method="post">
                                        <p class="title_formAccor">Thông Tin Kho(MDH: <input name="idCT" id="data1Input" class="no-border" vlaue="" disabled>)</p>
                                    <div class="col-md-4">
                                      <p class="title_address">Kho:</p>
                                      <select class="form-select " id="parentDropdown">
                                        <option selected disabled value="">Vị trí kho:</option>
                                        <option value="A">Ngoai_troi_A</option>
                                        <option value="B">Trong_nha_B</option>
                                        <option value="C">Trong_nha_C</option>
                                      </select>
                                    </div>
                                    <div class="col-md-4">
                                      <p class="title_address">Khu:</p>
                                      <select name="idkhu" class="form-select " id="childDropdown">
                                      </select>
                                    </div>
                                    <div class="form-floating">
                                      <textarea class="form-control" placeholder="Ghi chú" id="input_NoteWare" style="height: 100px mag"></textarea>
                                      <label for="floatingTextarea2">Ghi chú:</label>
                                    </div>
                                    <div class="btn_AddOrder">
                                      <button id="closeNK" class="btn btn-dark button1" >Hủy</button>
                                      <input type="submit" class="btn btn-primary button2" value="Nhakho">
                                    </div>
                                  </form>
                                </div>
                              </div>
                              <div class="accordion-item">
                                <h2 class="Title-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                      data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                                      aria-controls="panelsStayOpen-collapseOne">
                                      Thông tin người gửi
                                    </button>
                                  </h2>
                                  <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse ">
                                    <div class="accordion-body">
                                      <div class="sender_form">
                                        <form action="" class="row g-6">
                                          <p class="title_formAccor">Thông Tin Cá Nhân :</p>
                                          <div class="col-md-3">
                                            <label for="validationSenderName" class="form-label">Tên người gửi:</label>
                                            <div class="input-group has-validation">
                                              <input type="text" class="form-control "placeholder="Le Na" id="input_nameSender" disabled>
                                            </div>
                                          </div>
                      
                                          <div class="col-md-3">
                                            <label for="validationSenderCCCD" class="form-label">Số CCCD/CMND:</label>
                                            <div class="input-group has-validation">
                                              <input type="text" class="form-control "placeholder="0102030" id="input_CCCDSender" disabled>
                                            </div>
                                          </div>
                      
                                          <div class="col-md-3">
                                            <label for="validationSenderPhone" class="form-label">Số Điện Thoại:</label>
                                            <div class="input-group has-validation">
                                              <input type="text" class="form-control "placeholder="012345678" id="input_gmailSender" disabled>
                                            </div>
                                          </div>
                                      
                                          <div class="col-md-3">
                                            <label for="validationNameSenderGmail" class="form-label">Gmail:</label>
                                            <input type="text" class="form-control" id="input_gmailSender" placeholder="abc@gmail.com" disabled>
                                          </div>
                                          <p class="title_address">Địa chỉ người gửi:</p>
                                          <div class="col-md-3">
                                            <select class="form-select" id="selectCity" disabled>
                                              <option selected disabled value="">Tỉnh Thành:</option>
                                              <option>Đà Nẵng</option>
                                              <option>Hà Nội</option>
                                              <option>Tp.Hồ Chí Minh</option>
                                              <option>Quảng Nam</option>
                                            </select>
                                          </div>
                      
                                          <div class="col-md-3">
                                            <select class="form-select" id="selectDistrict" disabled>
                                              <option selected disabled value="">Quận Huyện:</option>
                                              <option>Hải Châu</option>
                                              <option>Liên chiểu</option>
                                              <option>Cẩm Lệ</option>
                                              <option>Hoà Vang</option>
                                            </select>
                                          </div>
                      
                                          <div class="col-md-3">
                                            <select class="form-select" id="selectVillage" disabled>
                                              <option selected disabled value="">Phường Xã:</option>
                                              <option>Thanh Bình</option>
                                              <option>Hoà Khánh Bắc</option>
                                              <option>Hoà Khánh Nam</option>
                                              <option>Thuận Phước</option>
                                            </select>
                                          </div>
                      
                                          <div class="col-md-3">
                                            <div class="input-group has-validation">
                                              <input type="text" class="form-control"placeholder="48 Cao Thắng" id="inputNumberAddress" disabled>
                                            </div>
                                          </div>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                              </div>
                              <div class="accordion-item">
                                <h2 class="Title-header">
                                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapseTwo">
                                    Thông tin Hàng Hoá
                                  </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
                                  <div class="accordion-body">
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
                                            <td id="data2Input"></td>
                                            <td id="data3Input"></td>
                                            <td>...</td>
                                            <td>...</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                </div>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!-- Xuât kho -->
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab" tabindex="0">
              <section class="list_order" id="listExportWare">
                <h2 class="tiltle_order">XUẤT KHO</h2>
                <div id="tableXK">
                  <form action="" class="form_Listorder">
                    <div class="input_item">
                      <input type="input" name="search_input" class="form-control">
                      <i class="bi bi-search"></i>
                    </div>
                  </form>
                  <table>
                    <table class="table" id="tableExportWare">
                      <thead>
                        <tr>
                          <th scope="col">Mã đơn hàng</th>
                          <th scope="col">Tên hàng hóa</th>
                          <th scope="col">Loại </th>
                          <th scope="col">Kho</th>
                          <th scope="col">Ngày Nhập</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">KH001</th>
                          <td>Lê Na</td>
                          <td>Hàng Gia Dụng</td>
                          <td>12/05/2023</td>
                          <td>Hàng Gia Dụng</td>
                        </tr>
 
                      </tbody>
                    </table>
                  </table>
                  <nav aria-label="Page navigation example" class="pagi_btn">
                    <ul class="pagination">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          <span class="sr-only">
                            <<</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">6</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">>></span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </section>
              <!-- form XK -->
              <div id="listOrder3">
                <div class="container a">
                  <div class="formAddOrder">
                    <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
                            <div class="accordion-body">
                                    <div class="receiverForm">
                                      <form action="" class="row g-6" id="FormExport_Receiver">
                                        <p class="title_formAccor">Thông tin người nhận :</p>
                                        <div class="col-md-3">
                                          <label for="validationReceiverName" class="form-label">Tên:</label>
                                          <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="Le Na" id="input_nameReceiver" required>
                                          </div>
                                        </div>
                                        <div class="col-md-3">
                                          <label for="validationReceiverCCCD" class="form-label">Số CCCD/CMND:</label>
                                          <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="0102030" id="input_CCCDReceiver" required>
                                          </div>
                                        </div>
                
                                        <div class="col-md-3">
                                          <label for="validationReceiverPhone" class="form-label">Số Điện Thoại:</label>
                                          <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="012345678" id="input_gmailReceiver" required>
                                          </div>
                                        </div>
                                    
                                        <div class="col-md-3">
                                          <label for="validationNameReceiverGmail" class="form-label">Email:</label>
                                          <input type="text" class="form-control " id="input_gmailReceiver" placeholder="abc@gmail.com" required>
                                        </div>
                                        <p class="title_address">Địa chỉ:</p>
                                        <div class="col-md-3">
                                          <select class="form-select" id="selectCity" required>
                                            <option selected disabled value="">Tỉnh Thành:</option>
                                            <option>Đà Nẵng</option>
                                            <option>Hà Nội</option>
                                            <option>Tp.Hồ Chí Minh</option>
                                            <option>Quảng Nam</option>
                                          </select>
                                        </div>
                
                                        <div class="col-md-3">
                                          <select class="form-select" id="selectDistrict" required>
                                            <option selected disabled value="">Quận Huyện:</option>
                                            <option>Hải Châu</option>
                                            <option>Liên chiểu</option>
                                            <option>Cẩm Lệ</option>
                                            <option>Hoà Vang</option>
                                          </select>
                                        </div>
                                        <div class="col-md-3">
                                          <select class="form-select" id="selectVillage" required>
                                            <option selected disabled value="">Phường Xã:</option>
                                            <option>Thanh Bình</option>
                                            <option>Hoà Khánh Bắc</option>
                                            <option>Hoà Khánh Nam</option>
                                            <option>Thuận Phước</option>
                                          </select>
                                        </div>
                                        <div class="col-md-3">
                                          <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="48 Cao Thắng" id="inputNumberAddress" required>
                                          </div>
                                        </div>
                                      </form>
                              </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="Title-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                                    aria-controls="panelsStayOpen-collapseOne">
                                    Thông tin khách hàng
                                </button>
                                </h2>
                                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse ">
                                <div class="accordion-body">
                                    <div class="sender_form">
                                    <form action="" class="row g-6">
                                        <p class="title_formAccor">Thông Tin Cá Nhân :</p>
                                        <div class="col-md-3">
                                        <label for="validationSenderName" class="form-label">Tên khách hàng:</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="Le Na" id="input_nameSender" disabled>
                                        </div>
                                        </div>
                                        <div class="col-md-3">
                                        <label for="validationSenderCCCD" class="form-label">Số CCCD/CMND:</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="0102030" id="input_CCCDSender" disabled>
                                        </div>
                                        </div>
                                        <div class="col-md-3">
                                        <label for="validationSenderPhone" class="form-label">Số Điện Thoại:</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="012345678" id="input_gmailSender" disabled>
                                        </div>
                                        </div>
                                        <div class="col-md-3">
                                        <label for="validationNameSenderGmail" class="form-label">Gmail:</label>
                                        <input type="text" class="form-control " id="input_gmailSender" placeholder="abc@gmail.com" disabled>
                                        </div>
                                        <p class="title_address">Địa chỉ:</p>
                                        <div class="col-md-3">
                                        <select class="form-select " id="selectCity" disabled>
                                            <option selected disabled value="">Tỉnh Thành:</option>
                                            <option>Đà Nẵng</option>
                                            <option>Hà Nội</option>
                                            <option>Tp.Hồ Chí Minh</option>
                                            <option>Quảng Nam</option>
                                        </select>
                                        </div>
                                        <div class="col-md-3">
                                        <select class="form-select " id="selectDistrict" disabled>
                                            <option selected disabled value="">Quận Huyện:</option>
                                            <option>Hải Châu</option>
                                            <option>Liên chiểu</option>
                                            <option>Cẩm Lệ</option>
                                            <option>Hoà Vang</option>
                                        </select>
                                        </div>
                                        <div class="col-md-3">
                                        <select class="form-select " id="selectVillage" disabled>
                                            <option selected disabled value="">Phường Xã:</option>
                                            <option>Thanh Bình</option>
                                            <option>Hoà Khánh Bắc</option>
                                            <option>Hoà Khánh Nam</option>
                                            <option>Thuận Phước</option>
                                        </select>
                                        </div>
                                        <div class="col-md-3">
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control "placeholder="48 Cao Thắng" id="inputNumberAddress" disabled>
                                        </div>
                                        </div>
                                    </form>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="Title-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="true"
                                    aria-controls="panelsStayOpen-collapseThree">
                                    Thông tin hàng hoá
                                </button>
                                </h2>
                                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <div class="GoodsExport_Form">
                                    <table class="table" id="table_ExportGoods">
                                        <thead>
                                        <tr>
                                            <th scope="col">Tên hàng hoá</th>
                                            <th scope="col">Loại hàng hoá</th>
                                            <th scope="col">Kho</th>
                                            <th scope="col">Ngày nhập kho</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th>...</th>
                                            <td>...</td>
                                            <td>...</td>
                                            <td>...</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn_AddOrder">
                        <button class="btn btn-dark button1" id="closeXK">Hủy</button>
                      <button class="btn btn-primary button2">Xuất Kho</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- tạo đơn hàng -->
            <div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="tab_add_order" tabindex="0">
                <div id="listOrder4">
                  <div class="container">
                    <h2>TẠO ĐƠN HÀNG MỚI</h2>
                    <div class="formAddOrder" action="addD" method="post">
                      <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
    
                          <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
                            <div class="accordion-body">
                              <div class="sender_form">
                                <form action="" class="row g-6">
                                  <p class="title_formAccor">Thông Tin Khách Hàng :</p>
                                  <div class="col-md-3">
                                    <label for="validationSenderName" class="form-label">Tên khách hàng:</label>
                                    <div class="input-group has-validation">
                                      <input name="add_tenk" type="text" class="form-control "placeholder="" id="input_nameSender" required>
                                    </div>
                                  </div>
  
                                  <div class="col-md-3">
                                    <label for="validationSenderCCCD" class="form-label">Số CCCD/CMND:</label>
                                    <div class="input-group has-validation">
                                      <input name ="add_cmndk" type="text" class="form-control "placeholder="" id="input_CCCDSender" required>
                                    </div>
                                  </div>
  
                                  <div class="col-md-3">
                                    <label for="validationSenderPhone" class="form-label">Số Điện Thoại:</label>
                                    <div class="input-group has-validation">
                                      <input name="add_sdtk" type="text" class="form-control "placeholder="" id="input_gmailSender" required>
                                    </div>
                                  </div>
                              
                                  <div class="col-md-3">
                                    <label for="validationNameSenderGmail" class="form-label">Email:</label>
                                    <input name ="add_emailk" type="text" class="form-control " id="input_gmailSender" placeholder="abc@gmail.com" required>
                                  </div>
                                  <p class="title_address">Địa chỉ khách hàng:</p>
                                  <div class="col-md-3">
                                    <select class="form-select" id="selectCity" required>
                                    
                                      <option selected disabled value="">Đà Nẵng</option>
                                      <option>Hà Nội</option>
                                      <option>Tp.Hồ Chí Minh</option>
                                      <option>Quảng Nam</option>
                                    </select>
                                  </div>
  
                                  <div class="col-md-3">
                                    <select class="form-select" id="selectDistrict" required>
                                      <option selected disabled value="">Quận Huyện:</option>
                                      <option>Hải Châu</option>
                                      <option>Liên chiểu</option>
                                      <option>Cẩm Lệ</option>
                                      <option>Hoà Vang</option>
                                    </select>
                                  </div>
  
                                  <div class="col-md-3">
                                    <select class="form-select" id="selectVillage" required>
                                      <option selected disabled value="">Phường Xã:</option>
                                      <option>Thanh Bình</option>
                                      <option>Hoà Khánh Bắc</option>
                                      <option>Hoà Khánh Nam</option>
                                      <option>Thuận Phước</option>
                                    </select>
                                  </div>
  
                                  <div class="col-md-3">
                                    <div class="input-group has-validation">
                                      <input name ="add_dchik" type="text" class="form-control"placeholder="" id="inputNumberAddress" required>
                                    </div>
                                  </div>

                                  <p class="title_formAccor">Thông Tin Hàng Hoá :</p>
                                  <div class="col-md-12">
                                    <p class="form-label">Loại Hàng hoá:</p>
                                    <select name="add_loaih" class="form-select" id="selectCity" required>
                                       <%   
                                    List<Loai> listL = dao.getLoai();
                                    for (Loai l : listL) {%>
                                        <option value="<%=l.getIdl()%>"><%=l.getLoai()%></option>
                                    <%};%>
                                    </select>
                                  </div>
                                  <div class="col-md-6">
                                    <label for="validationGoodsName" class="title_address">Tên hàng hoá:</label>
                                    <div class="input-group has-validation">
                                      <input name="add_tenh" type="text" class="form-control "placeholder="" id="input_nameReceiver" required>
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <label for="validationReceiverGoodWeight" class="title_address">Cân nặng (Kg):</label>
                                    <div class="input-group has-validation">
                                      <input name="add_cannang" type="text" class="form-control "placeholder="" id="input_gmailReceiver" required>
                                    </div>
                                  </div>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="btn_AddOrder">
                        <input type="submit" class="btn btn-primary" onclick="handleSubmit()" value="Tạo Đơn">
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          </main>
        </div>
      </div>
      </div>
    </div>
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
    crossorigin="anonymous"></script>
  <script src="js/main.js"></script>
  <script>
 // Lấy thẻ select của dropdown cha và dropdown con
var parentDropdown = document.getElementById("parentDropdown");
var childDropdown = document.getElementById("childDropdown");

// Định nghĩa danh sách các mục con tương ứng với mỗi giá trị của dropdown cha
var options = {
  A: ["AA", "AB", "AC"],
  B: ["BA", "BB", "BC"],
  C: ["CA", "CB", "CC"]
};

// Lắng nghe sự kiện khi người dùng thay đổi giá trị dropdown cha
parentDropdown.addEventListener("change", function() {
  var selectedValue = parentDropdown.value;
  
  // Xóa các mục hiện có trong dropdown con
  childDropdown.innerHTML = "";

  // Thêm các mục mới dựa trên giá trị dropdown cha đã chọn
  options[selectedValue].forEach(function(option) {
    var newOption = document.createElement("option");
    newOption.text = option;
    childDropdown.add(newOption);
  });
});
  </script>

 
</body>

</html>
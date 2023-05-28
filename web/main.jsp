<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="entity.Nguoi" %>
<%@ page import="entity.Donhang" %>
<%@ page import="entity.DHNK" %>
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
                 <form  class="form_Listorder">
                  <div class="input_item">
                    <input type="input" name="search_input" value="" class="form-control">
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
                        <% 
                            String a = request.getParameter("search_input");
                            DAO dao = new DAO(); 
                            List<Donhang> listD = dao.getDonhang(a);
                            for(Donhang d : listD) {%>
                            <tr onclick="(navigateToLink('loadCT?id=<%=d.getId()%>'))">
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
                          <th scope="col">Tên hàng</th>
                          <th scope="col">Loại hàng hoá</th>
                          <th scope="col">Loại chứa</th>
                          <th scope="col">Cân Nặng</th>
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
                          <td><%=d.getTrangthai()%></td>
                          <td><%=d.getNgaytao()%></td>
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
                                        <p class="title_formAccor">Nhập kho(MDH: <input name="id_ct" type="text" id="data1Input" class="no-border">)</p>
                                    <div class="col-md-4">
                                      <p class="title_address">Kho:</p>
                                      <select class="form-select " id="parentDropdown" required>
                                        <option selected disabled value="">Vị trí kho:</option>
                                        <option value="A">Ngoai_troi_A</option>
                                        <option value="B">Trong_nha_B</option>
                                        <option value="C">Trong_nha_C</option>
                                      </select>
                                    </div>
                                    <div class="col-md-4">
                                      <p class="title_address">Khu:</p>
                                      <select name="idkhu" class="form-select " id="childDropdown" required>
                                      </select>
                                    </div>
                                    <div class="form-floating">
                                      <textarea class="form-control" placeholder="Ghi chú" id="input_NoteWare" style="height: 100px mag"></textarea>
                                      <label for="floatingTextarea2">Ghi chú:</label>
                                    </div>
                                    <div class="btn_AddOrder">
                                      <button id="closeNK" class="btn btn-dark button1" >Hủy</button>
                                      <input type="submit" class="btn btn-primary button2" value="Nhập kho">
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
                                            <th scope="col">Loại hàng</th>
                                            <th scope="col">Loại chứa</th>
                                            <th scope="col">Cân nặng</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td id="data2Input"></td>
                                            <td id="data3Input"></td>
                                            <td id="data5Input"></td>
                                            <td id="data10Input"></td>
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
                          <%
                            List<DHNK> listNK = dao.getAllDonhangNK();
                            for(DHNK n : listNK) {%>
                        <tr onclick="selectRow(this)">
                          <td scope="row"><%=n.getId()%></td>
                          <td><%=n.getTen()%></td>
                          <td><%=n.getLoai()%></td>
                          <td><%=n.getKho()%>/<%=n.getKhu()%></td>
                          <td><%=n.getNgaytao()%></td>
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
              </section>
              <!-- form XK -->
              <div id="listOrder3">
                <div class="container a">
                  <div class="formAddOrder">
                    <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
                            <div class="accordion-body">
                                    <div class="receiverForm">
                                        <form action="addXK" method="post" class="row g-2" >
                                          <p class="title_formAccor">Xuất Kho(MDH:<input name="id_ctpx" type="text" id="data4Input" class="no-border"> )</p>
                                        <div class="col-md-3">
                                          <label for="validationReceiverName" class="form-label">Hình thức</label>
                                          <div class="input-group " required>
                                              <select name="HT" class="form-select">
                                                  <option selected value="VC">VC: Vận chuyển</option>
                                                  <option value="NN">NN: Nhận ngay</option>
                                              </select>
                                          </div>
                                        </div>
                                           <div class="btn_AddOrder">
                                                   <div  id="closeXK" class="btn btn-dark button1">Hủy</div>
                                                  <input type="submit" class="btn btn-primary button2" value="Xuất Kho">
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
                                            <th id="data6Input">...</th>
                                            <td id="data7Input">...</td>
                                            <td id="data8Input">...</td>
                                            <td id="data9Input">...</td>
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
                                <form action="addD" method="post" class="row g-6"  >
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
                                      <input name ="add_dchik" type="text" class="form-control"placeholder="" id="inputNumberAddress" required>
                                    </div>
                                  </div>

                                  <p class="title_formAccor">Thông Tin Hàng Hoá :</p>
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
                                                                    <div class="col-md-6">
                                    <p class="form-label">Loại Hàng hoá:</p>
                                    <select name="add_loaih" class="form-select" id="selectCity" required>
                                        <option selected disabled>Chọn loại hàng</option>
                                       <%   
                                    List<Loai> listLH = dao.getLoaiH();
                                    for (Loai lh : listLH) {%>
                                        <option value="<%=lh.getIdl()%>"><%=lh.getIdl()%>: <%=lh.getLoai()%></option>
                                    <%};%>
                                    </select>
                                  </div>
                                    <div class="col-md-6">
                                    <p class="form-label">Loại Chứa:</p>
                                    <select name="add_loaic" class="form-select" id="selectCity" required>
                                       <%
                                    List<Loai> listLC = dao.getLoaiC();
                                    for (Loai lc : listLC) {%>
                                        <option value="<%=lc.getIdl()%>"><%=lc.getIdl()%>: <%=lc.getLoai()%></option>
                                    <%};%>
                                    </select>
                                  </div>
                                    <div class="btn_AddOrder">
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
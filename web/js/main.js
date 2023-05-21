clickT('#tableImportWare tr','#listOrder2','#tableNK');
clickT('#closeNK','#listOrder2','#tableNK');
clickT('#tableExportWare tr','#listOrder3','#tableXK');
clickT('#closeXK','#listOrder3','#tableXK');
function clickT(target,area,area2) {
    $(target).on('click', function() {
        toggleElementVisibility(area);
        toggleElementVisibility(area2);
    });
}

//function toggleFormInputs() {
//    const checkbox = document.getElementById("checkRecerver");
//    const form = document.getElementById("Form_Receiver");
//    const formInputs = form.querySelectorAll("input[type='text']");
//  
//    formInputs.forEach(function(input) {
//      input.disabled = !checkbox.checked;
//    });
//  }
  
//  const checkbox = document.getElementById("checkRecerver");
//  checkbox.addEventListener("change", toggleFormInputs);
//  


function toggleElementVisibility(elementSelector) {
    var $element = $(elementSelector);
    if ($element.is(":visible")) {
        $element.hide();
    } else {
        $element.show();
    }
}

    var selectedData = {}; // Đối tượng để lưu trữ dữ liệu từ hàng đã chọn

    function selectRow(row) {
      // Loại bỏ lựa chọn trước đó
      var selectedRow = document.querySelector('.selected');
      if (selectedRow) {
        selectedRow.classList.remove('selected');
      }
      
      // Lựa chọn hàng mới
      row.classList.add('selected');
      
      // Lấy dữ liệu từ hàng đã chọn
      var rowData = [];
      var cells = row.getElementsByTagName('td');
      for (var i = 0; i < cells.length; i++) {
        rowData.push(cells[i].textContent);
      }

      // Lưu trữ dữ liệu vào đối tượng selectedData
      selectedData = {
        data1: rowData[0],
        data2: rowData[1],
        data3: rowData[2],
        data4: rowData[3],
        data5: rowData[4]
      };

      // Hiển thị dữ liệu trong biểu mẫu khác
      document.getElementById('data1Input').value = selectedData.data1;
      document.getElementById('data2Input').textContent = selectedData.data2;
      document.getElementById('data3Input').textContent = selectedData.data3;
      document.getElementById('data5Input').textContent = selectedData.data4;
      document.getElementById('data4Input').value = selectedData.data1;
      document.getElementById('data6Input').textContent = selectedData.data2;
      document.getElementById('data7Input').textContent = selectedData.data3;
      document.getElementById('data8Input').textContent = selectedData.data4;
       document.getElementById('data9Input').textContent = selectedData.data5;

    }
    
 
    function navigateToLink(url) {
      window.location.href = url;
    }



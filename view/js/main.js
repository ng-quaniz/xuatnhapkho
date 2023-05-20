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

function toggleFormInputs() {
    const checkbox = document.getElementById("checkRecerver");
    const form = document.getElementById("Form_Receiver");
    const formInputs = form.querySelectorAll("input[type='text']");
  
    formInputs.forEach(function(input) {
      input.disabled = !checkbox.checked;
    });
  }
  
  const checkbox = document.getElementById("checkRecerver");
  checkbox.addEventListener("change", toggleFormInputs);
  


function toggleElementVisibility(elementSelector) {
    var $element = $(elementSelector);
    if ($element.is(":visible")) {
        $element.hide();
    } else {
        $element.show();
    }
}
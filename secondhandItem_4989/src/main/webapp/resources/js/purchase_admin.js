
// 모든 tr 태그에 클릭 이벤트로 id가 csModal인 모달창을 모여주도록 함
$(document).ready(function(){
    $(".get-detail").off('click').on('click', function(){
		let purchase_id = $(this).data('purchase-id');
        $("#purchaseAdminModal").modal();
		loadPurchaseDetails(purchase_id);
    });
});

// 모달창 오픈 시 상세정보 가져오기

function loadPurchaseDetails(purchase_id) {

    $.ajax({
    	type: 'GET',
        url: contextPath + '/admin/getPurchaseInfo',
        data: { purchase_id: purchase_id },
        dataType: 'json',
        success: function (data) {
	        let modal = $('#purchaseAdminModal');
            modal.find('#purchase_id').val(data.purchase_id);
            modal.find('#member_id').val(data.member_id);
            modal.find('#request_date').val(data.request_date);
            modal.find('#pc_item_name').val(data.pc_item_name);
            modal.find('#expected_grade').val(data.expected_grade);
            modal.find('#expected_price').val(data.expected_price);
            modal.find('#account_info').val(data.account_info);
            modal.find('#purchase_status').val(data.purchase_status);
        },
        error: function () {
            alert('데이터를 가져오는 중 오류가 발생했습니다.');
        }
    });
}


// 상태변경 저장하기

$('#status_save').on('click', function() {

	let modal = $('#purchaseAdminModal');
	let formData = {
		purchase_id: modal.find('#purchase_id').val(),
		expected_grade: modal.find('#expected_grade').val(),
		expected_price: modal.find('#expected_price').val(),
		purchase_status: modal.find('#purchase_status').val()
		};
	
	$.ajax({
		type: 'POST',
		url: contextPath + '/admin/savePurchaseInfo',
		data: JSON.stringify(formData),
		contentType: 'application/json',
		success: function() {
			alert('매입상태가 저장되었습니다');
			modal.modal('hide');
			window.location.reload();
		},
		error: function() {
			alert('저장 중 오류가 발생했습니다');
		}
	});
});





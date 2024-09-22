
// 모든 tr 태그에 클릭 이벤트로 id가 csModal인 모달창을 모여주도록 함
$(document).ready(function(){
	$("tr").click(function(){
        $("#reportModal").modal();
		let report_id = $(this).children('td:eq(0)').text();
		let reporter_id = $(this).children('td:eq(1)').text();
		let reportee_id = $(this).children('td:eq(2)').text();
		let reported_item_id = $(this).children('td:eq(3)').text();
		let report_type = $(this).children('td:eq(4)').text();
		let report_contents = $(this).children('td:eq(5)').text();
		let reported_at = $(this).children('td:eq(6)').text();
		let report_status = $(this).children('td:eq(7)').text();
		
		$("#report_id_modal").val(report_id);
		$("#reporter_id_modal").val(reporter_id);
		$("#report_type_modal").val(report_type);
		$("#reportee_id_modal").val(reportee_id);
		$("#reported_item_id_modal").val(reported_item_id);
		$("#reported_at_modal").val(reported_at);
		$("#report_status_modal").val(report_status).prop("selected", true);
		$("#report_contents_modal").val(report_contents);

    });
	
});

//신고 내역 수정 하기 
function editReport(){
	$.ajax({
	    type: "POST",
	    url : "./report/update/",
	    data : {
	    	report_id : $("#report_id_modal").val(),
	    	reporter_id : $("#reporter_id_modal").val(),
	    	reportee_id : $("#reportee_id_modal").val(),
	    	reported_item_id : $("#reported_item_id_modal").val(),
	    	report_type : $("#report_type_modal").val(),
	    	report_contents : $("#report_contents_modal").val().replaceAll("\n", "<br>"),
	    	reported_at : $("#reported_at_modal").val(),
	    	report_status : $("#report_status_modal").val()
	    },
	    contentType : "application/x-www-form-urlencoded; charset=utf-8",
	    dataType : "json",
	    success : function(data){
	        let report = data;
	        $(`#${report.report_id}`).children('td:eq(5)').text(report.report_contents);
	        $(`#${report.report_id}`).children('td:eq(7)').text(report.report_status);
	    },error : function(){
	        console.log('정보 수정 실패');
	    }
	});
}
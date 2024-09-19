
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
		$("#report_status_modal").val(report_status);
		$("#report_contents_modal").val(report_contents);

    });
});
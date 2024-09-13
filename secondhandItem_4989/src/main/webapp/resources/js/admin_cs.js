
// 모든 tr 태그에 클릭 이벤트로 id가 csModal인 모달창을 모여주도록 함
$(document).ready(function(){
    $("tr").click(function(){
        $("#csModal").modal();
		// 행을 클릭 했을 때 그 행에서 text 정보들을 가져오면 된다고 생각합니다
    });
});
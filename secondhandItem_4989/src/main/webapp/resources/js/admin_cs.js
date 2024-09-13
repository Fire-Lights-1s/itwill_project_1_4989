
// 모든 tr 태그에 클릭 이벤트로 id가 csModal인 모달창을 모여주도록 함
$(document).ready(function(){
    $("tr").click(function(){
        $("#csModal").modal();
    });
});
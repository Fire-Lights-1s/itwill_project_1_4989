let stompClient = null;
let chatList = null;
let userId = sessionUserId;
let chatRoomGlobal = null;
let productGlobal = null;


$(document).ready(function(){
    if(userId == null || userId == ''){
        location.replace("./");
        alert('로그인 후 이용해주세요.');
    }
    if(!Object.is(objChatRoomDTO, undefined) && !Object.is(objChatRoomDTO, null) && !Object.is(objChatRoomDTO, '')){
    	connect(objChatRoomDTO);
    }
    $('#reportBtn').on('click', submitReport);
    
});
// html 채팅방 영역 지우기
function setConnected() {
    $("#chatContent").html("");
}
// 채팅방 연결
function connect(chatRoom_json){
	
	chatRoomGlobal = JSON.parse(chatRoom_json.replaceAll("&#034;", "\"").replaceAll("\n","<br>"));
    disconnect();
    let socket = new SockJS('./chatting');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame){
    
		loadProduct(chatRoomGlobal);
		productLoadingEnd();
		loadChatList(chatRoomGlobal);
        // roomID를 구독 /send/roomID로 보내진 메세지를 받음
        stompClient.subscribe('/topic/' + chatRoomGlobal.chat_room_id, function (chatMessage){
        	//console.log('chatMessage: ', chatMessage);
            showChat(JSON.parse(chatMessage.body));
        });
        stompClient.subscribe('/topic/product/' + chatRoomGlobal.product_id, function (product){
        	changeProductState(product.body);
        	productLoadingEnd();
        });
        $('#inputMessage').css('visibility', 'visible');
    });
}
// 채팅방 연결되어있으면 연결 끊기
function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected();
    console.log("Disconnected");
}
//채팅방 저장된 채팅 불러오기
function loadChatList(chatRoom_json){
	$.ajax({
	    type: "POST",
	    url : "./chat/reciveChatList/"+chatRoom_json.chat_room_id,
	    data : {
	    	chat_room_id : chatRoom_json.chat_room_id,
	    	product_id : chatRoom_json.product_id
	    },
	    contentType : "application/x-www-form-urlencoded; charset=utf-8",
	    dataType : "json",
	    success : function(data){
	        //console.log(data);
	        for(let i = 0; i < data.length; i++){
	        	showChat(JSON.parse(JSON.stringify(data[i])));
	        }
	    },error : function(){
	        console.log('저장된 채팅 불러오기 실패');
	    }
	});
}

// product 정보 가져오기
function loadProduct(chatRoom_json){
	$.ajax({
	    type: "POST",
	    url : "./chat/reciveRoomProduct/",
	    data : {
	    	chat_room_id : chatRoom_json.chat_room_id,
	    	product_id : chatRoom_json.product_id
	    },
	    contentType : "application/x-www-form-urlencoded; charset=utf-8",
	    dataType : "json",
	    success : function(data){
	        //Ajax 성공시
	        //console.log(data);
	        productGlobal = data;
	        let TXButton = '#productInfo div:nth-child(3) #trade-btn';
	        $('#productInfo div:nth-child(1) img').attr( "src", productGlobal.product_img1 );
	        $('#productInfo div:nth-child(2) h3').text(productGlobal.product_name);
	        $('#productInfo div:nth-child(2) p:nth-child(2)').text("상품 가격 : "+productGlobal.product_price+"원");
	        $('#productInfo div:nth-child(2) p:nth-child(3)').text("구매 연도 : "+productGlobal.year_purchase);
	        $('#productInfo div:nth-child(2) p:nth-child(4)').text("거래 상태 : "+productGlobal.trade_status);
	        if(productGlobal.trade_area == null){
		        $('#productInfo div:nth-child(3) p').text("거래 지역 : 작성되지 않음");
	        }else{
		        $('#productInfo div:nth-child(3) p').text("거래 지역 : "+productGlobal.trade_area);
	        }
	        if(productGlobal.seller_id == userId){
	        	$(TXButton).off('click');
	        	switch(productGlobal.trade_status) {
				  case '거래 가능':
				  	$(TXButton).text('판매 예약');
		        	$(TXButton).css('visibility', 'visible');
		        	$(TXButton).on('click', function(){
		        		promiseTrade();
				  	});
				    break;
				  case '예약 중':
				  	if(productGlobal.buyer_id == chatRoom_json.buyer_id){
					  	$(TXButton).text('판매 예약 취소');
			        	$(TXButton).css('visibility', 'visible');
			        	
			        	$(TXButton).on('click', function(){
			        		promiseTrade();
					  	});
				  	}else{
					  	$(TXButton).text('');
					    $(TXButton).css('visibility', 'hidden');
				  	}
				    break;
				  case '거래 완료':
				  	$(TXButton).text('거래 완료');
		        	$(TXButton).css('visibility', 'visible');
				    break;
				  default:
				    $(TXButton).text('');
				    $(TXButton).css('visibility', 'hidden');
				}//switch
	        }else if(chatRoom_json.buyer_id == userId){
	        	switch(productGlobal.trade_status) {
				  case '거래 가능':
				  	$(TXButton).text('');
				  	$(TXButton).css('visibility', 'hidden');
				    break;
				  case '예약 중':
				  	if(productGlobal.buyer_id == chatRoom_json.buyer_id){
					  	$(TXButton).text('구매 확정');
					  	$(TXButton).css('visibility', 'visible');
					  	$(TXButton).on('click', function(){
					  		promiseTrade();
					  	});
				  	}else{
					  	$(TXButton).text('');
					    $(TXButton).css('visibility', 'hidden');
				  	}
				    break;
				  case '거래 완료':
				  	$(TXButton).text('후기 작성');
				  	$(TXButton).css('visibility', 'visible');
				  	$(TXButton).off('click');
				  	$(TXButton).on('click', function(){
				  	});
				    break;
				  default:
				    $(TXButton).text('');
				  	$(TXButton).css('visibility', 'hidden');
				}//switch
	        }else{
	        	$(TXButton).text('');
				$(TXButton).css('visibility', 'hidden');
	        }
	        $('#productInfo').css('visibility', 'visible');
	    },error : function(){
	        //Ajax 실패시
	        console.log('거래 물품 불러오기 실패');
	    }
	});
}//loadProduct()

//채팅 보내기
function sendChat() {
	let sendMessage = $("#message").val();
    if (sendMessage != "" && sendMessage.replaceAll("\n","") != "" ) {
    	let data = {
    	"message_type":"MESSAGE",
    	"user_id": userId,
    	"message":sendMessage,
    	}
    	
        stompClient.send("/send/"+chatRoomGlobal.chat_room_id, {},
            JSON.stringify(data));
        $("#message").val('');
    }
}
function enterkey() {
	if (window.event.keyCode == 13) {
    	sendChat();
    	$("#message").val('');
    }
}
//보낸 채팅 보기
function showChat(chatMessage) {
    let nowTime = Date.now();
    let messageTime = new Date(chatMessage.send_time);
    let howOld = nowTime - chatMessage.send_time;
    let sendTime = null;
    let messageDiv = null;
    //보낸 사람인지 확인
    let message = $('<p>', {
        text : chatMessage.message
    });
    if(chatMessage.user_id == userId){
        messageDiv = $('<div>', {
            class : 'sendMessage'
        });
    }else{
        messageDiv = $('<div>', {
            class : 'reciveMessage'
        });
    }
    // 보낸 기간이 1일을 넘었는지 확인
    if(howOld / (1000 * 60 * 60 * 24) < 1){
        let hour = messageTime.getHours(); 
        let minute = messageTime.getMinutes();
        sendTime = $('<p>', {
            text : hour+':'+ minute 
        });
    }else {
        let month = messageTime.getMonth();
        let day = messageTime.getDay();
        let hour = messageTime.getHours(); 
        let minute = messageTime.getMinutes();
        sendTime = $('<p>', {
            text : month + '월' + day +'일 '+ hour + ':' + minute 
        });
        
    }
    //documenet 요소 생성
    messageDiv.append(message);
    messageDiv.append(sendTime);
    $("#chatContent").append(messageDiv);
    $("#chatContent").scrollTop($("#chatContent")[0].scrollHeight);
}//showChat()


//상품 예약 및 구매
function promiseTrade(){
	let TXButton = '#productInfo div:nth-child(3) #trade-btn';
	let TXButtonFunc = $(TXButton).text();
	let tradeState = null;
	let tradeFinish = false;
	
	if(!Object.is(productGlobal, undefined) && !Object.is(productGlobal, null) && !Object.is(productGlobal, '')){
		switch(TXButtonFunc) {
			case '판매 예약':
				tradeState = '판매 예약';
				tradeFinish = false;
				break;
			case '판매 예약 취소':
				tradeState = '판매 예약 취소';	
				tradeFinish = false;
				break;
			case '구매 확정':
				tradeState = '구매 확정';	
				tradeFinish = false;
				break;
			case '후기 작성':
				tradeFinish = true;
				break;
			default:
				tradeFinish = false;
		}//switch
		if (!tradeFinish) {
	    	let data = {
	    	"product_id":productGlobal.product_id,
	    	"seller_id":productGlobal.seller_id,
	    	"trade_status":tradeState,
	    	"buyer_id": chatRoomGlobal.buyer_id,
	    	}
	    	
	    	productLoadingStart();
	        stompClient.send('/send/product/' + productGlobal.product_id, {},
	            JSON.stringify(data));
    	}
    }
}//promiseTrade()

//상품 로딩 화면 
function productLoadingStart(){
	$('#productLoading').removeClass('loading_visibility');
}
function productLoadingEnd(){
	$('#productLoading').addClass('loading_visibility');
}

function submitReport() {
    var reportContents = $("#report_contents").val();
    var reporterId = userId;
    var reporteeId = productGlobal.seller_id;
    var reportedItemId = productGlobal.product_id;
    var reportType = $('input[name=reportType]:checked').val(); // 고정값

    $.ajax({
        type: "POST",
        url: "./product/report",
        data: {
            reporter_id: reporterId,
            reportee_id: reporteeId,
            reported_item_id: reportedItemId,
            report_type: reportType,
            report_contents: reportContents
        },
        success: function(response) {
            if (response.success) {
                alert("신고가 접수되었습니다.");
                $('#reportModal').modal('hide');
            } else {
                alert("신고 접수 중 오류가 발생했습니다.");
            }
        },
        error: function() {
            alert("서버 통신 중 오류가 발생했습니다.");
        }
    });
}
//상품 상태 변경하기
function changeProductState(product){
	//console.log('changeProductState : ' + product);
	productGlobal = JSON.parse(product);
	$('#productInfo div:nth-child(2) p:nth-child(4)').text("거래 상태 : "+ productGlobal.trade_status);
	let TXButton = '#productInfo div:nth-child(3) #trade-btn';
	if(productGlobal.seller_id == userId){
		$(TXButton).off('click');
		switch(productGlobal.trade_status) {
			case '거래 가능':
			$(TXButton).text('판매 예약');
			$(TXButton).css('visibility', 'visible');
			$(TXButton).on('click', function(){
				promiseTrade();
			});
			break;
			case '예약 중':
			if(productGlobal.buyer_id == chatRoomGlobal.buyer_id){
				$(TXButton).text('판매 예약 취소');
				$(TXButton).css('visibility', 'visible');
				$(TXButton).on('click', function(){
					promiseTrade();
				});
			}else{
				$(TXButton).text('');
				$(TXButton).css('visibility', 'hidden');
			}
			break;
			case '거래 완료':
			$(TXButton).text('거래 완료');
			$(TXButton).css('visibility', 'visible');
			break;
			default:
			$(TXButton).text('');
			$(TXButton).css('visibility', 'hidden');
		}//switch
	}else if(chatRoomGlobal.buyer_id == userId){
		switch(productGlobal.trade_status) {
			case '거래 가능':
			$(TXButton).text('');
			$(TXButton).css('visibility', 'hidden');
			break;
			case '예약 중':
			if(productGlobal.buyer_id == chatRoomGlobal.buyer_id){
				$(TXButton).text('구매 확정');
				$(TXButton).css('visibility', 'visible');
				$(TXButton).on('click', function(){
					promiseTrade();
				});
			}else{
				$(TXButton).text('');
				$(TXButton).css('visibility', 'hidden');
			}
			break;
			case '거래 완료':
			$(TXButton).text('후기 작성');
			$(TXButton).css('visibility', 'visible');
			$(TXButton).off('click');
			$(TXButton).on('click', function(){
			});
			break;
			default:
			$(TXButton).text('');
			$(TXButton).css('visibility', 'hidden');
		}//switch
	}else{
		$(TXButton).text('');
		$(TXButton).css('visibility', 'hidden');
	}
}//changeProductState()


let stompClient = null;
let chatList = null;
let userId = sessionUserId;
let chatRoom = null;
let productJSON = null;


$(document).ready(function(){
    if(userId == null || userId == ''){
        location.replace("../secondhand4989/");
        alert('로그인 후 이용해주세요.');
    }
    if(!Object.is(objChatRoomDTO, undefined) && !Object.is(objChatRoomDTO, null) && !Object.is(objChatRoomDTO, '')){
    	connect(objChatRoomDTO);
    }
});
// html 채팅방 영역 지우기
function setConnected() {
    $("#chatContent").html("");
}
// 채팅방 연결
function connect(chatRoom_json){
	
	chatRoom = JSON.parse(chatRoom_json.replaceAll("&#034;", "\""));
    disconnect();
    let socket = new SockJS('/secondhand4989/chatting');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame){
    
		loadProduct(chatRoom);
		
        // roomID를 구독 /send/roomID로 보내진 메세지를 받음
        stompClient.subscribe('/topic/' + chatRoom.chat_room_id, function (chatMessage){
        	console.log('chatMessage: ', chatMessage);
            showChat(JSON.parse(chatMessage.body));
        });
        stompClient.subscribe('/topic/product/' + chatRoom.product_id, function (product){
        	console.log('product: ', product);
        	changeProductState(product.body);
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
//채팅방 채팅 불러오기
function loadChatRoomList(chatRoom_json){
	$.ajax({
	    type: "POST",
	    url : "../secondhand4989/chat/reciveChatList/"+chatRoom_json.chat_room_id,
	    data : {
	    	chat_room_id : chatRoom_json.chat_room_id,
	    	product_id : chatRoom_json.product_id
	    },
	    contentType : "application/x-www-form-urlencoded; charset=utf-8",
	    dataType : "json",
	    success : function(data){
	        //Ajax 성공시
	        console.log(data);
	        
	        
	    },error : function(){
	        //Ajax 실패시
	        console.log('거래 물품 불러오기 실패');
	    }
	});
}
// product 정보 가져오기
function loadProduct(chatRoom_json){
	$.ajax({
	    type: "POST",
	    url : "../secondhand4989/chat/reciveRoomProduct/",
	    data : {
	    	chat_room_id : chatRoom_json.chat_room_id,
	    	product_id : chatRoom_json.product_id
	    },
	    contentType : "application/x-www-form-urlencoded; charset=utf-8",
	    dataType : "json",
	    success : function(data){
	        //Ajax 성공시
	        console.log(data);
	        productJSON = data;
	        let TXButton = '#productInfo div:nth-child(3) button';
	        $('#productInfo div:nth-child(1) img').attr( "src", productJSON.product_img1 );
	        $('#productInfo div:nth-child(2) h3').text(productJSON.product_name);
	        $('#productInfo div:nth-child(2) p:nth-child(2)').text("상품 가격 : "+productJSON.product_price+"원");
	        $('#productInfo div:nth-child(2) p:nth-child(3)').text("구매 연도 : "+productJSON.year_purchase);
	        $('#productInfo div:nth-child(2) p:nth-child(4)').text("상품 상태 : "+productJSON.trade_status);
	        $('#productInfo div:nth-child(3) p').text(productJSON.trade_area);
	        if(productJSON.seller_id == userId){
	        	switch(productJSON.trade_status) {
				  case '거래 가능':
				  	$(TXButton).text('판매 예약');
		        	$(TXButton).css('visibility', 'visible');
				    break;
				  case '예약 중':
				  	$(TXButton).text('판매 예약 취소');
		        	$(TXButton).css('visibility', 'visible');
				    break;
				  case '거래 완료':
				  	$(TXButton).text('거래완료');
		        	$(TXButton).css('visibility', 'visible');
				    break;
				  default:
				    $(TXButton).text('');
				    $(TXButton).css('visibility', 'hidden');
				}//switch
	        }else if(chatRoom_json.buyer_id == userId){
	        	switch(productJSON.trade_status) {
				  case '거래 가능':
				  	$(TXButton).text('');
				  	$(TXButton).css('visibility', 'hidden');
				    break;
				  case '예약 중':
				  	$(TXButton).text('구매 확정');
				  	$(TXButton).css('visibility', 'visible');
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
}
//채팅 보내기
function sendChat() {
    if ($("#message").val() != "") {
    	let data = {
    	"chat_id":null,
    	"chat_room_id":null,
    	"message_type":"MESSAGE",
    	"alarm":null,
    	"user_id": userId,
    	"message":$('#message').val(),
    	"send_time":null
    	}
    	
        stompClient.send("/send/"+roomIdJs, {},
            JSON.stringify(data));
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
    messageDiv.append(message);
    messageDiv.append(sendTime);
    $("#chatContent").append(messageDiv);
        console.log(chatMessage);
        console.log(message);
}
//상품 예약 및 구매
function promiseTrade(){
	let TXButton = '#productInfo div:nth-child(3) button';
	let TXButtonFunc = $(TXButton).text();
	let tradeState = null;
	let tradeFinish = false;
	
	if(!Object.is(productJSON, undefined) && !Object.is(productJSON, null) && !Object.is(productJSON, '')){
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
	    	"product_id":productJSON.product_id,
	    	"trade_status":tradeState,
	    	"buyer_id": chatRoom.buyer_id,
	    	}
	    	
	        stompClient.send('/send/product/' + productJSON.product_id, {},
	            JSON.stringify(data));
    	}
    }
}
//상품 상태 변경하기
function changeProductState(product){
	console.log('changeProductState : '+product);
}
//저장된 채팅 불러오기
function loadChat(chatList){
    if(chatList != null) {
        for(let chat in chatList) {
            if (chatList[chat].senderEmail == senderEmail) {
                $("#chatting").append(
                    "<div class = 'chatting_own'><tr><td>" + chatList[chat].message + "</td></tr></div>"
                );
            } else {
                $("#chatting").append(
                    "<div class = 'chatting'><tr><td>" + "[" + chatList[chat].sender + "] " + chatList[chat].message + "</td></tr></div>"
                );
            }
        }
    }
    $('.col-md-12').scrollTop($('.col-md-12')[0].scrollHeight); // 채팅이 많아질시에 자동 스크롤
}


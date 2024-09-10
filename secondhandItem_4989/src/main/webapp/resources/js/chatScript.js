let stompClient = null;
let chatRoomId = chatRoomJSON.chat_room_id;
let chatList = null;
let userId = sessionUserId;

$(document).ready(function(){
    if(userId == 'null' || userId == ''){
        location.replace("../secondhand4989/");
        alert('로그인 후 이용해주세요.');
    }
});
// html 채팅방 영역 지우기
function setConnected() {
    $("#chatContent").html("");
}
// 채팅방 연결
function connect(roomID){
    disconnect();
    let socket = new SockJS('/secondhand4989/chatting');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame){

        // roomID를 구독 /send/roomID로 보내진 메세지를 받음
        stompClient.subscribe('/topic/' + roomID, function (chatMessage){
        	console.log('chatMessage: ', chatMessage);
            showChat(JSON.parse(chatMessage.body));
        });
        roomIdJs = roomID;
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
function loadProduct(){
	$.ajax({
	    type: "POST",
	    url : "../chat/reciveRoomProduct",
	    data : {
	    	chat_room_id : chatRoomJSON.chat_room_id,
	    	product_id : chatRoomJSON.product_id
	    },
	    contentType : "application/x-www-form-urlencoded; charset=utf-8",
	    dataType : "json",
	    success : function(data){
	        //Ajax 성공시
	        console.log(data);
	        let productJSON = data;
	        let TXButton = '#productInfo div:nth-child(3) button';
	        $('#productInfo div:nth-child(1) img').attr( "src", productJSON.product_img1 );
	        $('#productInfo div:nth-child(2) h3').text(productJSON.product_name);
	        $('#productInfo div:nth-child(2) p:nth-child(2)').text(productJSON.product_price);
	        $('#productInfo div:nth-child(2) p:nth-child(3)').text(productJSON.year_purchase);
	        $('#productInfo div:nth-child(2) p:nth-child(4)').text(productJSON.trade_status);
	        $('#productInfo div:nth-child(3) p').text(productJSON.trade_area);
	        if(productJSON.seller_id == userId){
	        	switch(productJSON.trade_status) {
				  case '거래 가능':
				  	$(TXButton).text('판매 예약');
		        	$(TXButton).attr('visibility', '');
				    break;
				  case '예약 중':
				  	$(TXButton).text('판매 예약 취소');
		        	$(TXButton).attr('visibility', '');
				    break;
				  case '거래 완료':
				  	$(TXButton).text('거래완료');
		        	$(TXButton).attr('visibility', '');
				    break;
				  default:
				    $(TXButton).text('');
				}
	        }else if(chatRoomJSON.buyer_id == userId){
	        	switch(productJSON.trade_status) {
				  case '거래 가능':
				  	$(TXButton).text('');
				  	$(TXButton).attr('visibility', 'hidden');
				    break;
				  case '예약 중':
				  	$(TXButton).text('구매 확정');
				  	$(TXButton).attr('visibility', '');
				    break;
				  case '거래 완료':
				  	$(TXButton).text('후기 작성');
				  	$(TXButton).attr('visibility', '');
				    break;
				  default:
				    $(TXButton).text('');
				}
	        	
	        }else{
	        	
	        }
	    },error : function(){
	        //Ajax 실패시
	        console.log('거래 물품 불러오기 실패');
	    }
	});
}

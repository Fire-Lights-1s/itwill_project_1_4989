    let stompClient = null;
    let roomIdJs = null;
    let chatList = null;
	let userId = sessionUserId;
	
    $(document).ready(function(){
        if(userId == 'null' || userId == ''){
            location.replace("../secondhand4989/");
            alert('로그인 후 이용해주세요.');
        }
    });

	function setConnected() {
        $("#chatContent").html("");
    }
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
    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
        setConnected();
        console.log("Disconnected");
    }
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
    
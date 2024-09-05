    let stompClient = null;
    let roomIdJs = 'asddas';
    //let chatListJs = ${chatList};
	//let sender = ${userName};
	
	function setConnected(connected) {
        $("#connect").prop("disabled", connected);
        $("#disconnect").prop("disabled", !connected);
        if (connected) {
            $("#conversation").show();
        }
        else {
            $("#conversation").hide();
        }
        $("#chatting").html("");
    }
    function connect( roomID){
        let socket = new SockJS('/secondhand4989/chatting');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame){
            //setConnected(true);
            console.log('Connected: ', frame);

            stompClient.subscribe('/topic/' + roomID, function (chatMessage){
            	console.log('chatMessage: ', chatMessage);
                showChat(JSON.parse(chatMessage.body));
            });
        });
    }
	function sendChat() {
        if ($("#message").val() != "") {
            stompClient.send("/send/"+roomId, {},
                JSON.stringify({
                    'user_id': sender,
                    'message' : $("#message").val()
                }));
            $("#message").val('');
        }
    }
    //보낸 채팅 보기
    function showChat(chatMessage) {
            console.log(chatMessage);
    }

	//저장된 채팅 불러오기
    function loadChat(chatList){
        if(chatList != null) {
            for(chat in chatList) {
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
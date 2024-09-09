package com.itwillbs.websocket;

import org.json.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class SocketTextHandler extends TextWebSocketHandler {

    private final Set<WebSocketSession> sessions = ConcurrentHashMap.newKeySet();
//    private Set<WebSocketSession> sessions= Collections.synchronizedSet(new HashSet<>());
    /**
     * websocket 연결 성공 시
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
    }

    /**
     * websocket 메세지 수신 및 송신
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        
        // Payload : 통신 시 탑재된 데이터(메세지)
 		System.out.println("전달받은내용:"+message.getPayload());
 		
 		// /websocket/echo.do으로 연결된 객체를 만든 클라이언트들(sessions)
 		// 전달 받은 내용을 보냄
 		for(WebSocketSession s : sessions) {
 			s.sendMessage(message);
 		}
    }

    /**
     * websocket 연결 종료 시
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
}

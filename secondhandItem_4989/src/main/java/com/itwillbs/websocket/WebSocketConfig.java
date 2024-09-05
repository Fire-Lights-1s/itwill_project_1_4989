package com.itwillbs.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.stereotype.Controller;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
    @Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
    	registry.addEndpoint("/chatting")
		.setAllowedOrigins("*")
        .withSockJS();
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.setApplicationDestinationPrefixes("/send"); 
        config.enableSimpleBroker("/topic");
	}

}
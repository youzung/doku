package my.spring.doku;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
//	private final Logger logger =LogManager.getLogManager();
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	public SocketHandler() {
		super();
//		this.logger.info("create SocketHandler instance!");
		System.out.println("create SocketHandler instance!");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		sessionSet.remove(session);
//		this.logger.info("remove session!");
		System.out.println("remove session!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		sessionSet.add(session);
//		this.logger.info("add session!");
		System.out.println("add session!");
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message
			) throws Exception {
		super.handleMessage(session, message);
//		this.logger.info("receive message:" + message.toString());
		System.out.println("receive message:" + message.toString());
		String origin_msg = message.getPayload().toString();
		String nickname = origin_msg.substring(0, origin_msg.indexOf(':'));
		String msg = origin_msg.substring(origin_msg.indexOf(':') + 1);
		System.out.println(nickname);
		System.out.println(msg);
		sendMessage(session.getId(), "<div class ='box'>"+nickname+"<br><div class = 'receiveMsg'>"
				+ msg + "</div></div>");
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
//		this.logger.error("web socket error!", exception);
		System.out.println("web socket error! : " + exception);
	}

	@Override
	public boolean supportsPartialMessages() {
//		this.logger.info("call method!");
		System.out.println("call method!");
		return super.supportsPartialMessages();

	}

	public void sendMessage(String senderId, String message) {
		for (WebSocketSession session : this.sessionSet) {
			if (session.isOpen()) {
				try {
					if (!senderId.equals(session.getId())) {
						session.sendMessage(new TextMessage(message));
					}
				} catch (Exception ignored) {
//					this.logger.error("fail to send message!", ignored);
					System.out.println("fail to send message! :" + ignored);
				}

			}

		}

	}

	@Override

	public void afterPropertiesSet() throws Exception {
//		Thread thread = new Thread() {
//			int i = 0;
//
//			@Override
//			public void run() {
//				while (true) {
//					try {
//						sendMessage("send message index " + i++);
//						Thread.sleep(1000);
//					} catch (InterruptedException e) {
//						e.printStackTrace();
//						break;
//					}
//				}
//			}
//		};
//		thread.start();
	}
}



import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode;

/**
 * sessions가 각 호출 시 마다 생성되므로 static으로 정해줘야 한다.
 * 브라우저가 websocket을 지원 해야 한다.
 * 웹 소켓 연결 후 별도 close 동작 없이 브라우저를 닫을 경우 자동으로 OnClose가 호출된다.
 */
@ServerEndpoint("/webscoketendpoint")
public class WsServer {

	private static final java.util.Set<Session> sessions =
			java.util.Collections.synchronizedSet(new java.util.HashSet<Session>());

       
    /**
     * @Onopne allows us to intercept the creation of a new session.
     * The session class allows us to send data to the user.
     * In the method onOpen, we'll let the user know that the handshake was
     * successful.
     */
	@OnOpen
    public void onOpen(Session session) {
		System.out.println("Open session id : " + session.getId());
	
	try {
		final Basic basic = session.getBasicRemote();
		basic.sendText("Connection Estavlished");
	} catch (IOException e) {
		System.out.println(e.getMessage());
	}
	
	sessions.add(session);
  }
	
  @OnClose
  public void onClose(Session session) {
	  System.out.println("Session " +session.getId()+" has ended");
	  sessions.remove(session);
  }
  
  /**
   * When a user sends a message to the server,
   * this method will intercept the message and allow us to react to it.
   * For now the message is read as a String.
   */
  
  @OnMessage
  public void onMessage(String message, Session session) {
	  System.out.println("Message from " + session.getId() + ": " + message);
	  try {
		final Basic basic = session.getBasicRemote();
		basic.sendText("to : " + message);
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	  
	  sendAllSessionToMessage( session, message );
  }
  
  /**
   * 모든 사용자에게 메세지를 전달한다.
   */
  private void sendAllSessionToMessage(Session self, String message) {
	  try {
		for( Session session : WsServer.sessions) {
			if( ! self.getId().equals(session.getId()) )
				session.getBasicRemote().sendText("All : " + message);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
  }
   
  @OnError
  public void onError( Throwable e, Session session) {
  }
  
}

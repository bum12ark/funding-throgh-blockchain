package exe;

public class ServerMapping {
	MsgServer msgServer = null;
	FileServer fileServer = null;
	
	public ServerMapping() {
		msgServer = new MsgServer(this);
		fileServer = new FileServer(this);
	}
	public static void main(String[] args) {
		new ServerMapping();
	}
}

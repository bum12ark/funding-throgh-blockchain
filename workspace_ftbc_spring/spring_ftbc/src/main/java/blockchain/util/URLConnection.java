package blockchain.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import exe.util.Path;

public class URLConnection {
	// 싱글톤
	private URLConnection() {}

	private static class LazyHolder {
		public static final URLConnection INSTANCE = new URLConnection();
	}

	public static URLConnection getInstance() {
		return LazyHolder.INSTANCE;
	}

	private BufferedReader in = null;

	public void URLCall(String uri) {
		try {
			URL url = new URL("http://"+Path.SERVER_IP+":8000/"+uri);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		} catch (Exception e) {	e.printStackTrace();
		} finally {
			if (in != null)	try {in.close();} catch (Exception e) {e.printStackTrace();}
		}
	}
}
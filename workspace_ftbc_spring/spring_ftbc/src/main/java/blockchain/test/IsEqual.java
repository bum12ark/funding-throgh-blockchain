package blockchain.test;

public class IsEqual {
	public void isEqual(String str1, String str2) {
		if(str1.equals(str2)) {
			System.out.println("일치");
		} else {
			System.out.println("불일치");
		}
		
	}
	public static void main(String[] args) {
		IsEqual ie = new IsEqual();
ie.isEqual("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAAT6RAgQcwqiUa22MdO9LMJLNKJAW+sSqZGLr/Pt4eOlx/cYyMyob4VkF42cm4rlr/N4"
		 , "rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAATHxB0RtJ5nUiIKi0xXaFjfvFlYG5Wy7CZSh7Wz9V1TdBOIsLhFOj9QKCyY4L9OgKZ4");
	}
}

package client.util;

public class Protocol {
	// 10~90
	public static final int JOIN = 10; //회원가입
	public static final int LOGIN = 30;
	public static final int EXIT = 40; //종료
	
	public static final int CREATE_NEW_WALLET = 100; // 지갑생성
	public static final int SEND_NEW_KEYS = 110; // base64된 키페어 클라이언트로 전송
	
	public static final int UPLOAD_END = 300;
	public static final int DOWNLOAD_END = 310;
	
	public static final int CHECKBOX_CHECK = 200; // 자동동기화 체크박스 선택
	public static final int CHECKBOX_UNCHECK = 210; // 자동동기화 체크박스 미선택
	public static final int AUTOSYNC_UPLOAD_START = 220; // 자동동기화 체크박스 되있으니 니 체인 보내줘라
	public static final int AUTOSYNC_UPLOAD_START_LAST = 230; // 자동동기화 체크박스 중 마지막 체인 다운로드
	
	public static final int CHAIN_SYNC_UPLOAD = 410; // 체인 동기화 버튼 체인 업로드
	public static final int CHAIN_SYNC_DOWNLOAD = 430; // 체인 동기화 버튼 체인 다운로드
	public static final int CHAIN_AUTHENTICATE_START = 500; //파일 무결성 검사
	
	
	public static final int AUTOSYNC_CHAIN_UPLOAD = 510; // 자동 동기화 체크박스 체인 업로드
	public static final int AUTOSYNC_CHAIN_UPLOAD_END = 520; // 자동 동기화 체크박스 마지막 체인 업로드
	public static final int AUTOSYNC_CHAIN_DOWNLOAD_ALERT = 530; // 새로운 블록이 추가된 체인 자동동기화 체크되있는 모든 클라이언트에게 다운로드 처리하라고 알림
	public static final int AUTOSYNC_CHAIN_DOWNLOAD = 540; // 새로운 블록이 추가된 체인 자동동기화 체크되있는 모든 클라이언트에게 다운로드
	
	public static final int SEND_KEY_PAIR = 600; // base64 개인키 전송
	public static final int DAMAGED_PRIVATE_KEY = 610; // 개인키가 디코딩 되지 않을 시 
	public static final int VALIDATED_KEYS = 620; // 공개키와 개인키가 맞을 경우
	public static final int UNVERIFIED_KEY = 630; // 공개키와 개인키가 틀릴 경우
	
	public static final int ALERT_ADD_BLOCK = 700; // 서블릿에서 소켓으로 일정주기가 됬음을 알림
	
	public static final int BASE64_DECODE_EXCEPTION = 900; // base64 디코딩 시 클라의 파일이 변경되었거나 여타 경우 발생
	public static final int NOT_HASH_VALID = 910; // 클라이언트와 서버의 마지막 해쉬값이 다를 경우
	public static final int ALREADY_SYNC = 920; // 체인의 사이즈 비교를 했을 때 이미 동기화 되어있는 체인인 경우
	public static final int ADD_BLOCK = 930; // 체인의 사이즈가 달라서 클라이언트의 체인에 성공적으로 블록을 추가 했을 경우
	
	public static String seperator="|"; //구분자
}

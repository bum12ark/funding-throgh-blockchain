package exe.mvc;

import vo.MemberVO;

public class ExeController {
	private String command;
	private ExeLogic exeLogic;
	public static final String EXE_LOGIN = "exeLogin";
	public static final String UPDATE_PUBLIC_KEY = "updatePuk";
	public ExeController(String command) {
		this.command = command;
		exeLogic = new ExeLogic();
	}
	
	public MemberVO send(MemberVO memberVO) {
		if(EXE_LOGIN.equals(command)) {
			exeLogic.exeLogin(memberVO);
		} else if(UPDATE_PUBLIC_KEY.equals(command)) {
			exeLogic.updatePuk(memberVO);
		}
		return memberVO;
	}
}

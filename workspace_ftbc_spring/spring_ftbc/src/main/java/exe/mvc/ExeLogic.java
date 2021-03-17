package exe.mvc;

import vo.MemberVO;

public class ExeLogic {
	private ExeDao exeDao;
	
	public ExeLogic() {
		exeDao = new ExeDao();
	}
	
	public void exeLogin(MemberVO memberVO) {
		exeDao.exeLogin(memberVO);
	}

	public void updatePuk(MemberVO memberVO) {
		exeDao.updatePuk(memberVO);
	}
}

package exe.mvc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import exe.util.DBConnectionMgr;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import vo.MemberVO;

public class ExeDao {
	private Connection connection;
	CallableStatement callableStatement;
	PreparedStatement preparedStatement;
	OracleCallableStatement oracleCallableStatement;
	ResultSet resultSet;
	DBConnectionMgr dbMgr;
	
	public ExeDao() {
		dbMgr = DBConnectionMgr.getInstance();
	}
	//# 로그인
	public void exeLogin(MemberVO memberVO) {
		try {
			connection = DBConnectionMgr.getConnection();
			callableStatement = connection.prepareCall("{call proc_exeLogin(?,?,?,?)}");
			int i = 0;
			callableStatement.setString(++i, memberVO.getMem_email());
			callableStatement.setString(++i, memberVO.getMem_pw());
			callableStatement.registerOutParameter(++i, OracleTypes.VARCHAR);
			callableStatement.registerOutParameter(++i, OracleTypes.VARCHAR);
			callableStatement.execute();
			String loginResult = callableStatement.getString(3);
			String isWalletExist = callableStatement.getString(4);
			memberVO.setResult(loginResult);
			memberVO.setIsWalletExist(isWalletExist);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbMgr.freeConnection(connection, callableStatement);
		}
	}
	//# 지갑 생성 후 사용자의 공개키 UPDATE
	public void updatePuk(MemberVO memberVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE mem                 ");
		sql.append("   SET mem_publickey = ?   ");
		sql.append(" WHERE mem_email = ?       ");
		int i = 0;
		int result = 0;
		try {
			connection = DBConnectionMgr.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setString(++i, memberVO.getMem_publickey());
			preparedStatement.setString(++i, memberVO.getMem_email());
			result = preparedStatement.executeUpdate();
			// 0 : 실패, 1 : 성공
			memberVO.setResult(String.valueOf(result));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbMgr.freeConnection(connection, preparedStatement);
		}
	}
	
}

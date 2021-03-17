package server.initialize;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InitDao {
	private static final Logger logger = LoggerFactory.getLogger(InitDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> initPjWallet() {
		logger.info("initPjWallet: List<String> 호출");
		List<Map<String, Object>> pjCodeList = sqlSessionTemplate.selectList("initPjWallet");
		return pjCodeList;
	}

}

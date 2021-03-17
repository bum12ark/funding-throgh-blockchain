package server.initialize;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chain.ChainLogic;

@Service
public class InitLogic {
	private static final Logger logger = LoggerFactory.getLogger(InitLogic.class);
	@Autowired
	private InitDao initDao = null;
	
	public List<Map<String, Object>> initPjWallet() {
		List<Map<String, Object>> pjCodeList = initDao.initPjWallet();
		return pjCodeList;
	}

}

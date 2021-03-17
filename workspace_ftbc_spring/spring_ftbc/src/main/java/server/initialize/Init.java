package server.initialize;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;

/*
 * 서버 기동 시 초기화가 필요한 녀석
 */
@Component
public class Init {
	private static final Logger logger = LoggerFactory.getLogger(Init.class);
	@Autowired
	private InitLogic initLogic = null;
	private CommonSet commonSet;

	public Init() {
		commonSet = CommonSet.getInstance();
	}

	// # 서버 기동 시 프로젝트 월렛 초기화 -> init-method
	// 1) 공개키 : DB 2) 개인키 : 서버 로컬 저장소
	@PostConstruct
	public void initPjWallet() {
		logger.info("####=======PostConstruct_ initPjWallet");
		List<Map<String, Object>> pjCodeList = initLogic.initPjWallet();
		commonSet.projectWallets.clear();
		for (int i = 0; i < pjCodeList.size(); i++) {
			Map<String, Object> map = pjCodeList.get(i);
			if(map.get("PJ_PUBLICKEY") != null) {
				String projectCode = map.get("PROJECT_CODE").toString();
				String pjBasePuk = map.get("PJ_PUBLICKEY").toString();
				Wallet wallet = new Wallet();
				try {
					PublicKey publicKey = (PublicKey) Base64Conversion.decodeBase64(pjBasePuk);
					String pjBasePrk = Base64Conversion.importPjPrivateKey(commonSet.pjKeyPath(projectCode), projectCode);
					PrivateKey privateKey = (PrivateKey) Base64Conversion.decodeBase64(pjBasePrk);
					wallet.setPublicKey(publicKey);
					wallet.setPrivateKey(privateKey);
				} catch (Exception e) {
					e.printStackTrace();
				}
				commonSet.projectWallets.put(projectCode, wallet);
			}
		}
		logger.info("####=======프로젝트 월렛 사이즈 : " + commonSet.projectWallets.size());
	}
}

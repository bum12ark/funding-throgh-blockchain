package com.funding;

import java.security.PublicKey;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chain.ChainLogic;
import com.project.ProjectLogic;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Transaction;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;
import vo.ProjectVO;
import vo.GiftVO;

@Service
public class FundingLogic {
	private static final Logger logger = LoggerFactory.getLogger(FundingLogic.class);
	
	@Autowired
	FundingDao fundingDao = null;
	
	public List<Map<String, Object>> getTransactionList() {
		List<Map<String, Object>> transactionList = ChainLogic.getTransactionList();
		return transactionList;
	}
	
	public static BlockChain getBlockChain() {
		BlockChain blockChain = null;
		try {
			String blockchain64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			blockChain = (BlockChain) Base64Conversion.decodeBase64(blockchain64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockChain;
		
	}
	
	public ProjectVO getFundDetail(String projectCode, String mem_email) {
		ProjectVO projectDetail =null;
		logger.info("Logic getFundDetail 호출");
		logger.info(projectCode);
		ProjectVO fVO = fundingDao.getProjectDetail(projectCode);
		projectDetail = getDetailFundedMoney(fVO);	
		//상세보기할 프로젝트의 공개키
		
		PublicKey project_key = null; 
		try { 
			project_key =
					(PublicKey)Base64Conversion.decodeBase64(projectDetail.getPj_publickey());
		}catch (Exception e) { 
			e.printStackTrace(); 
		}
		logger.info("프로젝트 키  :  "+project_key);
		// 상세보기할 프로젝트의 후원자 수 담을 변수
		
		int sup_num = 0;
		BlockChain blockChain = getBlockChain();
		/*
		 * 후원자 명수 가져오기
		 * 1. 로컬에서 가져온 블록체인의 사이즈 만큼 for문 돌려서 Block을 뽑아냄
		 * 2. 블럭의 transactions 사이즈만큼 for문을 돌려서 트랜잭션을 뽑아냄
		 * 3. 트랜잭션의 reciepient가 DB에서 가져온 프로젝트의 공개키와 같을경우
		 *    후원자 명 수 ++
		 * 4. projectDetail 맵에 후원자 수 도 put
		 */
		
		//logger.info("block : "+blockChain.blockChain.get(0).transactions.get(0).recipient);
		for(int i=0;i<blockChain.blockChain.size();i++) {
			Block block = blockChain.blockChain.get(i);
			for(int j=0;j<block.transactions.size();j++){
				Transaction transaction = block.transactions.get(j);
				if(project_key.equals(transaction.recipient)) {
					sup_num ++;
				}
			}
		}
		logger.info("펀딩한 인원: "+sup_num);
		List<Map<String,Object>> giftList = new ArrayList<>();
		giftList = fundingDao.getGift(projectCode);
		List<String> giftCode = new ArrayList<>();
		for(int i = 0 ; i < giftList.size();i++) {
			Map<String,Object> gift = new HashMap<String, Object>();
			gift = giftList.get(i);
			giftCode.add(gift.get("GIFT_CODE").toString());
		}
		if(giftCode.size()>0) {
			logger.info("gift : "+giftCode);
			List<Map<String,Object>> giftOptionList = new ArrayList<>();
			giftOptionList = fundingDao.getGiftOption(giftCode);
		}
		projectDetail.setSupport_num(sup_num);
		projectDetail= fundCheck(projectDetail,mem_email);
		return projectDetail;
	}
	
	public static ProjectVO getDetailFundedMoney(ProjectVO pVO) {
	      BlockChain blockChain = getBlockChain();
	      int value = 0;
	      Map<String, Integer> code = new HashMap<String, Integer>();
	            PublicKey project_key = null;
	            try {
	               project_key = (PublicKey) Base64Conversion.decodeBase64(pVO.getPj_publickey());
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	            int sup_num = 0;
	            for (int i = 0; i < blockChain.blockChain.size(); i++) {
	               Block block = blockChain.blockChain.get(i);
	               for (int j = 0; j < block.transactions.size(); j++) {
	                  Transaction transaction = block.transactions.get(j);
	                  if (project_key.equals(transaction.recipient)) {
	                     value += transaction.value;
	                     sup_num++;
	                  }
	               }
	            }
	            String target = (pVO.getFd_targetMoney()).replace(",", "");
	            pVO.setFundedMoney(value);
	            pVO.setFd_targetMoney(target);
	            pVO.setSupport_num(sup_num);
	            int success = (int) ((Double.valueOf(value) / Integer.parseInt(target)) * 100);
	            pVO.setSuccessMoney(success);

	            value = 0;
	   
	      pVO = getDetailOutLine(pVO);
	      return pVO;
	   }
	
   public static ProjectVO getDetailOutLine(ProjectVO pVO) {
	      Map<String, Integer> code = new HashMap<String, Integer>();

	            String proDate = pVO.getFd_deadLine();
	            String strFormat = "yyyy-MM-dd"; // strStartDate 와 strEndDate 의 format
	            Date time = new Date();
	            // SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
	            SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
	            String nowDate = sdf.format(time);
	            long diffDay = 0;
	            try {
	               Date startDate = sdf.parse(proDate);
	               Date endDate = sdf.parse(nowDate);

	               // 두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
	               diffDay = (startDate.getTime() - endDate.getTime()) / (24 * 60 * 60 * 1000);
	            } catch (ParseException e) {
	               e.printStackTrace();
	            }
	            pVO.setOutLine(diffDay);
	      return pVO;
	   }

	public List<Object> getFundGiftDetail(String projectCode) {
		logger.info("Logic getFundGiftDetail 호출성공");
		List<Object> projectGiftDetail  = null;
		projectGiftDetail = fundingDao.getprojectGiftDetail(projectCode);
		List<GiftVO> gList = gift_limited((List<GiftVO>)projectGiftDetail.get(1));
		projectGiftDetail.remove(1);
		projectGiftDetail.add(1,gList);
		return projectGiftDetail;
	}
	
   public ProjectVO fundCheck(ProjectVO projectDetail, String mem_email) {
       PublicKey my_publicKey = null;
       boolean check = false;
       String publicKey = fundingDao.getPublicKey(mem_email);
       if(publicKey!=null) {
          try {
             my_publicKey = (PublicKey) Base64Conversion.decodeBase64(publicKey);
          } catch (Exception e) {
             e.printStackTrace();
          }
          CommonSet commonset = CommonSet.getInstance();
          BlockChain blockChain = getBlockChain();
          for (int i = 0; i < blockChain.blockChain.size(); i++) {
             Block block = blockChain.blockChain.get(i);
             for (int j = 0; j < block.transactions.size(); j++) {
                Transaction transaction = block.transactions.get(j);
                PublicKey funded_publicKey = null;
                if (my_publicKey.equals(transaction.sender)) {
                   funded_publicKey = transaction.recipient;
                   Object keys[] = commonset.projectWallets.keySet().toArray();
                   if (funded_publicKey.equals(transaction.recipient)) {
                      check = true;
               }
                }
             }
          }
       }
       		projectDetail.setCheck(check);
       return projectDetail;
   }
	   
	public List<GiftVO> gift_limited(List<GiftVO> gList) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		int value = 0;
		Map<String, Integer> code = new HashMap<String, Integer>();
		if (gList != null) {
			for (int z = 0; z < gList.size(); z++) {
				if (gList.get(z).getPROJECT_CODE() != null) {
					PublicKey project_key = null;
					try {
						project_key = (PublicKey) Base64Conversion.decodeBase64(gList.get(z).getPj_publickey());
					} catch (Exception e) {
						e.printStackTrace();
					}
					int sup_num = 0;
					for (int i = 0; i < blockChain.blockChain.size(); i++) {
						Block block = blockChain.blockChain.get(i);
						for (int j = 0; j < block.transactions.size(); j++) {
							Transaction transaction = block.transactions.get(j);
							if (project_key.equals(transaction.recipient)) {
								String gift_code = gList.get(z).getGIFT_CODE();
								if (gift_code.equals(transaction.giftCode)) {
									sup_num++;
								}
							}
						}
					}
					if (getTransactionList != null) {
						for (int j = 0; j < getTransactionList.size(); j++) {
							Map<String, Object> transactionMap = getTransactionList.get(j);
							if (project_key.equals(transactionMap.get("projectPuk"))) {
								String gift_code = gList.get(z).getGIFT_CODE();
								if (gift_code.equals(transactionMap.get("p_gift_code"))) {
									sup_num++;
								}
							}
						}
					}
					gList.get(z).setSupport_num(sup_num);
					sup_num = 0;
				}
			}
		}
		return gList;
	}

	public ProjectVO getPayFund(String gift_code,String pjo_code) {
		logger.info("Logic payFund 호출성공");
		ProjectVO payFund = null;
		payFund =fundingDao.getPayFund(gift_code,pjo_code);
		return payFund;
	}

	public List<GiftVO> sortationSelect(List<Object> fundingGiftDetail) {
		List<Object> rVO = null;
		rVO = (List<Object>)fundingGiftDetail;
		List<String> gift_code = (List<String>) rVO.get(0);
		List<GiftVO> gop_option = (List<GiftVO>) rVO.get(1);
		List<String> pList = new ArrayList<String>();
		for(int j=0;j<gop_option.size();j++) {
			pList.add(gop_option.get(j).getGOP_CODE());
		}
		List<GiftVO> sortationSelect = fundingDao.sortationSelect(pList);
		return sortationSelect;
	}

}

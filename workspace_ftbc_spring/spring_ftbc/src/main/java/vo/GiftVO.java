package vo;

public class GiftVO {
	
	//Gift 테이블 관련
	public String GIFT_UNITMONEY    =null;
	public int	  GIFT_ISINCLUDE    =0; 
	public String GIFT_EXPLANATION  =null; 
	public String GIFT_DELIVERYDATE =null; 
	public String GIFT_LIMITED      =null; 
	public String PROJECT_CODE      =null; 
	public String GIFT_CODE         =null;
	
	//GiftOption 테이블관련
	public String GOP_OPTION      = null; 
	public int    GOP_AMMOUNT     = 0; 
	public String GOP_CODE        = null; 
	public String GOP_DESCRIPTION = null;
	
	//GiftOptionDes 테이블 관련 
	public int GOD_SORTATION = 0;
	public String GOD_DESCRIPTION = null;
	
	public int support_num = 0;
	private String pj_publickey = null;
	
	public String getGIFT_UNITMONEY() {
		return GIFT_UNITMONEY;
	}
	public void setGIFT_UNITMONEY(String gIFT_UNITMONEY) {
		GIFT_UNITMONEY = gIFT_UNITMONEY;
	}
	public int getGIFT_ISINCLUDE() {
		return GIFT_ISINCLUDE;
	}
	public void setGIFT_ISINCLUDE(int gIFT_ISINCLUDE) {
		GIFT_ISINCLUDE = gIFT_ISINCLUDE;
	}
	public String getGIFT_EXPLANATION() {
		return GIFT_EXPLANATION;
	}
	public void setGIFT_EXPLANATION(String gIFT_EXPLANATION) {
		GIFT_EXPLANATION = gIFT_EXPLANATION;
	}
	public String getGIFT_DELIVERYDATE() {
		return GIFT_DELIVERYDATE;
	}
	public void setGIFT_DELIVERYDATE(String gIFT_DELIVERYDATE) {
		GIFT_DELIVERYDATE = gIFT_DELIVERYDATE;
	}
	public String getGIFT_LIMITED() {
		return GIFT_LIMITED;
	}
	public void setGIFT_LIMITED(String gIFT_LIMITED) {
		GIFT_LIMITED = gIFT_LIMITED;
	}
	public String getPROJECT_CODE() {
		return PROJECT_CODE;
	}
	public void setPROJECT_CODE(String pROJECT_CODE) {
		PROJECT_CODE = pROJECT_CODE;
	}
	public String getGIFT_CODE() {
		return GIFT_CODE;
	}
	public void setGIFT_CODE(String gIFT_CODE) {
		GIFT_CODE = gIFT_CODE;
	} 
	public String getGOP_OPTION() {
		return GOP_OPTION;
	}
	public void setGOP_OPTION(String gOP_OPTION) {
		GOP_OPTION = gOP_OPTION;
	}
	public int getGOP_AMMOUNT() {
		return GOP_AMMOUNT;
	}
	public void setGOP_AMMOUNT(int gOP_AMMOUNT) {
		GOP_AMMOUNT = gOP_AMMOUNT;
	}
	public String getGOP_CODE() {
		return GOP_CODE;
	}
	public void setGOP_CODE(String gOP_CODE) {
		GOP_CODE = gOP_CODE;
	}
	public String getGOP_DESCRIPTION() {
		return GOP_DESCRIPTION;
	}
	public void setGOP_DESCRIPTION(String gOP_DESCRIPTION) {
		GOP_DESCRIPTION = gOP_DESCRIPTION;
	}
	public int getSupport_num() {
		return support_num;
	}
	public void setSupport_num(int support_num) {
		this.support_num = support_num;
	}
	public String getPj_publickey() {
		return pj_publickey;
	}
	public void setPj_publickey(String pj_publickey) {
		this.pj_publickey = pj_publickey;
	}
	public int getGOD_SORTATION() {
		return GOD_SORTATION;
	}
	public void setGOD_SORTATION(int gOD_SORTATION) {
		GOD_SORTATION = gOD_SORTATION;
	}
	public String getGOD_DESCRIPTION() {
		return GOD_DESCRIPTION;
	}
	public void setGOD_DESCRIPTION(String gOD_DESCRIPTION) {
		GOD_DESCRIPTION = gOD_DESCRIPTION;
	}
}

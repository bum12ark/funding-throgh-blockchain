package vo;

public class ChainVO {
	private String tx_id;
	private String pjo_longtitle;
	private String creator_name;
	private String donator_name;
	private String timeStamp;
	private String pj_publicKey;
	private String mem_publicKey;
	///////////// -2차
	private String project_code;
	private String value;
	private String gift_code;
	private String blockHash;
	
	public String getTx_id() {
		return tx_id;
	}
	public void setTx_id(String tx_id) {
		this.tx_id = tx_id;
	}
	public String getPjo_longtitle() {
		return pjo_longtitle;
	}
	public void setPjo_longtitle(String pjo_longtitle) {
		this.pjo_longtitle = pjo_longtitle;
	}
	public String getCreator_name() {
		return creator_name;
	}
	public void setCreator_name(String creator_name) {
		this.creator_name = creator_name;
	}
	public String getDonator_name() {
		return donator_name;
	}
	public void setDonator_name(String donator_name) {
		this.donator_name = donator_name;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getPj_publicKey() {
		return pj_publicKey;
	}
	public void setPj_publicKey(String pj_publicKey) {
		this.pj_publicKey = pj_publicKey;
	}
	public String getMem_publicKey() {
		return mem_publicKey;
	}
	public void setMem_publicKey(String mem_publicKey) {
		this.mem_publicKey = mem_publicKey;
	}
	public String getProject_code() {
		return project_code;
	}
	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getGift_code() {
		return gift_code;
	}
	public void setGift_code(String gift_code) {
		this.gift_code = gift_code;
	}
	public String getBlockHash() {
		return blockHash;
	}
	public void setBlockHash(String blockHash) {
		this.blockHash = blockHash;
	}
}

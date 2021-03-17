package vo;


public class ProjectVO {
   // DB에 있는것
   private String project_code = null;
   private String subcat_code = null;
   private String mem_email = null;
   private String pj_isedit = null;
   private String pj_publickey = null; // encoding해서 넣어야함
   private String pj_privatekey = null;
   private String pj_account = null;
   private String pj_stat = null;
   private String pj_issuccess = null;
   private String pjo_img = null;
   private String pjo_longtitle = null;
   private String pjo_introduce = null;
   private String pjo_pageaddr = null;
   private String pjo_summary = null;
   private String pjo_nickname = null;
   private String pjo_memimg = null;

   // 프로젝트테이블이 아닌 테이블에서 가져와야 하는것
   private String st_story = null;
   private String maincat_name = null;
   private String subcat_name = null;
   private String fd_targetMoney = null;
   private String fd_deadLine = null;
   private String mem_nickname = null;
   private OutlineVO oVO = null;
   private String gift_unitmoney = null;
   private GiftVO gVO = null;
   private String mem_publicKey = null;
   private String mem_addr = null;
   private String mem_zipcode = null;
   private String gift_code = null;
   
   // 프로젝트 남은 일수
   private long outLine = 0;
   // 목표금액 까지 남은 금액
   private int successMoney = 0;

   // 체인에서 가져와야하는것
   private long fundedMoney = 0; // 펀딩된 금액
   private int fundedvalue = 0; // 펀딩한 금액
   private int support_num = 0; // 후원자 수
   private String txId = null; // 트랜잭션 아이디
   /// 2019-10-16
   private boolean check = false;
   /// 정지우
   private String pj_date;

   public String getPj_date() {
      return pj_date;
   }

   public void setPj_date(String pj_date) {
      this.pj_date = pj_date;
   }

   public boolean isCheck() {
      return check;
   }

   public void setCheck(boolean check) {
      this.check = check;
   }

   public String getProject_code() {
      return project_code;
   }

   public void setProject_code(String project_code) {
      this.project_code = project_code;
   }

   public String getSubcat_code() {
      return subcat_code;
   }

   public void setSubcat_code(String subcat_code) {
      this.subcat_code = subcat_code;
   }

   public String getMem_email() {
      return mem_email;
   }

   public void setMem_email(String mem_email) {
      this.mem_email = mem_email;
   }

   public String getPj_isedit() {
      return pj_isedit;
   }

   public void setPj_isedit(String pj_isedit) {
      this.pj_isedit = pj_isedit;
   }

   public String getPj_publickey() {
      return pj_publickey;
   }

   public void setPj_publickey(String pj_publickey) {
      this.pj_publickey = pj_publickey;
   }

   public String getPj_privatekey() {
      return pj_privatekey;
   }

   public void setPj_privatekey(String pj_privatekey) {
      this.pj_privatekey = pj_privatekey;
   }

   public String getPj_account() {
      return pj_account;
   }

   public void setPj_account(String pj_account) {
      this.pj_account = pj_account;
   }

   public String getPj_stat() {
      return pj_stat;
   }

   public void setPj_stat(String pj_stat) {
      this.pj_stat = pj_stat;
   }

   public String getPj_issuccess() {
      return pj_issuccess;
   }

   public void setPj_issuccess(String pj_issuccess) {
      this.pj_issuccess = pj_issuccess;
   }

   public long getFundedMoney() {
      return fundedMoney;
   }

   public void setFundedMoney(long fundedMoney) {
      this.fundedMoney = fundedMoney;
   }

   public int getSupport_num() {
      return support_num;
   }

   public void setSupport_num(int support_num) {
      this.support_num = support_num;
   }

   public OutlineVO getoVO() {
      return oVO;
   }

   public void setoVO(OutlineVO oVO) {
      this.oVO = oVO;
   }

   @Override
   public String toString() {
      return "UserInfo [num=" + support_num + ", money=" + fundedMoney + ", code=" + project_code + "]";
   }

   public String getMem_nickname() {
      return mem_nickname;
   }

   public void setMem_nickname(String mem_nickname) {
      this.mem_nickname = mem_nickname;
   }

   public String getPjo_img() {
      return pjo_img;
   }

   public void setPjo_img(String pjo_img) {
      this.pjo_img = pjo_img;
   }

   public String getPjo_longtitle() {
      return pjo_longtitle;
   }

   public void setPjo_longtitle(String pjo_longtitle) {
      this.pjo_longtitle = pjo_longtitle;
   }

   public String getPjo_introduce() {
      return pjo_introduce;
   }

   public void setPjo_introduce(String pjo_introduce) {
      this.pjo_introduce = pjo_introduce;
   }

   public String getPjo_pageaddr() {
      return pjo_pageaddr;
   }

   public void setPjo_pageaddr(String pjo_pageaddr) {
      this.pjo_pageaddr = pjo_pageaddr;
   }

   public String getPjo_summary() {
      return pjo_summary;
   }

   public void setPjo_summary(String pjo_summary) {
      this.pjo_summary = pjo_summary;
   }

   public String getFd_deadLine() {
      return fd_deadLine;
   }

   public void setFd_deadLine(String fd_deadLine) {
      this.fd_deadLine = fd_deadLine;
   }

   public String getSt_story() {
      return st_story;
   }

   public void setSt_story(String st_story) {
      this.st_story = st_story;
   }

   public String getSubcat_name() {
      return subcat_name;
   }

   public void setSubcat_name(String subcat_name) {
      this.subcat_name = subcat_name;
   }

   public String getMaincat_name() {
      return maincat_name;
   }

   public void setMaincat_name(String maincat_name) {
      this.maincat_name = maincat_name;
   }

   public String getFd_targetMoney() {
      return fd_targetMoney;
   }

   public void setFd_targetMoney(String fd_targetMoney) {
      this.fd_targetMoney = fd_targetMoney;
   }

   public long getOutLine() {
      return outLine;
   }

   public void setOutLine(long outLine) {
      this.outLine = outLine;
   }

   public int getSuccessMoney() {
      return successMoney;
   }

   public void setSuccessMoney(int successMoney) {
      this.successMoney = successMoney;
   }

   public String getGift_unitmoney() {
      return gift_unitmoney;
   }

   public void setGift_unitmoney(String gift_unitmoney) {
      this.gift_unitmoney = gift_unitmoney;
   }

   public String getPjo_nickname() {
      return pjo_nickname;
   }

   public void setPjo_nickname(String pjo_nickname) {
      this.pjo_nickname = pjo_nickname;
   }

   public String getPjo_memimg() {
      return pjo_memimg;
   }

   public void setPjo_memimg(String pjo_memimg) {
      this.pjo_memimg = pjo_memimg;
   }

   public GiftVO getgVO() {
      return gVO;
   }

   public void setgVO(GiftVO gVO) {
      this.gVO = gVO;
   }

   public int getFundedvalue() {
      return fundedvalue;
   }

   public void setFundedvalue(int fundedvalue) {
      this.fundedvalue = fundedvalue;
   }

   public String getMem_publicKey() {
      return mem_publicKey;
   }

   public void setMem_publicKey(String mem_publicKey) {
      this.mem_publicKey = mem_publicKey;
   }

   public String getMem_addr() {
      return mem_addr;
   }

   public void setMem_addr(String mem_addr) {
      this.mem_addr = mem_addr;
   }

   public String getMem_zipcode() {
      return mem_zipcode;
   }

   public void setMem_zipcode(String mem_zipcode) {
      this.mem_zipcode = mem_zipcode;
   }

   public String getGift_code() {
      return gift_code;
   }

   public void setGift_code(String gift_code) {
      this.gift_code = gift_code;
   }

   public String getTxId() {
      return txId;
   }

   public void setTxId(String txId) {
      this.txId = txId;
   }

}
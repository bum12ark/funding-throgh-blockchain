package blockchain;
import java.io.Serializable;
import java.security.PublicKey;

import blockchain.util.StringUtil;


public class Output implements Serializable {
	private static final long serialVersionUID = -1043434551285379220L;
	public String id;
	public PublicKey recipient;
	public String giftCode;
	public long value;
	public String parentTxId;
	
	public Output(PublicKey recipient, long value, String parentTxId, String giftCode) {
		this.recipient = recipient;
		this.value = value;
		this.parentTxId = parentTxId;
		this.id = StringUtil.applySha256(StringUtil.getStringFromKey(recipient)
										+ Long.toString(value)
										+ parentTxId
										+ giftCode
										);
	}
	
	public boolean isMine(PublicKey publicKey) {
		// return(publicKey == recipient); -> 이렇게 할 경우 주소번지 비교가 되서 base64를 못쓴다.
		return (publicKey.toString().equals(recipient.toString()));
	}
}

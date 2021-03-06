package blockchain;
import java.io.Serializable;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import blockchain.util.StringUtil;



public class Transaction implements Serializable {
	private static final long serialVersionUID = -7729233203265660208L;
	public String txId;
	public PublicKey sender;
	public PublicKey recipient;
	public long value;
	public String giftCode; // 무슨 선물을 선택했는지 알기 위한 코드
	public Map<String, Object> godMap; // 어떠한 선물 옵션을 선택했는 지 알기위한 컬랙션
	public Map<String, Object> addrMap; // AES256 암호화를 이용하여 만든 주소 암호화 _ zipcode/addr/addr_detail
	public byte[] signature;
	public List<Input> inputs = new ArrayList<Input>();
	public List<Output> outputs = new ArrayList<Output>();
	public String timeStamp;
	public static int sequence = 0;
	// # 생성자
	public Transaction(PublicKey from, PublicKey to, String giftCode, long value, List<Input> inputs, String timeStamp
			, Map<String, Object> godMap, Map<String, Object> addrMap) {
		this.sender = from;
		this.recipient = to;
		this.giftCode = giftCode;
		this.value = value;
		this.inputs = inputs;
		this.timeStamp = timeStamp;
		this.godMap = godMap;
		this.addrMap = addrMap;
	}
	// # 트랜잭션 아이디를 만드는 부분
	public String calculateHash() {
		sequence++;
		return StringUtil.applySha256(
				StringUtil.getStringFromKey(sender)
				+ StringUtil.getStringFromKey(recipient)
				+ Long.toString(value)
				+ giftCode
				+ timeStamp
				+ sequence
				);
	}
	// 변조하고 싶지 않은 모든 데이터에 서명함.
	public void generateSignature(PrivateKey privateKey) {
		String data = StringUtil.getStringFromKey(sender) 
					+ StringUtil.getStringFromKey(recipient)
					+ Long.toString(value)
					+ giftCode
					+ timeStamp;
		signature = StringUtil.applyECDSASig(privateKey, data);
	}
	// 서명 한 데이터가 변조되지 않았는지 확인
	public boolean verifiySignature() {
		String data = StringUtil.getStringFromKey(sender) 
				+ StringUtil.getStringFromKey(recipient)
				+ Long.toString(value)
				+ giftCode
				+ timeStamp;
		return StringUtil.verifyECDSASig(sender, data, signature);
	}
	// 새 트랜잭션을 만들 수 있는 경우 true를 반환
	public boolean processTransaction(BlockChain blockChain) {
		if(verifiySignature() == false) {
			System.out.println("#트랜잭션 서명 증명 실패");
			return false;
		}
		// 트랜잭션 입력을 수집한다.(사용하지 않았는지 확인)
		for(Input i : inputs) {
			i.UTXO = blockChain.UTXOs.get(i.outputId);
		}
		// 거래가 유효한지 확인
		if(getInputsValue() < blockChain.minimumTransaction) {
			System.out.println("#Transaction Inputs to small : "+getInputsValue());
			return false;
		}
		// 트랜잭션 출력을 생성
		long leftOver = getInputsValue() - value; // 인풋한 값을 얻어오고 잔액을 남긴다.
		txId = calculateHash();
		// 수신자에게 값을 보냄
		outputs.add(new Output(this.recipient, value, txId, giftCode));
		// 남은 잔액을 발신자에게 다시 보낸다.
		outputs.add(new Output(this.sender, leftOver, txId, giftCode));
		// 미사용 목록에 출력 추가
		for(Output o : outputs) {
			blockChain.UTXOs.put(o.id, o);
		}
		// 지출 한대로 UTXO 목록에서 트랜잭션 입력을 제거 한다.
		for(Input i : inputs) {
			if(i.UTXO == null) continue; // 거래를 찾을 수 없으면 건너 뛰라
			blockChain.UTXOs.remove(i.UTXO.id);
		}
		return true;
	}
	// 입력 합계(UTXO) 값을 반환한다.
	public long getInputsValue() {
		long total = 0L;
		for(Input i : inputs) {
			if(i.UTXO == null) continue; // 거래를 찾을 수 없으면 건너 뛰어라.
			total += i.UTXO.value;
		}
		return total;
	}	
	// 출력 합계를 반환합니다.
	public long getOutputsValue() {
		long total = 0L;
		for(Output o : outputs) {
			total += o.value;
		}
		return total;
	}
}

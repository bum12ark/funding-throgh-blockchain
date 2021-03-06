package blockchain;
import java.io.Serializable;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Security;
import java.security.spec.ECGenParameterSpec;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import ch.qos.logback.classic.Logger;


public class Wallet implements Serializable {
	private static final long serialVersionUID = 7507404164858826093L;
	private PrivateKey privateKey;
	private PublicKey publicKey;
	public PrivateKey getPrivateKey() {
		return privateKey;
	}
	public void setPrivateKey(PrivateKey privateKey) {
		this.privateKey = privateKey;
	}
	public PublicKey getPublicKey() {
		return publicKey;
	}
	public void setPublicKey(PublicKey publicKey) {
		this.publicKey = publicKey;
	}
	public Map<String, Output> UTXOs = new HashMap<>(); // 소유자의 잔고 관리
	// # 생성자
	public Wallet() {
		Security.addProvider(new BouncyCastleProvider());
	}
	// # 지갑에 해당하는 공개키, 개인키 생성
	public void generateKeyPair() {
		try {
			KeyPairGenerator keyGen = KeyPairGenerator.getInstance("ECDSA", "BC");
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			ECGenParameterSpec ecSpec = new ECGenParameterSpec("prime192v1");
			keyGen.initialize(ecSpec, random);
			KeyPair keyPair = keyGen.generateKeyPair();
			privateKey = keyPair.getPrivate();
			publicKey = keyPair.getPublic();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	// # 지갑의 잔고 반환
	public long getBalance(BlockChain blockChain) {
		long total = 0L;
		for(Map.Entry<String, Output> item : blockChain.UTXOs.entrySet()) {
			Output UTXO = item.getValue();
			if(UTXO.isMine(publicKey)) {
				UTXOs.put(UTXO.id, UTXO);
				total += UTXO.value;
			}
		}
		return total;
	}
	// 새 거래를 생성하고 반환함
	public Transaction sendFunds(BlockChain blockChain, PublicKey _recipient, String giftCode
									, long value, String timeStamp
			,Map<String, Object> godMap, Map<String, Object> addrMap) throws Exception {
		System.out.println("[Wallet]_sendFunds: Transaction 호출");
		if(getBalance(blockChain) < value) { // 잔액을 모으고 자금을 확인하십시오 
			System.out.println("#Not Enough funds to send transaction. Transaction Discarded.");
			return null;
		}
		// 입력 배열 목록을 만든다.
		List<Input> inputs = new ArrayList<>();
		long total = 0L;
		for(Map.Entry<String, Output> item : UTXOs.entrySet()) {
			Output UTXO = item.getValue();
			// MoneyChain의 OutputID
			total += UTXO.value;
			Input i = new Input(UTXO.id);
			System.out.println("######################## Input 클래스의 outputID : "+i.outputId);
			inputs.add(i);
			if(total>value) break;
		}
		Transaction newTransaction = new Transaction(publicKey, _recipient, giftCode, value, inputs, timeStamp, godMap, addrMap);
		newTransaction.generateSignature(privateKey);
		for(Input input : inputs) {
			UTXOs.remove(input.outputId);
		}
		return newTransaction;
	}
}

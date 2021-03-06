package blockchain.test;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import blockchain.util.AES256Util;

public class AES256Test {
	public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		AES256Util aes = new AES256Util("키값");
		String encryption = aes.encrypt("평문");
		System.out.println("encryption : "+encryption);
		String decryption = aes.decrypt(encryption);
		System.out.println("decryption : "+decryption);
	}
}

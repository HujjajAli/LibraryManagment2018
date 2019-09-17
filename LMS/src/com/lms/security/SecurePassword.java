package com.lms.security;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.swing.JOptionPane;

public class SecurePassword {
	
	private static final Random RANDOM   = new SecureRandom();
	
	private static final String ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqwrstuvwxyz";
	private static final int ITRATION    = 1000;
	private static final int KEY_LENGTH  = 256;
	
	public static String getSalt(int length){
		StringBuilder returnValue = new StringBuilder(length);
		for(int i=0;i<length;i++){
			returnValue.append(ALPHABET.charAt(RANDOM.nextInt(ALPHABET.length())));
		}
		return new String(returnValue);
	}
	
	private static byte[] hash(char[] password,byte[] salt) {
		PBEKeySpec spec = new PBEKeySpec(password,salt,ITRATION,KEY_LENGTH);
		Arrays.fill(password,Character.MIN_VALUE);
		try{
			SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			return skf.generateSecret(spec).getEncoded();
		}catch(NoSuchAlgorithmException | InvalidKeySpecException e){
			throw new AssertionError("Error While hashing a Password : "+e.getMessage(),e);
		}finally{
			spec.clearPassword();
		}
		
		
	}
	
	public static String generateSecurePassword(String password,String salt){
		String returnValue = null;
		byte[] securePassword = hash(password.toCharArray(),salt.getBytes());
		returnValue = Base64.getEncoder().encodeToString(securePassword);
		return returnValue;
	}
	
	public static boolean verifyUserPassword(String providedPassword,String securePassword,String salt){
		boolean verify = false;
		
		String newSecurePassword = generateSecurePassword(providedPassword, salt);
		
		//check if two password are same
		verify = newSecurePassword.equalsIgnoreCase(securePassword);
		return verify;
	}
	
	public static void main(String[] args){
		String upass   = JOptionPane.showInputDialog("Enter Password");
		String salt    = getSalt(6);
		String secureP = generateSecurePassword(upass,salt);
		
		JOptionPane.showMessageDialog(null, "Password "+secureP);
		JOptionPane.showMessageDialog(null, "Salt "+salt);
		
		String newUPass   = JOptionPane.showInputDialog("Enter Once Again Your Password");
		
		if(verifyUserPassword(newUPass, secureP, salt)){
			JOptionPane.showMessageDialog(null, "Same Fuckin User");
		}else{
			JOptionPane.showMessageDialog(null, "Some Other Mother Fucker");
		}
		//System.out.println("It Will Not Println");
	}
}

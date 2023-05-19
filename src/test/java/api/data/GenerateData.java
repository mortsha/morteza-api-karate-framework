package api.data;

import java.util.Random;

public class GenerateData {

	public static String getEmail() {
		String email = "Smile";
		String provider = "@Canada.com";
		int randomNumber = (int) (Math.random() * 10000);
		String autoEmail = email + randomNumber + provider;
		return autoEmail;
	}

	// use 10 random for phone
	// and for license

	public static String getPhone() {
		int randomPhoneFirst = (int) (Math.random() * 1000);
		int randomPhoneSecond = (int) (Math.random() * 1000);
		int randomPhoneThird = (int) (Math.random() * 10000);

		String autoPhone = "(" + randomPhoneFirst + ")" + "-" + randomPhoneSecond + "-" + randomPhoneThird;
		return autoPhone;
	}

	public static String getRandomLicense() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		int count = 4;
		for (int i = 0; i < count; i++) {
			int randomIndex = random.nextInt(letters.length());
			char randomChar = letters.charAt(randomIndex);
			sb.append(randomChar);
		}
		sb.append(" ");
		for (int i = 0; i < 4; i++) {
			int randomDigit = (int) (Math.random() * 10);
			sb.append(randomDigit);
		}
		return sb.toString();
	}


	public static String getPhoneNumber() {
		String phoneNumber = "9";
		for (int i = 0; i < 9; i++) {
			phoneNumber += (int) (Math.random() * 10);
		}
		return phoneNumber;
	}

	public static String getPhoneNumber1() {
		String phoneNumber = "1";
		for (int i = 0; i < 9; i++) {
			phoneNumber += (int) (Math.random() * 3);
		}
		String phoneNumber1 = "1";
		for (int i = 0; i < 9; i++) {
			phoneNumber1 += (int) (Math.random() * 3);
		}
		String phoneNumber2 = "1";
		for (int i = 0; i < 9; i++) {
			phoneNumber2 += (int) (Math.random() * 4);
		}
		String all = phoneNumber + phoneNumber1 + phoneNumber2;
		return all;
	}
	public static void main(String[] args) {
		System.out.println(getPhoneNumber());
		System.out.println(getRandomLicense());
		System.out.println(getPhoneNumber1());
	}
}

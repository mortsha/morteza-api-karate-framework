package api.data;

import java.util.Random;


public class GenerateData {

	public static void main(String[] args) {
		System.out.println(getPhoneNumber());
		System.out.println(getRandomLicense());
		System.out.println(getNewPhone());
		System.out.println(getPhoneNumber());
		System.out.println(getNewRanodmLicense());
		System.out.println(getAddressLine());
		System.out.println(getPostalCode());
	}

	public static String getPostalCode() {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		char randomChar1 = letters.charAt(random.nextInt(letters.length()));
		char randomChar2 = letters.charAt(random.nextInt(letters.length()));
		char randomChar3 = letters.charAt(random.nextInt(letters.length()));
		String numbers = "0123456789";
		char randomNum1 = numbers.charAt(random.nextInt(numbers.length()));
		char randomNum2 = numbers.charAt(random.nextInt(numbers.length()));
		char randomNum3 = numbers.charAt(random.nextInt(numbers.length()));

		sb.append(randomChar1);
		sb.append(randomNum1);
		sb.append(randomChar2);
		sb.append(randomNum2);
		sb.append(randomChar3);
		sb.append(randomNum3);
		return sb.toString();
	}

	public static String getAddressLine() {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		String streetNum = "";
		for (int i = 0; i < 4; i++) {
			streetNum += (int) (Math.random() * 10);
		}
		sb.append(streetNum);
		sb.append(" ");
		String[] streetNames = { "Maple", "Oak", "Cedar", "Pine", "Elm", "Birch", "Willow", "Cherry" };
		int randomIndex = random.nextInt(streetNames.length);
		String street = streetNames[randomIndex];
		sb.append(street);

		return sb.toString();
	}

	public static String getEmail() {
		String email = "Smile";
		String provider = "@Canada.com";
		int randomNumber = (int) (Math.random() * 10000);
		String autoEmail = email + randomNumber + provider;
		return autoEmail;
	}

	public static String getNewEmail() {
		String email = "RRCT";
		String provider = "@poi.com";
		int randomNumber = (int) (Math.random() * 10000);
		String randomEmail = email + randomNumber + provider;
		return randomEmail;
	}

	public static String getNewPhone() {
		String phoneNumber = "";
		for (int i = 0; i < 10; i++) {
			phoneNumber += (int) (Math.random() * 10);
		}

		return phoneNumber;
	}

	public static String getNewRanodmLicense() {

		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		for (int i = 0; i < 4; i++) {
			int randomIndex = random.nextInt(letters.length());
			char randomChar = letters.charAt(randomIndex);
			sb.append(randomChar);
		}
		sb.append(" ");
		String num = "";
		for (int i = 0; i < 3; i++) {
			num += (int) (Math.random() * 10);
		}
		sb.append(num);

		return sb.toString();
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

}

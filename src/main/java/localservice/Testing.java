package localservice;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class Testing {

	public static void main(String[] args) {
//		StringBuilder sb = new StringBuilder();
//		String alphabet= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//        String s = "";
//        Random random = new Random();
//        sb.append(String.valueOf(random.nextInt(9)));
//        int randomLen = 5;
//        for (int i = 0; i < randomLen; i++) {
//            char c = alphabet.charAt(random.nextInt(26));
//            s+=c;
//        } 
//        sb.append(s);
//        sb.append(String.valueOf(random.nextInt(9)));
//        System.out.println(sb.toString()); 
		PasswordEncoder encoder = new BCryptPasswordEncoder(11);
		System.out.println(encoder.encode("staff123"));
	}

}

package springweb.a04_di_last;

import org.springframework.stereotype.Service;

@Service
public class A04_Service {
	public String gerGreet() {
		return "안녕하세요(의존)";
	}
}

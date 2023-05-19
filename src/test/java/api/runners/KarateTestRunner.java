package api.runners;

import java.util.List;

import com.intuit.karate.junit5.Karate;

public class KarateTestRunner {

	@Karate.Test
	Karate testSystemProperty() {
		// run() method required path to feature files.
		// you can use tags() method to specify the Tags.
		return Karate.run("classpath:features")
				.tags("Regression");
	}
	
}

package co.com.fakestore.api;

import com.intuit.karate.junit5.Karate;

public class RunnerFakeStore {

    @Karate.Test
    Karate runAllTests() {
        return Karate.run("classpath:features");
    }
}

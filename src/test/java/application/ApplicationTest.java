package application;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import io.cucumber.junit.CucumberOptions;
@CucumberOptions(
        plugin = {
                "pretty",
                "html:test-output.html",
                "json:target/cucumber-report/cucumber.json", // third-party se build ra report tu path nay
                "me.jvt.cucumber.report.PrettyReports:target/maven-cucumber-report"
        }
)
class ApplicationTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:application").tags("@debug")
                .outputCucumberJson(true)
                .parallel(5);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Conduit Application");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();


//        String cucumberJsonPath = "target/cucumber-report/cucumber.json";
//        File reportOutputDirectory = new File("target/cucumber-html-report");
//        List<String> jsonFiles = new ArrayList<>();
//        jsonFiles.add(cucumberJsonPath);
//
//        Configuration configuration = new Configuration(reportOutputDirectory, "Swagger");
//        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
//        reportBuilder.generateReports();

    }

//    @Test
//    void testHomePage() {
//        Results results = Runner.path("classpath:application")
//                .tags("@debug")
//                .parallel(5);
//        assertEquals(0, results.getFailCount(), results.getErrorMessages());
//    }
}

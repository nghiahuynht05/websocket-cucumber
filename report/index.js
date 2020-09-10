var reporter = require('cucumber-html-reporter');

var options = {
    theme: 'bootstrap',
    jsonFile: 'feature/report/cucumber-report.json',
    output: 'feature/report/cucumber-report.html',
    reportSuiteAsScenarios: true,
    storeScreenshots: true,
    screenshotsDirectory: 'test/screenshots/',
    scenarioTimestamp: true,
    launchReport: true,
    name: "UAT Driver Pegasus App",
    metadata: {
        "App Version": "mycardriver-V4.6.4000-R123005-D20191230-C4000-S1-GooglePlay.apk",
        "Test Environment": "Windows 7 - APPIUM & WebdriverIO",
        "Platform": "Android 5.1.1",
        "Parallel": "Scenarios",
        "Executed": "Remote"
    }
};
reporter.generate(options);

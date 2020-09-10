Feature: Get setting notification driver app
    As an driver,
    I want to get setting notification

    Background:

    Scenario: 01. Check case update profile with idNumber incorrect format NRIC: ABC
        Given I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv      | password |
            | android  | haidr   | +447400456789 | driver  | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event         | requestData |
            | getDriverInfo |             |
        Then I should get the object result matches with
            | response                                                                                           |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"ABC","profileStatus":0}}} |

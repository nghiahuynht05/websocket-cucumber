Feature: Promotion program from MoF for Mycar: Edit profile passenger
    As an passenger,
    I want to update info passenger

    Background:

    Scenario: 01. Check case verify info booking top srceen booking with setting show fare
        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400123456 | passenger | 1211       | 354741079903994 | MyCar   | 4.6.4200 | password |

        When I send a web socket request with event and data
            | event | requestData                                      |
            | f5    | {"geo":[108.21882181414884,16.071195109022806] } |

        Then I should get the object result matches with
            | response |
            | {}       |

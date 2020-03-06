Feature: Promotion program from MoF for Mycar: Edit profile passenger
    As an passenger,
    I want to update info passenger

    Background:

    Scenario: 01. Check case verify info booking top srceen booking with setting show fare
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                               |
            | editProfile | {"firstName":"Tiki","lastName":"Customer 01","gender":"0","idPhoto":"ABC","idNumber":"/9j/4AAQSkZJRgABA"} |

        Then I should get the object result matches with
            | response |
            | {}       |

Feature: Passenger get setting force ratting booking
    As an passenger,
    I want to get setting ratting

    Background:

    # Scenario: 01. Check case return setting remind ratting to booking turn on
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv      | password |
    #         | android  | haidr   | +447400123789 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

    #     When I send a web socket request with event and data
    #         | event       | requestData |
    #         | getUserInfo |             |
    #     Then I should get the object result matches with
    #         | response                                |
    #         | {"fleetInfo":{"remindPaxToRate": true}} |

    # Scenario: 02. Check case return setting remind ratting to booking turn off
    #     Given I want to register account
    #         | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
    #         | android  | tiki    | +60123456789 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

    #     When I send a web socket request with event and data
    #         | event       | requestData |
    #         | getUserInfo |             |
    #     Then I should get the object result matches with
    #         | response                                 |
    #         | {"fleetInfo":{"remindPaxToRate": false}} |

    Scenario: 03. Check case return list booking not rating
        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | haidr   | +447400456789 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event               | requestData |
            | remindRatingBooking |             |
        Then I should get the object result matches with
            | response                            |
            | {"remindBookToRate":["3123519648"]} |

    Scenario: 04. Check case return list booking not rating
        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | haidr   | +447400456789 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_p | qup    |

        When send a API "/api/rating/skip-remind" request with access token and data
            | body                                                         |
            | {"userId":"5dad29c821de53037a30d0fb", "bookId":"3123519718"} |
        Then I should get the object result matches with
            | response                |
            | {"bookId":"3123519718"} |

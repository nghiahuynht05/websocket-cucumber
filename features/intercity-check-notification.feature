Feature: Driver check info intercity tab request
    As an driver,
    I want to check info trip (icon red)

    Background:
        Given an api token after logined command center

    Scenario: 01. Driver check info trip type request (icon red)
        Given I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        And send a GET API "/api/v3/intercity/notifications?tripType=requested" request with access token and data
            | body |
            | {}   |

        Then I should get the object result matches with
            | response         |
            | {"check": false} |

        And send a GET API "/api/v3/intercity/route-notifications?tripType=requested" request with access token and data
            | body |
            | {}   |

        Then I should get the object result matches with
            | response                           |
            | {"check":false,"notifications":[]} |

    # Scenario: 02. Driver check info trip type scheduled (icon red)
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     And send a GET API "/api/v3/intercity/notifications?tripType=scheduled" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response         |
    #         | {"check": false} |

    #     And send a GET API "/api/v3/intercity/route-notifications?tripType=scheduled" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response                           |
    #         | {"check":false,"notifications":[]} |

    # Scenario: 03. Driver check info trip type request (icon red)
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

    #     And Passenger create jobs intercity
    #         | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-06 09:00       | 2020-09-06 09:30   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | requested        | Intercity                  | haidr           |

    #     And I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     And send a GET API "/api/v3/intercity/notifications?tripType=requested" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response        |
    #         | {"check": true} |

    #     And send a GET API "/api/v3/intercity/route-notifications?tripType=requested" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response                                                                                              |
    #         | {"check": true,"notifications":[{"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"check":true}]} |

    # Scenario: 04. Driver check info trip type scheduled (icon red)
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

    #     And Passenger create jobs intercity
    #         | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-06 13:30       | 2020-09-06 14:00   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | scheduled        | Intercity                  | haidr           |

    #     And I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     And send a GET API "/api/v3/intercity/notifications?tripType=scheduled" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response        |
    #         | {"check": true} |

    #     And send a GET API "/api/v3/intercity/route-notifications?tripType=scheduled" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response                                                                                               |
    #         | {"check": true","notifications":[{"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"check":true}]} |


Feature: Driver request accepetd trip
    As an driver,
    I want to accepted trip

    Background:
        Given an api token after logined command center

    # Scenario: 01. Driver accepted trip success
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400123585 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |

    #     And Passenger create jobs intercity
    #         | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-06 09:00       | 2020-09-06 09:30   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | requested        | Intercity                  | haidr           |

    #     And I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     And send a GET API "/api/v3/intercity/trips?routeId=5ecde9c3caffae4d11f82b18&routeNumber=1&page=1&limit=20" request with access token and data
    #         | body |
    #         | {}   |

    #     When send a API accepeted trip
    #         | tripId |
    #         | 1111   |
    #     Then I should get the object result matches with
    #         | response                                                        |
    #         | {"tripType":"requested","fleetId":"haidr","status":"confirmed"} |

    Scenario: 02. Driver accepted trip is not exists
        And I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        And send a GET API "/api/v3/intercity/trips?routeId=5ecde9c3caffae4d11f82b18&routeNumber=1&page=1&limit=20" request with access token and data
            | body |
            | {}   |

        # When send a API accepeted trip
        #     | tripId |
        #     | 1111   |
        # Then I should get the object result matches with
        #     | response                                                                   |
        #     | {"statusCode":404,"code":"NOT_FOUND","details":"Trip not found","data":{}} |

Feature: Driver cancel trip
    As an driver,
    I want to cancel trip

    Background:

    Scenario: 01. Driver cancel trip type preferred status confirmed
        Given I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        And send a API "/api/v3/intercity/trips" request with access token and data
            | body                                                                                                                                            |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-09","time":"08:30","pickUpTime":"08:00","tripType":"preferred","seats":3} |

        And I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

        When Driver canceled trip

        Then I should get the object result matches with
            | response   |
            | {"code":1} |

    Scenario: 02. Driver cancel trip type preferred having booking type request
        Given I want to register account
            | platform | fleetId | phone        | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +12045550005 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 2045550005  | CA          | 354741079903994 | haidr_d | qup    |

        And send a API "/api/v3/intercity/trips" request with access token and data
            | body                                                                                                                                            |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-12","time":"08:15","pickUpTime":"08:00","tripType":"preferred","seats":5} |

        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Passenger create jobs intercity
            | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-10 08:00       | 2020-09-10 08:15   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | requested        | Intercity                  | haidr           |

        And I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

        When Driver canceled trip

        Then I should get the object result matches with
            | response   |
            | {"code":1} |

    Scenario: 03. Driver cancel trip type preferred having booking type scheduled
        Given I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        And send a API "/api/v3/intercity/trips" request with access token and data
            | body                                                                                                                                            |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-11","time":"14:15","pickUpTime":"14:00","tripType":"preferred","seats":3} |

        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Passenger create jobs intercity
            | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-11 14:00       | 2020-09-11 14:15   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | scheduled        | Intercity                  | haidr           |

        And I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

        When Driver canceled trip

        Then I should get the object result matches with
            | response   |
            | {"code":1} |

    Scenario: 04. Driver cancel trip type preferred having booking type scheduled and request
        Given I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        And send a API "/api/v3/intercity/trips" request with access token and data
            | body                                                                                                                                            |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-11","time":"14:30","pickUpTime":"14:15","tripType":"preferred","seats":3} |

        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Passenger create jobs intercity
            | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-11 14:15       | 2020-09-11 14:30   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | requested        | Intercity                  | haidr           |

        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447408123456 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Passenger create jobs intercity
            | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-11 14:15       | 2020-09-11 14:30   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | scheduled        | Intercity                  | haidr           |

    Scenario: 05. Driver cancel trip type request having booking type request
        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Passenger create jobs intercity
            | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-12 08:00       | 2020-09-12 08:15   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | requested        | Intercity                  | haidr           |

        And I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        And send a GET API "/api/v3/intercity/trips?routeId=5ecde9c3caffae4d11f82b18&routeNumber=1&page=1&limit=20" request with access token and data
            | body |
            | {}   |

        When send a API accepeted trip
            | tripId |
            | 1111   |

        When Driver canceled trip

        Then I should get the object result matches with
            | response   |
            | {"code":1} |

    Scenario: 06. Driver cancel trip type preferred status Started
        Given I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        And send a API "/api/v3/intercity/trips" request with access token and data
            | body                                                                                                                                            |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-09","time":"17:15","pickUpTime":"17:00","tripType":"preferred","seats":3} |

        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |

        And Passenger create jobs intercity
            | intercityInfo                                          | request.pickUpTimeFrom | request.pickUpTime | request.pickup.geo                      | request.destination.geo  | request.tripType | request.vehicleTypeRequest | request.fleetId |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1} | 2020-09-09 17:00       | 2020-09-09 17:15   | [108.21870289311524,16.075064769696706] | [108.2468342,16.0732782] | requested        | Intercity                  | haidr           |

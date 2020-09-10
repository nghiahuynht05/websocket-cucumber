Feature: Driver request create trip type preferred
    As an driver,
    I want to create trip type preferred

    Background:
        Given an api token after logined command center

    # Scenario: 01. Driver create trip type preferred with routeId validate
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b11","routeNumber":1,"date":"2020-08-28","time":"14:30","pickUpTime":"14:00","tripType":"preferred","seats":1} |
    #     Then I should get the object result matches with
    #         | response                                  |
    #         | {"statusCode":400,"code":"RouteNotFound"} |

    # Scenario: 02. Driver create trip type preferred with routeNumber validate
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":2,"date":"2020-08-28","time":"14:30","pickUpTime":"14:00","tripType":"preferred","seats":1} |
    #     Then I should get the object result matches with
    #         | response                                  |
    #         | {"statusCode":400,"code":"RouteNotFound"} |

    # Scenario: 03. Driver create trip type preferred with date is validate
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-08-28","time":"08:30","pickUpTime":"08:00","tripType":"preferred","seats":1} |
    #     Then I should get the object result matches with
    #         | response                                         |
    #         | {"statusCode":400,"code":"DepartureTimeInvalid"} |

    # Scenario: 04. Driver create trip type preferred with time is validate
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                           |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-05","time":"a:00","pickUpTime":"04:00","tripType":"preferred","seats":1} |
    #     Then I should get the object result matches with
    #         | response                                         |
    #         | {"statusCode":400,"code":"DepartureTimeInvalid"} |

    # Scenario: 05. Driver create trip type preferred with carType is validate
    #     Given I want to register account
    #         | platform | fleetId | phone        | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +84348811001 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 348811001   | VN          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-05","time":"08:30","pickUpTime":"08:00","tripType":"preferred","seats":1} |
    #     Then I should get the object result matches with
    #         | response                                   |
    #         | {"statusCode":400,"code":"CarTypeInvalid"} |

    # Scenario: 06. Driver create trip type preferred with seats < minimum seats
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-04","time":"14:30","pickUpTime":"14:00","tripType":"preferred","seats":1} |
    #     Then I should get the object result matches with
    #         | response                                                                             |
    #         | {"statusCode":400,"code":"MinimumSeats","details":"Warning minimum seats","data":{}} |

    # Scenario: 07. Driver create trip type preferred with seats > default seat car type
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                             |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-04","time":"14:30","pickUpTime":"14:00","tripType":"preferred","seats":10} |
    #     Then I should get the object result matches with
    #         | response                                                                                                        |
    #         | {"statusCode":400,"code":"SeatsOverCapacity","details":"Request seats is over the car type capacity","data":{}} |

    # Scenario: 08. Driver create trip type preferred with time without work timerange
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-05","time":"04:00","pickUpTime":"04:30","tripType":"preferred","seats":2} |
    #     Then I should get the object result matches with
    #         | response                                         |
    #         | {"statusCode":400,"code":"DepartureTimeInvalid"} |

    # Scenario: 08. Driver create trip type preferred pickup overlap
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                       |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-10","time":"14:00","pickUpTime":"","tripType":"preferred","seats":3} |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-10","time":"14:30","pickUpTime":"14:00","tripType":"preferred","seats":3} |

    #     Then I should get the object result matches with
    #         | response                                                                                                 |
    #         | {"statusCode":400,"code":"OverLapTrip","details":"You have offered another trip at this time","data":{}} |

    # Scenario: 09. Driver create trip type preferred time match with scheduled trip
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a API "/api/v3/intercity/trips" request with access token and data
    #         | body                                                                                                                                            |
    #         | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-10","time":"14:30","pickUpTime":"14:30","tripType":"preferred","seats":3} |
    #     Then I should get the object result matches with
    #         | response                                                                                                   |
    #         | {"trip":{"trip":{"seats":3,"tripType":"scheduled","routeNumber":1,"status":"confirmed"}},"code":"Success"} |

    Scenario: 10. Driver create trip type preferred success
        Given I want to register account
            | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

        When send a API "/api/v3/intercity/trips" request with access token and data
            | body                                                                                                                                            |
            | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-09","time":"08:30","pickUpTime":"08:00","tripType":"preferred","seats":3} |
        Then I should get the object result matches with
            | response                                                                                          |
            | {"trip":{"trip":{"seats":1,"tripType":"","routeNumber":1,"status":"confirmed"}},"code":"Success"} |

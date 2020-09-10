Feature: Passenger get setting route
    As an passenger,
    I want to get setting route

    Background:

    Scenario: 01. Passenger get setting pricing route
        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
            | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |
        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_p | qup    |

        And send a GET API "/api/v3/intercity/route-pricing?routeFromZoneId=5f52080ff4e3940117eebaec&routeToZoneId=5f520835b944fd38469260b9" request with access token and data
            | body |
            | {}   |

        Then I should get the object result matches with
            | response                                                                                                                               |
            | {"carTypeFirstToSecond":[{"routeSettings":{"timeAndFare":{"scheduleEnable":true,"requestTimeEnable":true,"hideRouteEnable": false}}}]} |

    # Scenario: 02. Passenger search route request triptype preferred
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_p | qup    |

    #     When send a GET API "/api/v3/intercity/search-routes?departure=thach&arrival=&tripType=preferred" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response                                                                                                                                                                                                                                                                     |
    #         | [{"routeNumber":1,"routeTwoEnable":false,"_id":"5ecde9c3caffae4d11f82b18","firstLocation":{"name":"Thach Thang","normalize":"thach thang","zoneId":"5ecdea0da75b36654c661967"},"secondLocation":{"name":"Quan 3","normalize":"quan 3","zoneId":"5ecdea196f43b789bafb1539"}}] |

    # Scenario: 03. Passenger search route request triptype schedule
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | passenger | 2304       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_p | qup    |

    #     When send a GET API "/api/v3/intercity/search-routes?departure=thach&arrival=&tripType=schedule" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
    #         | [{"routeNumber":1,"routeTwoEnable":false,"_id":"5ecde9c3caffae4d11f82b18","firstLocation":{"name":"Thach Thang","normalize":"thach thang","zoneId":"5ecdea0da75b36654c661967"},"secondLocation":{"name":"Quan 3","normalize":"quan 3","zoneId":"5ecdea196f43b789bafb1539"}},{"routeNumber":1,"routeTwoEnable":false,"_id":"5f55d85cdd988d7562f19e0c","firstLocation":{"name":"Thach Thang","normalize":"thach thang","zoneId":"5ecdea0da75b36654c661967"},"secondLocation":{"name":"Thach Thang","normalize":"thach thang","zoneId":"5ecdea0da75b36654c661967"}}] |

    # Scenario: 04. Driver get list routes setting turn on request tripType
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a GET API "/api/v3/intercity/routes/5ecde9c3caffae4d11f82b18?routeNumber=1&tripType=requested" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response                                       |
    #         | {"routeOneSetting":{"requestTimeEnable":true}} |

    # Scenario: 05. Driver get list routes setting turn off request tripType
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
    #         | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
    #     And Get token request API from app
    #         | phoneNumber | countryCode | ime             | client  | secret |
    #         | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

    #     When send a GET API "/api/v3/intercity/routes/5f55d85cdd988d7562f19e0c?routeNumber=1&tripType=requested" request with access token and data
    #         | body |
    #         | {}   |

    #     Then I should get the object result matches with
    #         | response                                                                                                             |
    #         | {"statusCode":400,"code":"RouteNotFound","details":"This route does not exist, please select another one","data":{}} |

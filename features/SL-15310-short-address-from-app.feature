Feature: Show short address in booking list with booking create from Passenger App
    As an passenger,
    I want to create booking

    Background:

    # Scenario: 01. Check case create booking with short address
    #     Given I want to register account
    #         | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv      | password |
    #         | android  | haidr   | +447400123456 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

    #     When Passenger create booking short address
    #         | pickup                                                                                                                                                                          | destination                                                                                                                                                                     |
    #         | {"floor":"1","room":"2","pointOfInterest":"3","streetNumber":"273","route":"Nguyen Van Linh","postalCode":"550000","country":"Viet Nam","cityName":"Da Nang","political":"SEA"} | {"floor":"1","room":"2","pointOfInterest":"3","streetNumber":"273","route":"Nguyen Van Linh","postalCode":"550000","country":"Viet Nam","cityName":"Da Nang","political":"SEA"} |
    #     Then I should get the object result matches with
    #         | response                                                                                           |
    #         | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"ABC","profileStatus":0}}} |

    Scenario: 04. Check case add favorite place
        Given I want to register account
            | platform | fleetId | phone         | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | haidr   | +447400456789 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        And Get token request API from app
            | phoneNumber | countryCode | ime             | client  | secret |
            | 7400456789  | GB          | 354741079903994 | haidr_p | qup    |

        When send a API "/api/v3/favourite/add_place" request with access token and data
            | body                                                                                                                                                                                                                                                                                                                                                           |
            | {"address":"Da Nang City","zipCode":"550000","country":"VN","geo":[108.2022622972727,16.061882911458547],"addressDetails":{"floor":"1","room":"2","pointOfInterest":"3","streetNumber":"4","route":"5","postalCode":"6","country":"7","cityName":"8","political":"9"},"city":"Da nang","name":"text","state":"","cityName":"Da Nang","from":"","type":"other"} |
        Then I should get the object result matches with
            | response                |
            | {"bookId":"3123519718"} |

Feature: Promotion program Promotion code
    As an operator,
    I want to apply promotion code to booking

    Background:
        Given an api token after logined command center

    Scenario: 01. Check case apply promotion code new customer to booking
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                             |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI1","bookFrom":"CC","currencyISO":"MYR","geo":[108.2179298,16.0631878]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":304} |

    Scenario: 02. Check case apply promotion code Referred customers to booking
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                             |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI2","bookFrom":"CC","currencyISO":"MYR","geo":[108.2179298,16.0631878]} |
        Then I should get the object result matches with
            | response                                                                                             |
            | {"response":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15},"returnCode":200} |

    Scenario: 03. Check case apply promotion code private customers to booking
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI3","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[108.2179298,16.0631878]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":422} |

        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI3","userId":"5e65ab30b47b022d3db0381c","currencyISO":"MYR","geo":[108.2179298,16.0631878]} |
        Then I should get the object result matches with
            | response                                                                                             |
            | {"response":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15},"returnCode":200} |

    Scenario: 04. Check case apply promotion code by zone to booking
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI4","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[108.2179298,16.0631878]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":304} |

        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI4","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[-84.3879824,33.7489954]} |
        Then I should get the object result matches with
            | response                                                                                             |
            | {"response":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15},"returnCode":200} |

    Scenario: 05. Check case apply promotion code type percent to booking
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI5","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[-84.3879824,33.7489954]} |
        Then I should get the object result matches with
            | response                                                                                              |
            | {"response":{"currencyISO":"MYR","currencySymbol":"RM","type":"Percent","value":15},"returnCode":200} |

    Scenario: 06. Check case apply promotion code type Budget/user to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |
        Given Passenger create booking NOW with data
            | promotionCode |
            | TIKI6         |
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI6","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[-84.3879824,33.7489954]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":423} |

    Scenario: 07. Check case apply promotion code type Maximum uses/user to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |
        Given Passenger create booking NOW with data
            | promotionCode |
            | TIKI7         |
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI7","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[-84.3879824,33.7489954]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":420} |

    Scenario: 08. Check case apply promotion code type Maximum uses/user/day to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |
        Given Passenger create booking NOW with data
            | promotionCode |
            | TIKI8         |
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI8","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[-84.3879824,33.7489954]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":426} |

    Scenario: 09. Check case apply promotion code type Released Quantity to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |
        Given Passenger create booking NOW with data
            | promotionCode |
            | TIKI9         |
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                 |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI9","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[-84.3879824,33.7489954]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":421} |

    Scenario: 10. Check case apply promotion code type Maximum quantity/day to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |
        Given Passenger create booking NOW with data
            | promotionCode |
            | TIKI10        |
        When send a API "/api/promotion/check" request with event and data
            | body                                                                                                                                                  |
            | {"fleetId":"tiki","pickupTime":"Now","promotionCode":"TIKI10","userId":"5e61bae2b47b022d3db037e5","currencyISO":"MYR","geo":[-84.3879824,33.7489954]} |
        Then I should get the object result matches with
            | response                         |
            | {"response":{},"returnCode":425} |

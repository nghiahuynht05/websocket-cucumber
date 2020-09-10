Feature: Promotion program from MoF for Mycar: Passenger check promotion code
    As an passenger,
    I want to check promotion code
    Background:

    Scenario: 01. Check case check promotion code private customers to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI14","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response   |
            | {"code":2} |

    Scenario: 02. Check case check promotion code by zone to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI14","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response   |
            | {"code":2} |

    Scenario: 03. Check case check promotion code type percent to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI15","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response                                                                                  |
            | {"code":1,"data":{"currencyISO":"MYR","currencySymbol":"RM","type":"Percent","value":15}} |

    Scenario: 04. Check case check promotion code type Budget/user to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI16","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response                                                                                 |
            | {"code":1,"data":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15}} |

    Scenario: 05. Check case check promotion code type Maximum uses/user to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI17","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response                                                                                 |
            | {"code":1,"data":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15}} |

    Scenario: 06. Check case check promotion code type Maximum uses/user/day to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI18","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response                                                                                 |
            | {"code":1,"data":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15}} |

    Scenario: 07. Check case check promotion code type Released Quantity to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI19","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response                                                                                 |
            | {"code":1,"data":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15}} |

    Scenario: 08. Check case check promotion code type Maximum quantity/day to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI20","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response                                                                                 |
            | {"code":1,"data":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15}} |

    Scenario: 09. Check case check promotion code type Maximum quantity/user/month to booking
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event              | requestData                                                                                                                |
            | checkPromotionCode | {"fleetId":"tiki","promotionCode":"TIKI21","date":"Now","geo":[108.21843065321445,16.086584827606213],"bookFrom":"paxApp"} |
        Then I should get the object result matches with
            | response                                                                                 |
            | {"code":1,"data":{"currencyISO":"MYR","currencySymbol":"RM","type":"Amount","value":15}} |

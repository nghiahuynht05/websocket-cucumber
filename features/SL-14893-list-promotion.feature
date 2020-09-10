Feature: Promotion program from MoF for Mycar: get list promotion
    As an passenger,
    I want to get list promotion

    Background:

    Scenario: 01. Get setting quantityLimitPerMonth and applyVerifiedCustomers
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123457003 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event      | requestData                                                                                                                                                                          |
            | listPromos | {"userId":"5e70aa0c823f36761101d0b1","ime":"354741079903994","phone":"+60123457003","fleetId":"tiki","rv":"4.6.4200","platform":"android","appName":"mycar_p","appType":"passenger"} |
        Then I should get the object result matches with
            | response                                                                                                                                                                                                                                                                                              |
            | {"currencyISO":"undefined","list":[{"valueByCurrencies":[{"currencyISO":"MYR","value":15}],"applyVerifiedCustomers":true,"promotionCode":"TEST002","promoCodeId":"5e66f6d7783e7527a30efd69","type":"Amount","value":15,"validFrom":"2020-03-09T16:00:00.000Z","validTo":"2030-12-31T15:59:59.999Z"}]} |

# Scenario: 02. Get setting applyVerifiedCustomers is false
#     Given I want to register account
#         | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
#         | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

#     When I send a web socket request with event and data
#         | event      | requestData                                                                                                                                                                          |
#         | listPromos | {"userId":"5e61bae2b47b022d3db037e5","ime":"354741079903994","phone":"+60123456780","fleetId":"tiki","rv":"4.6.4200","platform":"android","appName":"mycar_p","appType":"passenger"} |
#     Then I should get the object result matches with
#         | response                                                                                                                                                                                                                                                                                               |
#         | {"currencyISO":"undefined","list":[{"valueByCurrencies":[{"currencyISO":"MYR","value":15}],"applyVerifiedCustomers":false,"promotionCode":"TEST003","promoCodeId":"5e66f8be80820427ccb5a8cb","type":"Amount","value":15,"validFrom":"2020-03-09T16:00:00.000Z","validTo":"2030-12-31T15:59:59.999Z"}]} |

# Scenario: 03. Get setting applyVerifiedCustomers is true
#     Given I want to register account
#         | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
#         | android  | tiki    | +60123456780 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

#     When I send a web socket request with event and data
#         | event      | requestData                                                                                                                                                                          |
#         | listPromos | {"userId":"5e61bae2b47b022d3db037e5","ime":"354741079903994","phone":"+60123456780","fleetId":"tiki","rv":"4.6.4200","platform":"android","appName":"mycar_p","appType":"passenger"} |
#     Then I should get the object result matches with
#         | response                                                                                                                                                                                                                                                                                              |
#         | {"currencyISO":"undefined","list":[{"valueByCurrencies":[{"currencyISO":"MYR","value":15}],"applyVerifiedCustomers":true,"promotionCode":"TEST004","promoCodeId":"5e66fabb80820427ccb5a8d5","type":"Amount","value":15,"validFrom":"2020-03-09T16:00:00.000Z","validTo":"2030-12-31T15:59:59.999Z"}]} |

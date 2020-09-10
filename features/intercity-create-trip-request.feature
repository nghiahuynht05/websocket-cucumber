# Feature: Driver request create trip type request
#     As an driver,
#     I want to create trip type request

#     Background:

#     Scenario: 01. Driver create trip type request with routeId validate
#         Given I want to register account
#             | platform | fleetId | phone        | appType | verifyCode | ime             | appName | rv       | password |
#             | android  | yumi    | +12045345784 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
#         And Get token request API from app
#             | phoneNumber | countryCode | ime             | client | secret |
#             | 2045345784  | CA          | 354741079903994 | yumi_d | qup    |

#         When send a API "/api/v3/intercity/trips" request with access token and data
#             | body                                                                                                             |
#             | {"routeId":"5ecde9c3caffae4d11f82b11","routeNumber":1,"date":"2020-08-28","time":"14:00","tripType":"requested"} |
#         Then I should get the object result matches with
#             | response                                  |
#             | {"statusCode":400,"code":"RouteNotFound"} |

#     Scenario: 02. Driver create trip type request with routeNumber validate
#         Given I want to register account
#             | platform | fleetId | phone        | appType | verifyCode | ime             | appName | rv       | password |
#             | android  | yumi    | +12045345784 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
#         And Get token request API from app
#             | phoneNumber | countryCode | ime             | client | secret |
#             | 2045345784  | CA          | 354741079903994 | yumi_d | qup    |

#         When send a API "/api/v3/intercity/trips" request with access token and data
#             | body                                                                                                             |
#             | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":2,"date":"2020-08-28","time":"14:00","tripType":"requested"} |
#         Then I should get the object result matches with
#             | response                                  |
#             | {"statusCode":400,"code":"RouteNotFound"} |

#     Scenario: 03. Driver create trip type request with date is validate
#         Given I want to register account
#             | platform | fleetId | phone        | appType | verifyCode | ime             | appName | rv       | password |
#             | android  | yumi    | +12045345784 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
#         And Get token request API from app
#             | phoneNumber | countryCode | ime             | client | secret |
#             | 2045345784  | CA          | 354741079903994 | yumi_d | qup    |

#         When send a API "/api/v3/intercity/trips" request with access token and data
#             | body                                                                                                             |
#             | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-08-28","time":"14:00","tripType":"requested"} |
#         Then I should get the object result matches with
#             | response                                         |
#             | {"statusCode":400,"code":"DepartureDateInvalid"} |

#     Scenario: 04. Driver create trip type request with time is validate
#         Given I want to register account
#             | platform | fleetId | phone        | appType | verifyCode | ime             | appName | rv       | password |
#             | android  | yumi    | +12045345784 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
#         And Get token request API from app
#             | phoneNumber | countryCode | ime             | client | secret |
#             | 2045345784  | CA          | 354741079903994 | yumi_d | qup    |

#         When send a API "/api/v3/intercity/trips" request with access token and data
#             | body                                                                                                            |
#             | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-05","time":"a:00","tripType":"requested"} |
#         Then I should get the object result matches with
#             | response                                         |
#             | {"statusCode":400,"code":"DepartureTimeInvalid"} |

#     Scenario: 05. Driver create trip type request with carType is validate
#         Given I want to register account
#             | platform | fleetId | phone        | appType | verifyCode | ime             | appName | rv       | password |
#             | android  | yumi    | +12045345784 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
#         And Get token request API from app
#             | phoneNumber | countryCode | ime             | client | secret |
#             | 2045345784  | CA          | 354741079903994 | yumi_d | qup    |

#         When send a API "/api/v3/intercity/trips" request with access token and data
#             | body                                                                                                             |
#             | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-05","time":"14:00","tripType":"requested"} |
#         Then I should get the object result matches with
#             | response                                   |
#             | {"statusCode":400,"code":"CarTypeInvalid"} |

#     Scenario: 06. Driver create trip type request success
#         Given I want to register account
#             | platform | fleetId | phone         | appType | verifyCode | ime             | appName | rv       | password |
#             | android  | haidr   | +447400456789 | driver  | 3210       | 354741079903994 | MyCar   | 4.6.4600 | password |
#         And Get token request API from app
#             | phoneNumber | countryCode | ime             | client  | secret |
#             | 7400456789  | GB          | 354741079903994 | haidr_d | qup    |

#         When send a API "/api/v3/intercity/trips" request with access token and data
#             | body                                                                                                             |
#             | {"routeId":"5ecde9c3caffae4d11f82b18","routeNumber":1,"date":"2020-09-05","time":"14:00","tripType":"requested"} |
#         Then I should get the object result matches with
#             | response           |
#             | {"code":"Success"} |

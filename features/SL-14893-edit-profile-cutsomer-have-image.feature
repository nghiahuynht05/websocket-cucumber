Feature: Promotion program from MoF for Mycar: Edit profile passenger have image natitionalIC
    As an passenger,
    I want to update info passenger
    Fortmat idNumber: YYMMDD-PB-###G

    Background:

    Scenario: 01. Check case update profile with idNumber incorrect format NRIC: ABC
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                             |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"ABC","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                           |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"ABC","profileStatus":0}}} |

    Scenario: 02. Check case update profile with idNumber incorrect format Place of birth: 020102-AB-1281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                        |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"020102-AB-1281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                      |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"020102-AB-1281","profileStatus":0}}} |

    Scenario: 03. Check case update profile with idNumber incorrect format Place of birth: 020102-pb-1281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                        |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"020102-ab-1281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                      |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"020102-ab-1281","profileStatus":0}}} |

    Scenario: 04. Check case update profile with idNumber incorrect format Date of birth: 021333-10-1281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                        |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"021333-10-1281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                      |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"021333-10-1281","profileStatus":0}}} |

    Scenario: 05. Check case update profile with idNumber correct format Date of birth: 020102-10-1281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                        |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"020102-10-1281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                      |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"020102-10-1281","profileStatus":1}}} |

    Scenario: 06. Check case update profile with idNumber incorrect format Place of birth: 020102AB1281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                      |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"020102AB1281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                    |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"020102AB1281","profileStatus":0}}} |

    Scenario: 07. Check case update profile with idNumber incorrect format Place of birth: 020102pb1281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                      |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"020102pb1281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                    |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"020102pb1281","profileStatus":0}}} |

    Scenario: 08. Check case update profile with idNumber incorrect format Date of birth: 021333101281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                      |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"021333101281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                    |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"021333101281","profileStatus":0}}} |

    Scenario: 09. Check case update profile with idNumber correct format Date of birth: 020102101281
        Given I want to register account
            | platform | fleetId | phone        | appType   | verifyCode | ime             | appName | rv      | password |
            | android  | tiki    | +60123456782 | passenger | 1211       | 354741079903994 | MyCar   | 4.64200 | password |

        When I send a web socket request with event and data
            | event       | requestData                                                                                                                                                                                                                                      |
            | editProfile | {"dataObjEncode":"","email":"abc@zing.vn","firstName":"Tiki","lastName":"Customer 02","tips":0,"pegasus":true,"profile":{"gender":0,"dob":"","idNumber":"020102101281","address":{"street":"","city":"","state":",","zipcode":"","country":""}}} |
        Then I should get the object result matches with
            | response                                                                                                    |
            | {"returnCode":200,"response":{"profile":{"gender":0,"dob":"","idNumber":"020102101281","profileStatus":1}}} |

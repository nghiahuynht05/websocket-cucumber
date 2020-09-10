var _ = require('lodash');
var chai = require('chai');
var assert = chai.assert;
var debug = require('debug');
var debuglog = debug('TEST:common');
const Utils = require("../../libs/utils/Utils.js");
const fs = require('fs');
const moment = require('moment-timezone');

var { Given, When, Then } = require('cucumber');
const { table } = require('console');
const usernameENV = process.env.usernameENV
const pwENV = process.env.pwENV


Given(/^I want to register account$/, function (table, callback) {
    var self = this;
    var data = table.hashes()[0];
    self.storage = self.storage || {};
    self.wsClient = self.wsConstructor(self.wsUrl, {
        'force new connection': true,
        reconnect: true
    });
    self.wsClient.on('connect', function () {
        self.wsClient.emit('register', {
            "platform": data.platform,
            "phone": data.phone,
            "fleetId": data.fleetId,
            "appType": data.appType,
            "verifyCode": data.verifyCode,
            "ime": data.ime,
            "appName": data.appName,
            "rv": data.rv,
            "password": data.password
        });
        self.wsClient.on('register', function (info) {
            debuglog(`- ON 'register' - response`, JSON.stringify(info));
            callback()
        })
    });
});

When(/^I send a web socket request with event and data$/, function (table, callback) {
    var self = this;
    var { event, requestEvent, responseEvent, requestData } = table.hashes()[0];
    if (event) {
        requestEvent = responseEvent = event;
    }
    self.wsClient.on(responseEvent, function (data) {
        debuglog(`- ON '${responseEvent}' - response`, JSON.stringify(data));
        self.storage.resultData = data;
        callback();
    })

    function emitEvent(token) {
        if (requestData) {
            requestData = JSON.parse(requestData);
            token && (requestData.token = token);
            debuglog(`'${requestEvent}' - emit`, JSON.stringify(requestData));
            self.wsClient.emit(requestEvent, requestData);
        } else {
            self.wsClient.emit(requestEvent);
        }
    }

    self.wsClient.on("register", function (data) {
        debuglog(`- ON 'register' - response`, JSON.stringify(data));
        emitEvent();
    })

    self.wsClient.on("wb_login", function (data) {
        self.storage = self.storage || {};
        self.storage.loginData = data;
        debuglog(`- ON 'wb_login' - response`, JSON.stringify(data));
        emitEvent(lodash.get(data, "info.token"));
    })

    self.wsClient.on("disconnect", function () {
        self.storage = {};
        callback();
    })
});

Then(/^I should get the object result matches with$/, function (table, callback) {
    var self = this;
    var expectData = JSON.parse(table.hashes()[0].response);
    debuglog("Expect data ", JSON.stringify(expectData));
    debuglog("self.storage.resultData ", JSON.stringify(self.storage.resultData));
    assert.isTrue(self.matchData(self.storage.resultData, expectData), "Result object is not matched with the expected one");
    self.wsClient.disconnect();
    callback()
});


Given(/^an api token after logined command center$/, function (callback) {
    var self = this;
    this.apiClient
        .post('/api/user/login')
        .set('content-type', "application/json")
        .set('accept', "application/json")
        .send({
            "username": usernameENV,
            "password": pwENV
        })
        .then(function (response) {
            if (response.body.error) {
                callback(response.body.error)
            }
            self.token = _.get(response.body, "res.token");
            debuglog(`- API '/api/user/login' - res.token`, JSON.stringify(self.token));
            callback();
        }).catch(callback)
});

Given(/^send a API "([^"]*)" request with event and data$/, function (url, table, callback) {
    let self = this;
    let data = table.hashes()[0];

    self.apiClient
        .post(url)
        .set("content-type", "application/json")
        .set("accept", "application/json")
        .set("authorization", self.token)
        .send(data.body)
        .then(function (response) {
            if (response.body.error) {
                return callback(response.body.error)
            }
            self.storage.resultData = response.body;
            debuglog(`- API ${url} - response.body`, JSON.stringify(self.storage.resultData));
            callback();
        }).catch(callback)
});

Given(/^Passenger create booking NOW with data$/, function (table, callback) {
    var self = this;

    var params = JSON.parse(fs.readFileSync(__dirname + '/input/createbooking.json'));
    var data = table.hashes()[0];
    Object.keys(data).forEach(function (key) {
        var value = Utils.validateData(data[key]);
        var subKeys = key.split(".");
        params = Utils.setSubDocValue(params, subKeys, value);
    })

    params.request.promo = data.promotionCode;
    self.wsClient.emit('rq', params);
    self.wsClient.on('rq', function (rqInfo) {
        debuglog(`'new_booking' - emit: rq`, JSON.stringify(rqInfo));
        self.storage = self.storage || {};
        self.storage.resultData = rqInfo;
        callback();
    });
});

Given(/^Get token request API from app$/, function (table, callback) {
    var self = this;
    var data = table.hashes()[0];
    this.apiwsClient
        .post('/oauth/app/token')
        .set('content-type', "application/json")
        .set('accept', "application/json")
        .send({
            "grant_type": "device_token",
            "phone": {
                "number": data.phoneNumber,
                "country": data.countryCode
            },
            "device_token": data.ime,
            "client_id": data.client,
            "client_secret": data.secret
        })
        .then(function (response) {
            if (response.body.error) {
                callback(response.body.error)
            }
            self.access_token = _.get(response.body, "access_token");
            debuglog(`- API '/oauth/app/token' - access_token`, JSON.stringify(self.access_token));
            callback();
        }).catch(callback)
})

Given(/^send a API "([^"]*)" request with access token and data$/, function (url, table, callback) {
    let self = this;
    var data = table.hashes()[0];
    self.apiwsClient
        .post(url)
        .set("content-type", "application/json")
        .set("accept", "application/json")
        .set("authorization", 'Bearer ' + self.access_token)
        .send(JSON.parse(data.body))
        .then(function (response) {
            if (response.body.error) {
                return callback(response.body.error)
            }
            self.storage.resultData = response.body;
            debuglog(`- API ${url} - response.body`, JSON.stringify(self.storage.resultData));
            callback();
        }).catch(callback)
});

Given(/^send a API accepeted trip$/, function (table, callback) {
    let self = this;
    var res = self.storage.resultData[0];
    var data = table.hashes()[0];
    var tripId = data.tripId;
    if (_.get(res, "tripId")) {
        tripId = _.get(res, "tripId")
    }
    self.apiwsClient
        .post("/api/v3/intercity/accept_trip")
        .set("content-type", "application/json")
        .set("accept", "application/json")
        .set("authorization", 'Bearer ' + self.access_token)
        .send({
            tripId: tripId
        })
        .then(function (response) {
            if (response.body.error) {
                return callback(response.body.error)
            }
            self.storage.resultData = response.body;
            debuglog(`- API '/api/v3/intercity/accept_trip' - response.body`, JSON.stringify(self.storage.resultData));
            callback();
        }).catch(callback)
});

Given(/^send a GET API "([^"]*)" request with access token and data$/, function (url, table, callback) {
    let self = this;
    let data = table.hashes()[0];
    this.apiwsClient
        .get(url)
        .set("content-type", "application/json")
        .set("accept", "application/json")
        .set("authorization", 'Bearer ' + self.access_token)
        .send(JSON.parse(data.body))
        .then(function (response) {
            if (response.body.error) {
                callback(response.body.error)
            }
            self.storage.resultData = response.body;
            debuglog(`- API ${url} - response.body`, JSON.stringify(self.storage.resultData));
            callback();
        }).catch(callback)
});

Given(/^I send a web socket from CC request with event and data$/, function (table, callback) {
    var self = this;
    var data = table.hashes()[0];
    const token = 'd59cea03-c99b-46a0-bcc6-1da7029a14d5';

    self.storage = self.storage || {};
    self.wsClient = self.wsConstructor(self.wsUrl, {
        'force new connection': true,
        reconnect: true
    });
    self.wsClient.on('connect', function () {
        self.wsClient.emit('CCLogin', token);
        self.wsClient.on('CCLogin', function () {
            self.wsClient.emit(data.event, JSON.parse(data.requestData));
            self.wsClient.on(data.event, function (rqInfo) {
                debuglog(`'edit_booking' - emit: editBookingCC`, JSON.stringify(rqInfo));
                self.storage = self.storage || {};
                self.storage.resultData = rqInfo;
                callback();
            });
        })
    });
});

Given(/^Passenger create booking short address$/, function (table, callback) {
    var self = this;

    var params = JSON.parse(fs.readFileSync(__dirname + '/input/createBookingShortAddress.json'));
    var data = table.hashes()[0];
    Object.keys(data).forEach(function (key) {
        var value = Utils.validateData(data[key]);
        var subKeys = key.split(".");
        params = Utils.setSubDocValue(params, subKeys, value);
    })

    params.request.pickup.addressDetails = JSON.parse(data.pickup);
    params.request.destination.addressDetails = JSON.parse(data.destination);
    self.wsClient.emit('rq', params);
    self.wsClient.on('rq', function (rqInfo) {
        debuglog(`'new_booking' - emit: rq`, JSON.stringify(rqInfo));
        self.storage = self.storage || {};
        self.storage.resultData = rqInfo;
        callback();
    });
});

Given(/^Passenger create jobs intercity$/, function (table, callback) {
    var self = this;

    var params = JSON.parse(fs.readFileSync(__dirname + '/input/intercity.json'));
    var data = table.hashes()[0];
    Object.keys(data).forEach(function (key) {
        var value = Utils.validateData(data[key]);
        var subKeys = key.split(".");
        params = Utils.setSubDocValue(params, subKeys, value);
    })

    self.wsClient.emit('rq', params);
    debuglog(`'rq' - on: rq`, JSON.stringify(params));
    self.wsClient.on('rq', function (rqInfo) {
        debuglog(`'new_booking' - emit: rq`, JSON.stringify(rqInfo));
        self.storage = self.storage || {};
        self.storage.resultData = rqInfo;
        callback();
    });
});

Given(/^Passenger create order jobs delivery with data$/, function (table, callback) {
    var self = this;

    var params = JSON.parse(fs.readFileSync(__dirname + '/input/createorder.json'));
    var data = table.hashes()[0];
    Object.keys(data).forEach(function (key) {
        var value = Utils.validateData(data[key]);
        var subKeys = key.split(".");
        params = Utils.setSubDocValue(params, subKeys, value);
    })
    // var date = new Date();
    // date.setHours(date.getHours() + 3)
    // var pickUpTime = moment.tz(date.toGMTString(), 'Asia/Ho_Chi_Minh').format('YYYY-MM-DD HH:mm')
    // debuglog(`'pickupTime: ${pickUpTime}`);

    // params.request.pickUpTime = pickUpTime
    params.request.promo = data.promotionCode;
    self.wsClient.on("register", function (data) {
        self.wsClient.emit('rq', params);
        self.wsClient.on('rq', function (rqInfo) {
            debuglog(`'new_booking' - on: rq`, JSON.stringify(rqInfo));
            self.storage = self.storage || {};
            self.storage.resultData = rqInfo;
            callback();
        });
    })
});

Given(/^Passenger create order jobs shop for you "([^"]*)" with data$/, function (orderType, table, callback) {
    var self = this;

    var params = JSON.parse(fs.readFileSync(__dirname + '/input/createorder.json'));
    var data = table.hashes()[0];
    Object.keys(data).forEach(function (key) {
        var value = Utils.validateData(data[key]);
        var subKeys = key.split(".");
        params = Utils.setSubDocValue(params, subKeys, value);
    })
    if (orderType != "ASAP") {
        var date = new Date();
        date.setHours(date.getHours() + 3)
        var pickUpTime = moment.tz(date.toGMTString(), 'Asia/Ho_Chi_Minh').format('YYYY-MM-DD HH:mm')
        debuglog(`'pickupTime: ${pickUpTime}`);
        params.request.pickUpTime = pickUpTime
    }
    params.request.promo = data.promotionCode;
    self.wsClient.on("register", function (data) {
        self.wsClient.emit('rq', params);
        self.wsClient.on('rq', function (rqInfo) {
            debuglog(`'new_booking' - on: rq`, JSON.stringify(rqInfo));
            self.storage = self.storage || {};
            self.storage.resultData = rqInfo;
            callback();
        });
    })
});

When(/^Driver canceled trip$/, function (callback) {
    var self = this;
    var res = self.storage.resultData;
    var tripId = res.tripId;
    self.wsClient.emit("cancelTripIntercity", {
        "tripId": tripId
    });
    self.wsClient.on("cancelTripIntercity", function (info) {
        debuglog(`'cancelTripIntercity' - on: cancelTripIntercity`, JSON.stringify(info));
        self.storage.resultData = info;
        callback();
    })
});
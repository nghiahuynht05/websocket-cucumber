var _ = require('lodash');
var chai = require('chai');
var assert = chai.assert;
var debug = require('debug');
var debuglog = debug('TEST:common');

var { Given, When, Then } = require('cucumber');


Given(/^I want to register account$/, function (table, callback) {
    var self = this;
    var data = table.hashes()[0];
    self.storage = self.storage || {};
    self.wsClient = self.wsConstructor(self.wsUrl, {
        'force new connection': true,
        reconnect: true
    });
    self.wsClient.on('connect', function (info) {
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
    });
    callback()
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
    debuglog("Expect data ", expectData);
    debuglog("self.storage.resultData ", JSON.stringify(self.storage.resultData));
    assert.isTrue(self.matchData(self.storage.resultData, expectData), "Result object is not matched with the expected one");
    callback()
});

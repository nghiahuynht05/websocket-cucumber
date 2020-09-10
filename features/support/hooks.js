const { After } = require('cucumber');
const _ = require('lodash');
const { result } = require('lodash');

//get config fleetId in env
const fleetIdENV = process.env.FLEETID

// After hooks run after the last step of each scenario, even when steps are failed, undefined, pending, or skipped
// Cancel booking of driver
After(function () {
    const self = this;
    const res = self.storage;
    if (_.get(res, 'resultData.bookId')) {
        var bookId = res.resultData.bookId
        self.wsClient = self.wsConstructor(self.wsUrl, {
            'force new connection': true,
            reconnect: true
        });
        self.wsClient.on('connect', function () {
            self.wsClient.emit('ccLiteLogin', {
                "token": self.token,
                "fleetId": fleetIdENV
            })

            self.wsClient.on('ccLiteLogin', function (info) {
                self.wsClient.emit('cancelBookingCC', { "bookId": bookId });
                self.wsClient.on('cancelBookingCC', function (info) {
                    if (info.returnCode == 400) {
                        self.wsClient.emit('incident', {
                            "bookId": bookId,
                            "reason": "Automation Incident",
                            "operator": { "name": "Automation Operator", "userId": "5db9360288570519672f40c6" }
                        })
                    }
                })
            })
            self.wsClient.disconnect();
        });
    }
    else {
        var req = res.resultData.res;
        if (_.get(req, 'list[0].bookId')) {
            var bookId = req.list[0].bookId
            self.wsClient = self.wsConstructor(self.wsUrl, {
                'force new connection': true,
                reconnect: true
            });
            self.wsClient.on('connect', function () {
                self.wsClient.emit('ccLiteLogin', {
                    "token": self.token,
                    "fleetId": fleetIdENV
                })

                self.wsClient.on('ccLiteLogin', function (info) {
                    self.wsClient.emit('cancelBookingCC', { "bookId": bookId });
                    self.wsClient.on('cancelBookingCC', function (info) {
                        if (info.returnCode == 400) {
                            self.wsClient.emit('incident', {
                                "bookId": bookId,
                                "reason": "Automation Incident",
                                "operator": { "name": "Automation Operator", "userId": "5db9360288570519672f40c6" }
                            })
                        }
                    })
                })
            });
            self.wsClient.disconnect();
        }
        else {
            var req = res.resultData
            if (_.get(req, 'tripId')) {
                var tripId = req.tripId
                self.wsClient = self.wsConstructor(self.wsUrl, {
                    'force new connection': true,
                    reconnect: true
                });
                self.wsClient.on('connect', function () {
                    self.wsClient.emit('ccLiteLogin', {
                        "token": self.token,
                        "fleetId": fleetIdENV
                    });
                    self.wsClient.on('ccLiteLogin', function (info) {
                        self.wsClient.emit('operatorCancelTrip', {
                            "tripId": tripId,
                            "reason": "Automation Cancel Trip",
                            "canceller": "CC",
                            "operator": { "name": "Automation Operator", "userId": "5db9360288570519672f40c6" }
                        });
                        self.wsClient.on('operatorCancelTrip', function (info) {
                            if (info.code != 1) {
                                console.log("cancel trip unsucess")
                            }
                        })
                    });
                });
            }
            else {
                var req = res.resultData.trip
                if (_.get(req, 'trip.tripId')) {
                    var tripId = req.trip.tripId;
                    self.wsClient = self.wsConstructor(self.wsUrl, {
                        'force new connection': true,
                        reconnect: true
                    });
                    self.wsClient.on('connect', function () {
                        self.wsClient.emit('ccLiteLogin', {
                            "token": self.token,
                            "fleetId": fleetIdENV
                        });
                        self.wsClient.on('ccLiteLogin', function (info) {
                            self.wsClient.emit('operatorCancelTrip', {
                                "tripId": tripId,
                                "reason": "Automation Cancel Trip",
                                "canceller": "CC",
                                "operator": { "name": "Automation Operator", "userId": "5db9360288570519672f40c6" }
                            });
                            self.wsClient.on('operatorCancelTrip', function (info) {
                                if (info.code != 1) {
                                    console.log("cancel trip unsucess")
                                }
                            })
                        });
                    });
                }
                else {
                    return 1;
                }
            }
        }
    }
})
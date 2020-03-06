var _ = require('lodash');
var request = require('supertest')
var socketClient = require('socket.io-client');

var { setWorldConstructor, setDefaultTimeout } = require('cucumber');
setDefaultTimeout(100000)

function World() {
    this.storage = {}
    this.wsUrl = "http://" + (process.env['JUPITER_LOCAL_URL']);
    this.wsClient = socketClient(this.wsUrl);
    this.apiWsclient = request(this.wsUrl)

    this.wsConstructor = socketClient;
    this.storage = {}
    this.matchData = function (data, expect) {
        var self = this;
        if (_.isArray(expect) && _.isArray(data)) {
            return expect.every(function (item) {
                return data.some(function (datum) {
                    return self.matchData(datum, item);
                })
            })
        } else {
            return _.isMatchWith(data, expect, matchFn)
        }
    }

    this.matchDataWithTheSameOrder = function (data, expect) {
        var self = this;
        if (_.isArray(expect) && _.isArray(data)) {
            return expect.every(function (item, index) {
                return self.matchDataWithTheSameOrder(data[index], item);
            })
        } else {
            return _.isMatchWith(data, expect, matchWithOrderFn)
        }
    }

    function matchWithOrderFn(obj, src) {
        if (!_.isObject(obj)) {
            return obj === src
        }
        if (_.isArray(src) && _.isArray(obj)) {
            return src.every(function (item, index) {
                return matchWithOrderFn(obj[index], item);
            })
        } else {
            if (_.matches(src)(obj)) return true;
            return Object.keys(src).every(function (key) {
                return matchWithOrderFn(obj[key], src[key]);
            })
        }

        return false;
    }

    function matchFn(obj, src) {
        if (!_.isObject(obj)) {
            return obj === src
        }
        if (_.isArray(src) && _.isArray(obj)) {
            return src.every(function (item) {
                return obj.some(function (datum) {
                    return matchFn(datum, item);
                })
            })
        } else {
            if (_.matches(src)(obj)) return true;
            return Object.keys(src).every(function (key) {
                return matchFn(obj[key], src[key]);
            })
        }
        return false;
    }
};

setWorldConstructor(World)
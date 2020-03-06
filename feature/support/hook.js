const { After } = require('cucumber');

After(function () {
    var self = this;
    self.wsClient.on('connect', function () {
        self.wsClient.on('disconnect', function (info) {
            console.log('disconnect ', info)
        })
    })
})
var events = require('events');
var eventEmitter = new events.EventEmitter();

var listener1 = function listener1() {
    console.log('listener1');
}

var listener2 = function listener1() {
    console.log('listener2');
}

var listener3 = function listener1() {
    console.log('listener3');
}

eventEmitter.addListener('connection', listener1);

eventEmitter.on('connection', listener2);

eventEmitter.addListener('connection', listener3);

var eventListeners = events.EventEmitter.listenerCount(eventEmitter, 'connection');

console.log(eventListeners + 'listener count');

eventEmitter.emit('connection');

eventEmitter.removeListener('connection', listener2);

eventEmitter.emit('connection');

console.log('end...');

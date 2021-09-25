exports.open = (ws) => {
    //Say hello or send a message to the client, increment number of connected users, ...
    ws.subscribe('mainChannel');
    ws.send("Open from CloudGate! Thread: " + require('worker_threads').threadId, false);
};

exports.upgrade = (res, req, context) => {
    //console.log('An Http connection wants to become WebSocket, URL: ' + req.getUrl() + '!');
    /* This immediately calls open handler, you must not use res after this call */
    res.upgrade({
        url: req.getUrl()
    },
    req.getHeader('sec-websocket-key'),
    req.getHeader('sec-websocket-protocol'),
    req.getHeader('sec-websocket-extensions'),
    context);
};

exports.message = (app, ws, message, isBinary) => {
    //Do something with the message received from the client (echo, broadcast it, subscribe to a channel, execute some code ...)
    //console.log("new message, ", message)
    if ( message != null && message != ""){
        app.publish('mainChannel', message + "");
    }
    
};

exports.close = (ws, code, message) => {
    // Do something like decrement number of users, close session,  ...
    
    //here your response will be discarded because the websocket 
    //is already closed at clientside when we receive this event
};
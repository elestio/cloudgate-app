const sharedmem = require('@elestio/cloudgate/modules/shared-memory');

module.exports = async (event) => {

    var beginPipeline = process.hrtime();

    var response = "";
    response = "<b>Hello, World!</b><br/><br/>\r\n\r\n";
    response += "Timestamp: " + (+new Date()) + "<br/>\r\n";
    response += "Method: " + event.method + "<br/>\r\n";
    response += "URL: " + event.url + "<br/>\r\n";
    response += "Host: " + event.headers["host"] + "<br/>\r\n";
    response += "Headers: " + JSON.stringify(event.headers) + "<br/>\r\n";
    response += "Remote IP: " + event.ip + "<br/>\r\n";
    response += "Query: " + event.query + "<br/>\r\n";
    response += "Body: " + event.body + "<br/>\r\n";
 
    sharedmem.incInteger("test-counter", 1, "global");
    response += "sharedmem: " + sharedmem.getInteger("test-counter", "global") + "<br/>\r\n";   
    
    const nanoSeconds = process.hrtime(beginPipeline).reduce((sec, nano) => sec * 1e9 + nano);
    var durationMS = (nanoSeconds/1000000);

    return {  
        httpStatus: "200",
        headers:{
            "Content-Type": "text/html; charset=utf-8",
            "processTime": durationMS
        },  
        content: response  
    };
};
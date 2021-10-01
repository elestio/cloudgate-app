module.exports = async (event) => {
    //var myContent = "Hello World! " + (new Date().getTime())
    var myContent = JSON.stringify(event)
    return {  
        httpStatus: "200", 
        headers: {'content-type': 'text/html'}, 
        content: myContent 
    };
};
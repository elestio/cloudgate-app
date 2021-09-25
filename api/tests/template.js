var fs = require("fs");
var template = null;
module.exports = async (event) => {

    //read template
    var curContent = "";
    if (template == null){
        try{
            curContent = fs.readFileSync("./public/index.html", { encoding: 'utf8' });
        }
        catch(ex){
            console.log("err: ", ex.message)
        }
    }

    //replace some content
    curContent = curContent.replace(/CloudGate/g, "TEST123");
        
    return {  httpStatus: "200", headers: {'content-type': 'text/html'},  content: curContent  };
};
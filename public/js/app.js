function getLatency() {
    var started = new Date().getTime();
    var url = "/api/rest/simple?t=" + (+new Date());
    fetch(url)
        .then(function (response) {
            var ended = new Date().getTime();
            var milliseconds = ended - started;
            document.getElementById("latency").innerHTML = milliseconds + " ms";
            document.getElementById("processingTime").innerHTML = response.headers.get("durationMS");
        }).catch(function (error) {
            //console.log(error);
            //clearInterval(timerLatency)
            document.getElementById("latency").innerHTML = "? ms";
        });

}
var timerLatency = window.setInterval(getLatency, 1000);


getVisitorInfos();
async function getVisitorInfos() {
    if (localStorage.getItem("visitorInfos") == null) {
        var visitorInfos = null;

        await fetch("https://ipinfo.io/json")
            .then(async function (response) {
                visitorInfos = await response.json();
                localStorage.setItem("visitorInfos", JSON.stringify(visitorInfos));
            }).catch(function (error) {
                console.log(error);
                //document.getElementsByClassName("app-title")[0].innerHTML = "Backend is not reacheable, are you still connected to internet?";
            });


    }
    else {
        visitorInfos = JSON.parse(localStorage.getItem("visitorInfos"));
    }

    //console.log(visitorInfos);
    document.getElementById("yourIP").innerHTML = visitorInfos.ip;
    document.getElementById("location").innerHTML = visitorInfos.country + ", " + visitorInfos.city;


}


//set the host
document.getElementById("host").innerHTML = window.location.host;
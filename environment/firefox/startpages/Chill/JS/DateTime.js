setInterval(showTime, 1000);
setInterval(showDate, 1000);

function showTime() {
    let time = new Date();
    let hour = time.getHours();
    let min = time.getMinutes();
    let sec = time.getSeconds();


    hour = hour < 10 ? "0" + hour : hour;
    min = min < 10 ? "0" + min : min;
    sec = sec < 10 ? "0" + sec : sec;

    let currentTime = hour + ":"
            + min + ":" + sec;

    document.getElementById("clockhours")
            .innerHTML = currentTime;
}

function showDate() {
        let time = new Date();
        let day = time.getDate();
        let month = (time.getMonth()+1);
        let year = time.getFullYear();
        let monthname =  time.toLocaleString('default', { month: 'long' });
        let dayname = time.toLocaleDateString('default', { weekday: 'long' });


        day = day < 10 ? "0" + day : day;
        month = month < 10 ? "0" + month : month;
        year = year < 10 ? "0" + year : year;

        let currentTime = day + " of " + monthname + ", " + year;


        document.getElementById("clockdate").innerHTML = currentTime;
        document.getElementById("dayname").innerHTML = dayname;
    }

showTime();
showDate();



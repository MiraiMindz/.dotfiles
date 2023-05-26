setInterval(timeGreeter, 1000);
const WELCOMETEXT = document.getElementById("WelcomeText");

function timeGreeter() {
    const DATE = new Date;
    let hours = DATE.getHours();
    let greeter = (hours < 12) ? "Good Morning, Mirai" : ((hours <= 18 && hours >= 12 ) ? "Good Afternoon, Mirai" : "Good Night, Mirai");
    WELCOMETEXT.textContent = greeter;
}




const WEATHERICONSVG = document.getElementById("weathericon-svg");
const WEATHERICONPATH = document.getElementById("weathericon-path");
const TEMPICONSVG = document.getElementById("tempicon-svg");
const TEMPICONPATH = document.getElementById("tempicon-path");
const HUMICONSVG = document.getElementById("humicon-svg");
const HUMICONPATH = document.getElementById("humicon-path");

function weatherBalloon(cityID) {
    var key = '${YOUR-KEY}';
    fetch('https://api.openweathermap.org/data/2.5/weather?id=' + cityID+ '&appid=' + key)
    .then(function(resp) { return resp.json() }) // Convert data to json
    .then(function(data) {
        console.log(data);
        drawWeather(data);
    })
    .catch(function() {
        // catch any errors
    });
}

function drawWeather( d ) {
	var celcius = Math.round(parseFloat(d.main.temp)-273.15);
	var fahrenheit = Math.round(((parseFloat(d.main.temp)-273.15)*1.8)+32);

    var feels_like_celcius = Math.round(parseFloat(d.main.feels_like)-273.15);
    var feels_like_fahrenheit = Math.round(((parseFloat(d.main.feels_like)-273.15)*1.8)+32);

    var wind_speed = Math.round(parseFloat(d.wind.speed)*3.6)

	document.getElementById('description').innerHTML = d.weather[0].description;
	document.getElementById('temp').innerHTML = celcius + '&deg;C';
    document.getElementById('hum').innerHTML = d.main.humidity + '%';
    document.getElementById('feelslike').innerHTML = "Feels Like: " + feels_like_celcius + '&deg;C';
    document.getElementById('wind_speed').innerHTML = "Wind: " + wind_speed + ' km/h';

    if(d.weather[0].main = "Clouds") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 640 512");
        WEATHERICONPATH.setAttribute("d", "M544 320c-.6 0-1.1.2-1.6.2 1.1-5.2 1.6-10.6 1.6-16.2 0-44.2-35.8-80-80-80-24.6 0-46.3 11.3-61 28.8-18.6-35.9-55.8-60.8-99-60.8-61.9 0-112 50.1-112 112 0 7.3.8 14.3 2.1 21.2-38.3 12.6-66.1 48.3-66.1 90.8 0 53 43 96 96 96h320c53 0 96-43 96-96s-43-96-96-96zM304 160c40.7 0 78.6 17.2 105.4 46.5 9.8-5.6 20.5-9.4 31.6-11.8 4.3-10.8 7-22.3 7-34.7 0-53-43-96-96-96-14.1 0-27.4 3.2-39.5 8.7C296.6 30.3 256 0 208 0 151.6 0 105.3 41.9 97.6 96.2c-.5 0-1-.2-1.6-.2-53 0-96 43-96 96s43 96 96 96h65.6c8.1-71.8 68.5-128 142.4-128z");
    }
    else if(d.weather[0].main = "Thunderstorm") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 512 512");
        WEATHERICONPATH.setAttribute("d", "M337 288h-72.1l22.6-77.1c2.5-9.5-4.6-18.9-14.5-18.9h-82c-7.5 0-13.9 5.6-14.9 13l-16 130c-1.2 9 5.8 17 14.9 17h81l-31.6 141.5c-2.2 9.5 5 18.5 14.6 18.5 5.2 0 10.2-2.7 13-7.5l98-194c5.7-10-1.5-22.5-13-22.5zm79-160c-.6 0-1.1.2-1.6.2 1.1-5.2 1.6-10.6 1.6-16.2 0-44.2-35.8-80-80-80-24.6 0-46.3 11.3-61 28.8C256.4 24.8 219.3 0 176 0 114.1 0 64 50.1 64 112c0 7.3.8 14.3 2.1 21.2C27.8 145.8 0 181.5 0 224c0 53 43 96 96 96h32.5l15.9-119.2c3.1-23.3 23.1-40.8 46.6-40.8h85c14.7 0 28.3 6.7 37.3 18.4s11.9 26.5 8.1 40.7L310.5 260H341c16.7 0 32.3 9 40.7 23.5 6.4 11.2 7.8 24.4 4.3 36.5h30c53 0 96-43 96-96s-43-96-96-96z");
    }
    else if(d.weather[0].main = "Drizzle") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 512 512");
        WEATHERICONPATH.setAttribute("d", "M416 128c-.6 0-1.1.2-1.6.2 1.1-5.2 1.6-10.6 1.6-16.2 0-44.2-35.8-80-80-80-24.6 0-46.3 11.3-61 28.8C256.4 24.8 219.3 0 176 0 114.1 0 64 50.1 64 112c0 7.3.8 14.3 2.1 21.2C27.8 145.8 0 181.5 0 224c0 53 43 96 96 96h320c53 0 96-43 96-96s-43-96-96-96zM48 360c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16s16-7.2 16-16v-40c0-8.8-7.2-16-16-16zm96 80c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16s16-7.2 16-16v-40c0-8.8-7.2-16-16-16zm96-80c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16s16-7.2 16-16v-40c0-8.8-7.2-16-16-16zm96 80c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16s16-7.2 16-16v-40c0-8.8-7.2-16-16-16zm96-80c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16s16-7.2 16-16v-40c0-8.8-7.2-16-16-16z");
    }
    else if(d.weather[0].main = "Rain") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 512 512");
        WEATHERICONPATH.setAttribute("d", "M183.9 370.1c-7.6-4.4-17.4-1.8-21.8 6l-64 112c-4.4 7.7-1.7 17.5 6 21.8 2.5 1.4 5.2 2.1 7.9 2.1 5.5 0 10.9-2.9 13.9-8.1l64-112c4.4-7.6 1.7-17.4-6-21.8zm96 0c-7.6-4.4-17.4-1.8-21.8 6l-64 112c-4.4 7.7-1.7 17.5 6 21.8 2.5 1.4 5.2 2.1 7.9 2.1 5.5 0 10.9-2.9 13.9-8.1l64-112c4.4-7.6 1.7-17.4-6-21.8zm-192 0c-7.6-4.4-17.4-1.8-21.8 6l-64 112c-4.4 7.7-1.7 17.5 6 21.8 2.5 1.4 5.2 2.1 7.9 2.1 5.5 0 10.9-2.9 13.9-8.1l64-112c4.4-7.6 1.7-17.4-6-21.8zm384 0c-7.6-4.4-17.4-1.8-21.8 6l-64 112c-4.4 7.7-1.7 17.5 6 21.8 2.5 1.4 5.2 2.1 7.9 2.1 5.5 0 10.9-2.9 13.9-8.1l64-112c4.4-7.6 1.7-17.4-6-21.8zm-96 0c-7.6-4.4-17.4-1.8-21.8 6l-64 112c-4.4 7.7-1.7 17.5 6 21.8 2.5 1.4 5.2 2.1 7.9 2.1 5.5 0 10.9-2.9 13.9-8.1l64-112c4.4-7.6 1.7-17.4-6-21.8zM416 128c-.6 0-1.1.2-1.6.2 1.1-5.2 1.6-10.6 1.6-16.2 0-44.2-35.8-80-80-80-24.6 0-46.3 11.3-61 28.8C256.4 24.8 219.3 0 176 0 114.2 0 64 50.1 64 112c0 7.3.8 14.3 2.1 21.2C27.8 145.8 0 181.5 0 224c0 53 43 96 96 96h320c53 0 96-43 96-96s-43-96-96-96z");
    }
    else if(d.weather[0].main = "Snow") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 448 512");
        WEATHERICONPATH.setAttribute("d", "M440.3 345.2l-33.8-19.5 26-7c8.2-2.2 13.1-10.7 10.9-18.9l-4-14.9c-2.2-8.2-10.7-13.1-18.9-10.9l-70.8 19-63.9-37 63.8-36.9 70.8 19c8.2 2.2 16.7-2.7 18.9-10.9l4-14.9c2.2-8.2-2.7-16.7-10.9-18.9l-26-7 33.8-19.5c7.4-4.3 9.9-13.7 5.7-21.1L430.4 119c-4.3-7.4-13.7-9.9-21.1-5.7l-33.8 19.5 7-26c2.2-8.2-2.7-16.7-10.9-18.9l-14.9-4c-8.2-2.2-16.7 2.7-18.9 10.9l-19 70.8-62.8 36.2v-77.5l53.7-53.7c6.2-6.2 6.2-16.4 0-22.6l-11.3-11.3c-6.2-6.2-16.4-6.2-22.6 0L256 56.4V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v40.4l-19.7-19.7c-6.2-6.2-16.4-6.2-22.6 0L138.3 48c-6.3 6.2-6.3 16.4 0 22.6l53.7 53.7v77.5l-62.8-36.2-19-70.8c-2.2-8.2-10.7-13.1-18.9-10.9l-14.9 4c-8.2 2.2-13.1 10.7-10.9 18.9l7 26-33.8-19.5c-7.4-4.3-16.8-1.7-21.1 5.7L2.1 145.7c-4.3 7.4-1.7 16.8 5.7 21.1l33.8 19.5-26 7c-8.3 2.2-13.2 10.7-11 19l4 14.9c2.2 8.2 10.7 13.1 18.9 10.9l70.8-19 63.8 36.9-63.8 36.9-70.8-19c-8.2-2.2-16.7 2.7-18.9 10.9l-4 14.9c-2.2 8.2 2.7 16.7 10.9 18.9l26 7-33.8 19.6c-7.4 4.3-9.9 13.7-5.7 21.1l15.5 26.8c4.3 7.4 13.7 9.9 21.1 5.7l33.8-19.5-7 26c-2.2 8.2 2.7 16.7 10.9 18.9l14.9 4c8.2 2.2 16.7-2.7 18.9-10.9l19-70.8 62.8-36.2v77.5l-53.7 53.7c-6.3 6.2-6.3 16.4 0 22.6l11.3 11.3c6.2 6.2 16.4 6.2 22.6 0l19.7-19.7V496c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16v-40.4l19.7 19.7c6.2 6.2 16.4 6.2 22.6 0l11.3-11.3c6.2-6.2 6.2-16.4 0-22.6L256 387.7v-77.5l62.8 36.2 19 70.8c2.2 8.2 10.7 13.1 18.9 10.9l14.9-4c8.2-2.2 13.1-10.7 10.9-18.9l-7-26 33.8 19.5c7.4 4.3 16.8 1.7 21.1-5.7l15.5-26.8c4.3-7.3 1.8-16.8-5.6-21z");
    }
    else if(d.weather[0].main = "Clear") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 512 512");
        WEATHERICONPATH.setAttribute("d", "M256 160c-52.9 0-96 43.1-96 96s43.1 96 96 96 96-43.1 96-96-43.1-96-96-96zm246.4 80.5l-94.7-47.3 33.5-100.4c4.5-13.6-8.4-26.5-21.9-21.9l-100.4 33.5-47.4-94.8c-6.4-12.8-24.6-12.8-31 0l-47.3 94.7L92.7 70.8c-13.6-4.5-26.5 8.4-21.9 21.9l33.5 100.4-94.7 47.4c-12.8 6.4-12.8 24.6 0 31l94.7 47.3-33.5 100.5c-4.5 13.6 8.4 26.5 21.9 21.9l100.4-33.5 47.3 94.7c6.4 12.8 24.6 12.8 31 0l47.3-94.7 100.4 33.5c13.6 4.5 26.5-8.4 21.9-21.9l-33.5-100.4 94.7-47.3c13-6.5 13-24.7.2-31.1zm-155.9 106c-49.9 49.9-131.1 49.9-181 0-49.9-49.9-49.9-131.1 0-181 49.9-49.9 131.1-49.9 181 0 49.9 49.9 49.9 131.1 0 181z");
    }
    else if(d.weather[0].main = "Mist") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 640 512");
        WEATHERICONPATH.setAttribute("d", "M575.2 325.7c.2-1.9.8-3.7.8-5.6 0-35.3-28.7-64-64-64-12.6 0-24.2 3.8-34.1 10-17.6-38.8-56.5-66-101.9-66-61.8 0-112 50.1-112 112 0 3 .7 5.8.9 8.7-49.6 3.7-88.9 44.7-88.9 95.3 0 53 43 96 96 96h272c53 0 96-43 96-96 0-42.1-27.2-77.4-64.8-90.4zm-430.4-22.6c-43.7-43.7-43.7-114.7 0-158.3 43.7-43.7 114.7-43.7 158.4 0 9.7 9.7 16.9 20.9 22.3 32.7 9.8-3.7 20.1-6 30.7-7.5L386 81.1c4-11.9-7.3-23.1-19.2-19.2L279 91.2 237.5 8.4C232-2.8 216-2.8 210.4 8.4L169 91.2 81.1 61.9C69.3 58 58 69.3 61.9 81.1l29.3 87.8-82.8 41.5c-11.2 5.6-11.2 21.5 0 27.1l82.8 41.4-29.3 87.8c-4 11.9 7.3 23.1 19.2 19.2l76.1-25.3c6.1-12.4 14-23.7 23.6-33.5-13.1-5.4-25.4-13.4-36-24zm-4.8-79.2c0 40.8 29.3 74.8 67.9 82.3 8-4.7 16.3-8.8 25.2-11.7 5.4-44.3 31-82.5 67.4-105C287.3 160.4 258 140 224 140c-46.3 0-84 37.6-84 83.9z");
    }
    else if(d.weather[0].main = "Smoke") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 640 512");
        WEATHERICONPATH.setAttribute("d", "M528 288c-18 0-34.7 4.6-49.7 12.1C454 255 406.8 224 352 224c-41 0-77.8 17.3-104 44.8-26.2-27.5-63-44.8-104-44.8C64.5 224 0 288.5 0 368s64.5 144 144 144h384c61.9 0 112-50.1 112-112s-50.1-112-112-112zM402.4 158.8C380.1 139.9 351.6 128 320 128c-51.7 0-95.9 30.8-116.1 74.8 15.6 5.7 30.6 13.4 44.1 23.4C278 204 314 192 352 192c54.9 0 106 25.9 139 69.1 12.1-3.4 24.5-5.1 37-5.1 35.5 0 67.6 13.4 92.7 34.8 12-19.5 19.3-42.2 19.3-66.8 0-70.7-57.3-128-128-128-46.8 0-87.3 25.3-109.6 62.8zM144 192c9.9 0 19.5.9 29.1 2.5C197.2 136.8 253.7 96 320 96c26.2 0 52 6.7 75.1 19.2 9.3-10.2 20.2-18.4 31.6-25.8C403.8 54.9 364.6 32 320 32c-31.6 0-60.1 11.9-82.4 30.8C215.3 25.3 174.8 0 128 0 57.3 0 0 57.3 0 128c0 38.2 17.1 72.1 43.7 95.6 28.5-19.9 63-31.6 100.3-31.6z");
    }
    else if(d.weather[0].main = "Haze") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 640 512");
        WEATHERICONPATH.setAttribute("d", "M528 288c-18 0-34.7 4.6-49.7 12.1C454 255 406.8 224 352 224c-41 0-77.8 17.3-104 44.8-26.2-27.5-63-44.8-104-44.8C64.5 224 0 288.5 0 368s64.5 144 144 144h384c61.9 0 112-50.1 112-112s-50.1-112-112-112zM402.4 158.8C380.1 139.9 351.6 128 320 128c-51.7 0-95.9 30.8-116.1 74.8 15.6 5.7 30.6 13.4 44.1 23.4C278 204 314 192 352 192c54.9 0 106 25.9 139 69.1 12.1-3.4 24.5-5.1 37-5.1 35.5 0 67.6 13.4 92.7 34.8 12-19.5 19.3-42.2 19.3-66.8 0-70.7-57.3-128-128-128-46.8 0-87.3 25.3-109.6 62.8zM144 192c9.9 0 19.5.9 29.1 2.5C197.2 136.8 253.7 96 320 96c26.2 0 52 6.7 75.1 19.2 9.3-10.2 20.2-18.4 31.6-25.8C403.8 54.9 364.6 32 320 32c-31.6 0-60.1 11.9-82.4 30.8C215.3 25.3 174.8 0 128 0 57.3 0 0 57.3 0 128c0 38.2 17.1 72.1 43.7 95.6 28.5-19.9 63-31.6 100.3-31.6z");
    }
    else if(d.weather[0].main = "Ash") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 512 512");
        WEATHERICONPATH.setAttribute("d", "M156.7 256H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h142.2c15.9 0 30.8 10.9 33.4 26.6 3.3 20-12.1 37.4-31.6 37.4-14.1 0-26.1-9.2-30.4-21.9-2.1-6.3-8.6-10.1-15.2-10.1H81.6c-9.8 0-17.7 8.8-15.9 18.4 8.6 44.1 47.6 77.6 94.2 77.6 57.1 0 102.7-50.1 95.2-108.6C249 291 205.4 256 156.7 256zM16 224h336c59.7 0 106.8-54.8 93.8-116.7-7.6-36.2-36.9-65.5-73.1-73.1-55.4-11.6-105.1 24.9-114.9 75.5-1.9 9.6 6.1 18.3 15.8 18.3h32.8c6.7 0 13.1-3.8 15.2-10.1C325.9 105.2 337.9 96 352 96c19.4 0 34.9 17.4 31.6 37.4-2.6 15.7-17.4 26.6-33.4 26.6H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16zm384 32H243.7c19.3 16.6 33.2 38.8 39.8 64H400c26.5 0 48 21.5 48 48s-21.5 48-48 48c-17.9 0-33.3-9.9-41.6-24.4-2.9-5-8.7-7.6-14.5-7.6h-33.8c-10.9 0-19 10.8-15.3 21.1 17.8 50.6 70.5 84.8 129.4 72.3 41.2-8.7 75.1-41.6 84.7-82.7C526 321.5 470.5 256 400 256z");
    }
    else if(d.weather[0].main = "Fog") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 640 512");
        WEATHERICONPATH.setAttribute("d", "M624 368H80c-8.8 0-16 7.2-16 16v16c0 8.8 7.2 16 16 16h544c8.8 0 16-7.2 16-16v-16c0-8.8-7.2-16-16-16zm-480 96H16c-8.8 0-16 7.2-16 16v16c0 8.8 7.2 16 16 16h128c8.8 0 16-7.2 16-16v-16c0-8.8-7.2-16-16-16zm416 0H224c-8.8 0-16 7.2-16 16v16c0 8.8 7.2 16 16 16h336c8.8 0 16-7.2 16-16v-16c0-8.8-7.2-16-16-16zM144 288h156.1c22.5 19.7 51.6 32 83.9 32s61.3-12.3 83.9-32H528c61.9 0 112-50.1 112-112S589.9 64 528 64c-18 0-34.7 4.6-49.7 12.1C454 31 406.8 0 352 0c-41 0-77.8 17.3-104 44.8C221.8 17.3 185 0 144 0 64.5 0 0 64.5 0 144s64.5 144 144 144z");
    }
    else if(d.weather[0].main = "Sand") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 512 512");
        WEATHERICONPATH.setAttribute("d", "M156.7 256H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h142.2c15.9 0 30.8 10.9 33.4 26.6 3.3 20-12.1 37.4-31.6 37.4-14.1 0-26.1-9.2-30.4-21.9-2.1-6.3-8.6-10.1-15.2-10.1H81.6c-9.8 0-17.7 8.8-15.9 18.4 8.6 44.1 47.6 77.6 94.2 77.6 57.1 0 102.7-50.1 95.2-108.6C249 291 205.4 256 156.7 256zM16 224h336c59.7 0 106.8-54.8 93.8-116.7-7.6-36.2-36.9-65.5-73.1-73.1-55.4-11.6-105.1 24.9-114.9 75.5-1.9 9.6 6.1 18.3 15.8 18.3h32.8c6.7 0 13.1-3.8 15.2-10.1C325.9 105.2 337.9 96 352 96c19.4 0 34.9 17.4 31.6 37.4-2.6 15.7-17.4 26.6-33.4 26.6H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16zm384 32H243.7c19.3 16.6 33.2 38.8 39.8 64H400c26.5 0 48 21.5 48 48s-21.5 48-48 48c-17.9 0-33.3-9.9-41.6-24.4-2.9-5-8.7-7.6-14.5-7.6h-33.8c-10.9 0-19 10.8-15.3 21.1 17.8 50.6 70.5 84.8 129.4 72.3 41.2-8.7 75.1-41.6 84.7-82.7C526 321.5 470.5 256 400 256z");
    }
    else if(d.weather[0].main = "Squall") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 640 512");
        WEATHERICONPATH.setAttribute("d", "M544 320c-.6 0-1.1.2-1.6.2 1.1-5.2 1.6-10.6 1.6-16.2 0-44.2-35.8-80-80-80-24.6 0-46.3 11.3-61 28.8-18.6-35.9-55.8-60.8-99-60.8-61.9 0-112 50.1-112 112 0 7.3.8 14.3 2.1 21.2-38.3 12.6-66.1 48.3-66.1 90.8 0 53 43 96 96 96h320c53 0 96-43 96-96s-43-96-96-96zM304 160c40.7 0 78.6 17.2 105.4 46.5 9.8-5.6 20.5-9.4 31.6-11.8 4.3-10.8 7-22.3 7-34.7 0-53-43-96-96-96-14.1 0-27.4 3.2-39.5 8.7C296.6 30.3 256 0 208 0 151.6 0 105.3 41.9 97.6 96.2c-.5 0-1-.2-1.6-.2-53 0-96 43-96 96s43 96 96 96h65.6c8.1-71.8 68.5-128 142.4-128z");
    }
    else if(d.weather[0].main = "Tornado") {
        WEATHERICONSVG.setAttribute("viewBox", "0 0 512 512");
        WEATHERICONPATH.setAttribute("d", "M393.8 96H12.2c9.7 34.2 24.5 62.1 42.7 85.3h349.8c-14.1-23.1-20.6-50.2-10.9-85.3zm35.4-70.8c7.4-10.6 0-25.2-12.9-25.2H16.1C7.1 0-.3 7.6 0 16.5c.6 17 2.5 32.6 5.1 47.5h401.1c5.9-12.1 13.3-24.9 23-38.8zM299 330.7c33 20.5 54.4 45.8 53.3 85.3h125.5c25.1-34.4 34.7-62 34.1-85.3H299zm130.9-117.4h-345c45.1 40.4 101 63.6 150.1 85.3h269.4c-14.5-32.1-47.4-56.9-74.5-85.3zm-98.1 275.8c-5 10.6 2.7 22.9 14.4 22.9h27.4c7.9 0 15.8-3 21.7-8.3 22.7-20.3 41-38.6 56.4-55.7H347.4c-3.4 12.5-8.4 26.1-15.6 41.1z");
    }

    if (celcius <= 9) {
        TEMPICONSVG.setAttribute("viewBox", "0 0 256 512");
        TEMPICONPATH.setAttribute("d", "M192 384c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64zm32-84.653c19.912 22.563 32 52.194 32 84.653 0 70.696-57.303 128-128 128-.299 0-.609-.001-.909-.003C56.789 511.509-.357 453.636.002 383.333.166 351.135 12.225 321.755 32 299.347V96c0-53.019 42.981-96 96-96s96 42.981 96 96v203.347zM208 384c0-34.339-19.37-52.19-32-66.502V96c0-26.467-21.533-48-48-48S80 69.533 80 96v221.498c-12.732 14.428-31.825 32.1-31.999 66.08-.224 43.876 35.563 80.116 79.423 80.42L128 464c44.112 0 80-35.888 80-80z");
    }
    else if (celcius >= 10) {
        TEMPICONSVG.setAttribute("viewBox", "0 0 256 512");
        TEMPICONPATH.setAttribute("d", "M192 384c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-23.685 12.876-44.349 32-55.417V288c0-17.673 14.327-32 32-32s32 14.327 32 32v40.583c19.124 11.068 32 31.732 32 55.417zm32-84.653c19.912 22.563 32 52.194 32 84.653 0 70.696-57.303 128-128 128-.299 0-.609-.001-.909-.003C56.789 511.509-.357 453.636.002 383.333.166 351.135 12.225 321.755 32 299.347V96c0-53.019 42.981-96 96-96s96 42.981 96 96v203.347zM208 384c0-34.339-19.37-52.19-32-66.502V96c0-26.467-21.533-48-48-48S80 69.533 80 96v221.498c-12.732 14.428-31.825 32.1-31.999 66.08-.224 43.876 35.563 80.116 79.423 80.42L128 464c44.112 0 80-35.888 80-80z");
    }
    else if (celcius >= 20) {
        TEMPICONSVG.setAttribute("viewBox", "0 0 256 512");
        TEMPICONPATH.setAttribute("d", "M192 384c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-23.685 12.876-44.349 32-55.417V224c0-17.673 14.327-32 32-32s32 14.327 32 32v104.583c19.124 11.068 32 31.732 32 55.417zm32-84.653c19.912 22.563 32 52.194 32 84.653 0 70.696-57.303 128-128 128-.299 0-.609-.001-.909-.003C56.789 511.509-.357 453.636.002 383.333.166 351.135 12.225 321.755 32 299.347V96c0-53.019 42.981-96 96-96s96 42.981 96 96v203.347zM208 384c0-34.339-19.37-52.19-32-66.502V96c0-26.467-21.533-48-48-48S80 69.533 80 96v221.498c-12.732 14.428-31.825 32.1-31.999 66.08-.224 43.876 35.563 80.116 79.423 80.42L128 464c44.112 0 80-35.888 80-80z");
    }
    else if (celcius >= 30) {
        TEMPICONSVG.setAttribute("viewBox", "0 0 256 512");
        TEMPICONPATH.setAttribute("d", "M192 384c0 35.346-28.654 64-64 64-35.346 0-64-28.654-64-64 0-23.685 12.876-44.349 32-55.417V160c0-17.673 14.327-32 32-32s32 14.327 32 32v168.583c19.124 11.068 32 31.732 32 55.417zm32-84.653c19.912 22.563 32 52.194 32 84.653 0 70.696-57.303 128-128 128-.299 0-.609-.001-.909-.003C56.789 511.509-.357 453.636.002 383.333.166 351.135 12.225 321.755 32 299.347V96c0-53.019 42.981-96 96-96s96 42.981 96 96v203.347zM208 384c0-34.339-19.37-52.19-32-66.502V96c0-26.467-21.533-48-48-48S80 69.533 80 96v221.498c-12.732 14.428-31.825 32.1-31.999 66.08-.224 43.876 35.563 80.116 79.423 80.42L128 464c44.112 0 80-35.888 80-80z");
    }
    else if (celcius >= 40) {
        TEMPICONSVG.setAttribute("viewBox", "0 0 256 512");
        TEMPICONPATH.setAttribute("d", "M224 96c0-53.019-42.981-96-96-96S32 42.981 32 96v203.347C12.225 321.756.166 351.136.002 383.333c-.359 70.303 56.787 128.176 127.089 128.664.299.002.61.003.909.003 70.698 0 128-57.304 128-128 0-32.459-12.088-62.09-32-84.653V96zm-96 368l-.576-.002c-43.86-.304-79.647-36.544-79.423-80.42.173-33.98 19.266-51.652 31.999-66.08V96c0-26.467 21.533-48 48-48s48 21.533 48 48v221.498c12.63 14.312 32 32.164 32 66.502 0 44.112-35.888 80-80 80zm64-80c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-23.685 12.876-44.349 32-55.417V96c0-17.673 14.327-32 32-32s32 14.327 32 32v232.583c19.124 11.068 32 31.732 32 55.417z");
    }

    if (d.main.humidity <= 49) {
        HUMCONSVG.setAttribute("viewBox", "0 0 352 512");
        HUMCONPATH.setAttribute("d", "M205.22 22.09c-7.94-28.78-49.44-30.12-58.44 0C100.01 179.85 0 222.72 0 333.91 0 432.35 78.72 512 176 512s176-79.65 176-178.09c0-111.75-99.79-153.34-146.78-311.82zM176 448c-61.75 0-112-50.25-112-112 0-8.84 7.16-16 16-16s16 7.16 16 16c0 44.11 35.89 80 80 80 8.84 0 16 7.16 16 16s-7.16 16-16 16z");
    } else if (d.main.humidity >= 50) {
        HUMCONSVG.setAttribute("viewBox", "0 0 448 512");
        HUMCONPATH.setAttribute("d", "M216 136.3c0-34.9-31.8-47.9-46.7-97.4-2.5-9-15.7-9.4-18.6 0-14.9 49.3-46.7 62.7-46.7 97.4 0 30.8 25 55.7 56 55.7s56-24.9 56-55.7zM46.7 230.9C31.8 280.2 0 293.6 0 328.3 0 359.1 25 384 56 384s56-24.9 56-55.7c0-34.9-31.8-47.9-46.7-97.4-2.5-9-15.7-9.4-18.6 0zm294.5-87.7c-5.8-19.8-36-20.7-42.5 0C264.7 251.6 192 281.1 192 357.6c0 67.7 57.2 122.4 128 122.4s128-54.8 128-122.4c0-76.9-72.6-105.5-106.8-214.4z");
    }

}

setInterval(weatherBalloon(3464374), 1000);
weatherBalloon(3464374);
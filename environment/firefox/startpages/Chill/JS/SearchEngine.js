function toggleEngine() {
    var googleicon = document.getElementById("GoogleIcon");
    var duckicon = document.getElementById("DuckIcon");

    if (googleicon != null) {
        document.getElementById("SearchForm").action = "https://duckduckgo.com/";
        document.getElementById("IconSVG").setAttribute("viewBox", "0 0 50 50");
        document.getElementById("IconSVGPath").setAttribute('d', "M 25 2 C 12.308594 2 2 12.308594 2 25 C 2 37.691406 12.308594 48 25 48 C 37.691406 48 48 37.691406 48 25 C 48 12.308594 37.691406 2 25 2 Z M 25 4 C 36.609375 4 46 13.390625 46 25 C 46 35.101563 38.902344 43.515625 29.40625 45.53125 C 29.164063 45.15625 28.878906 44.714844 28.53125 44.21875 C 27.808594 43.183594 27.296875 42.371094 27 41.75 C 28.890625 42.519531 30.160156 42.90625 30.8125 42.90625 C 31.285156 42.90625 31.53125 42.167969 31.53125 40.6875 C 31.53125 37.9375 31.253906 36.5625 30.75 36.5625 C 30.011719 36.5625 28.597656 37.371094 26.46875 39 C 26.46875 38.585938 26.253906 38.410156 25.8125 38.46875 L 25.5625 38.46875 C 24.792969 36.429688 24.4375 34.597656 24.4375 33 C 24.4375 32.554688 24.472656 32.132813 24.5625 31.6875 C 27.28125 33.019531 29.46875 33.65625 31.125 33.65625 C 32.042969 33.65625 33.433594 33.40625 35.28125 32.875 C 37.128906 32.34375 38.03125 31.777344 38.03125 31.15625 C 38.03125 30.773438 37.785156 30.5625 37.28125 30.5625 C 36.511719 30.5625 35.417969 30.667969 33.96875 30.875 C 32.519531 31.082031 31.394531 31.1875 30.625 31.1875 C 29.828125 31.1875 28.960938 30.976563 28 30.5625 C 27.039063 30.148438 26.5625 29.585938 26.5625 28.875 C 26.5625 28.726563 26.578125 28.605469 26.625 28.53125 C 26.671875 28.460938 26.722656 28.421875 26.8125 28.40625 C 26.902344 28.390625 27.003906 28.390625 27.09375 28.40625 C 27.183594 28.421875 27.289063 28.453125 27.4375 28.46875 C 27.585938 28.484375 27.726563 28.46875 27.84375 28.46875 C 28.109375 28.46875 28.496094 28.519531 29 28.59375 C 29.503906 28.667969 29.855469 28.6875 30.09375 28.6875 C 31.011719 28.6875 32.878906 28.171875 35.71875 27.09375 C 38.558594 26.015625 40 25.152344 40 24.5625 C 40 24.207031 39.703125 23.960938 39.15625 23.8125 C 38.609375 23.664063 38.128906 23.59375 37.65625 23.59375 C 37.242188 23.59375 36.609375 23.714844 35.78125 23.9375 C 34.953125 24.160156 34.039063 24.410156 33.0625 24.71875 C 32.085938 25.027344 31.449219 25.253906 31.125 25.34375 C 31.242188 24.753906 31.3125 24.261719 31.3125 23.90625 C 31.3125 22.515625 30.925781 20.910156 30.1875 19.0625 C 29.449219 17.214844 28.601563 15.824219 27.625 14.9375 C 26.828125 14.226563 25.738281 13.765625 24.40625 13.5 C 23.578125 12.433594 22.289063 11.464844 20.53125 10.59375 C 18.773438 9.722656 17.234375 9.28125 15.875 9.28125 C 15.609375 9.28125 15.203125 9.335938 14.65625 9.4375 C 14.109375 9.539063 13.742188 9.59375 13.59375 9.625 L 12.625 11 L 12.875 11.0625 C 13.082031 11.0625 13.414063 11.027344 13.84375 10.96875 C 14.273438 10.910156 14.605469 10.875 14.8125 10.875 C 15.816406 10.875 16.949219 11.085938 18.25 11.5 C 17.421875 11.914063 16.714844 12.195313 16.09375 12.34375 C 16.035156 12.375 15.824219 12.394531 15.5 12.4375 C 15.175781 12.480469 14.910156 12.550781 14.6875 12.59375 C 14.464844 12.636719 14.253906 12.710938 14.0625 12.84375 C 13.871094 12.976563 13.78125 13.136719 13.78125 13.34375 C 15.4375 13.167969 16.671875 13.09375 17.5 13.09375 C 18.625 13.09375 19.507813 13.199219 20.15625 13.40625 C 17.878906 13.671875 16.132813 14.449219 14.90625 15.75 C 13.679688 17.050781 13.0625 18.847656 13.0625 21.125 C 13.0625 21.921875 13.132813 22.664063 13.25 23.34375 C 13.8125 26.890625 14.871094 32.179688 16.46875 39.21875 C 17.175781 42.523438 17.398438 43.53125 17.65625 44.6875 C 9.675781 41.714844 4 34.027344 4 25 C 4 13.390625 13.390625 4 25 4 Z M 27.78125 17.4375 C 28.519531 17.4375 29.046875 17.753906 29.34375 18.40625 C 28.753906 18.109375 28.261719 17.96875 27.875 17.96875 C 27.019531 17.96875 26.488281 18.148438 26.25 18.53125 C 26.367188 17.792969 26.867188 17.4375 27.78125 17.4375 Z M 17.6875 17.96875 C 18.25 17.96875 18.671875 18.175781 18.96875 18.5625 C 18.613281 18.414063 18.328125 18.3125 18.09375 18.3125 C 17.589844 18.3125 17.03125 18.488281 16.46875 18.84375 C 15.90625 19.199219 15.660156 19.621094 15.6875 20.09375 C 15.597656 19.917969 15.5625 19.738281 15.5625 19.5625 C 15.5625 19.058594 15.789063 18.6875 16.25 18.40625 C 16.707031 18.125 17.183594 17.96875 17.6875 17.96875 Z M 28.5625 20.71875 C 28.917969 20.71875 29.21875 20.84375 29.46875 21.09375 C 29.71875 21.34375 29.84375 21.644531 29.84375 22 C 29.84375 22.324219 29.71875 22.640625 29.46875 22.90625 C 29.21875 23.171875 28.917969 23.28125 28.5625 23.28125 C 28.238281 23.28125 27.921875 23.171875 27.65625 22.90625 C 27.390625 22.640625 27.25 22.324219 27.25 22 C 27.25 21.644531 27.390625 21.34375 27.65625 21.09375 C 27.921875 20.84375 28.238281 20.71875 28.5625 20.71875 Z M 29.125 21.25 C 28.917969 21.25 28.8125 21.355469 28.8125 21.5625 C 28.8125 21.800781 28.917969 21.90625 29.125 21.90625 C 29.363281 21.90625 29.46875 21.800781 29.46875 21.5625 C 29.46875 21.355469 29.363281 21.25 29.125 21.25 Z M 18.53125 21.375 C 18.914063 21.375 19.253906 21.53125 19.5625 21.84375 C 19.871094 22.15625 20.03125 22.523438 20.03125 22.90625 C 20.03125 23.289063 19.871094 23.628906 19.5625 23.9375 C 19.253906 24.246094 18.914063 24.40625 18.53125 24.40625 C 18.148438 24.40625 17.777344 24.25 17.46875 23.9375 C 17.160156 23.625 17.03125 23.289063 17.03125 22.90625 C 17.03125 22.523438 17.15625 22.152344 17.46875 21.84375 C 17.78125 21.535156 18.148438 21.375 18.53125 21.375 Z M 19.1875 22 C 18.921875 22 18.78125 22.140625 18.78125 22.40625 C 18.78125 22.644531 18.921875 22.75 19.1875 22.75 C 19.453125 22.75 19.59375 22.644531 19.59375 22.40625 C 19.59375 22.140625 19.453125 22 19.1875 22 Z");
        document.getElementById("TextField").placeholder="Search With DuckDuckGo";
        document.getElementById("GoogleIcon").setAttribute("id", "DuckIcon");
    } else if (duckicon != null) {
        document.getElementById("SearchForm").action = "https://google.com/search";
        document.getElementById("IconSVG").setAttribute("viewBox", "0 0 488 512");
        document.getElementById("IconSVGPath").setAttribute('d', "M488 261.8C488 403.3 391.1 504 248 504 110.8 504 0 393.2 0 256S110.8 8 248 8c66.8 0 123 24.5 166.3 64.9l-67.5 64.9C258.5 52.6 94.3 116.6 94.3 256c0 86.5 69.1 156.6 153.7 156.6 98.2 0 135-70.4 140.8-106.9H248v-85.3h236.1c2.3 12.7 3.9 24.9 3.9 41.4z");
        document.getElementById("TextField").placeholder="Search with Google";
        document.getElementById("DuckIcon").setAttribute("id", "GoogleIcon");
    }
}
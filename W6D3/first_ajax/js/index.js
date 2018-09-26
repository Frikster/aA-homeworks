console.log("Hello from the JavaScript console!");

$.ajax({
url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
type: 'GET',
success: function(widgetData) {
  console.log('Weather:');
  console.log(widgetData);
},
error: function(errMsg) {
  console.log(errMsg);
  // Sign up for API
  // If the request fails, sign up for your own API key here and stick that key in place of bcb83c4b54aee8418983c2aff3073b3b
}
});

console.log("That's it?")

// When does the request get sent?
// -- before "that's it"
// When does the response come back?
// -- After "that's it"
// What's the current weather in New York?
// -- coord: {…}, weather: Array(3), base: "stations", main: {…}, visibility: 16093, …}
// -- base: "stations"
// -- clouds: {all: 90}
// -- cod: 200
// -- coord: {lon: -73.99, lat: 40.73}
// -- dt: 1537928760
// -- id: 5128581
// -- main: {temp: 293.88, pressure: 1021, humidity: 100, temp_min: 291.15, temp_max: 295.95}
// -- name: "New York"
// -- rain: {1h: 0.25}
// -- sys: {type: 1, id: 2119, message: 0.0047, country: "US", sunrise: 1537958855, …}
// -- visibility: 16093
// -- weather: (30: {id: 501, main: "Rain", description: "moderate rain", icon: "10n"}
// --  --  1: {id: 741, main: "Fog", description: "fog", icon: "50n"}
// --  --  2: {id: 701, main: "Mist", description: "mist", icon: "50n"}
// wind: {speed: 4.6, deg: 170}
// Did the page refresh?
// -- No
// How could we use different HTTP methods in our request?
// -- I guess we could use rails controller methods?

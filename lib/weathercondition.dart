import 'location.dart';
import 'networking.dart';
import 'package:clima/Screen/firstscreen.dart';


class Weathermodel {
  Future<dynamic>weathercitylocation(var cityname) async{
    Network helper=Network("https://api.openweathermap.org/geo/1.0/direct?q=$cityname&limit=5&appid=$apikey&units=metric");
    var weather =await helper.getdata();
    return weather;
  }
  Future<dynamic> weatherlocation() async {
    Location location = Location();
    await location.getcurrentlocation();
    Network gdata = Network(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&unit=metric");

    var weather = await gdata.getdata();
    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

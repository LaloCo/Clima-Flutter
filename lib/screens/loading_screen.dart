import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude, longitude;

  void getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$openWeatherApiKey';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    var data = await networkHelper.getData();

    var condition = data['weather'][0]['id'];
    var temperatureKelvin = data['main']['temp'];
    var cityName = data['name'];
    print(condition);
    print(temperatureKelvin);
    print(cityName);
  }

  @override
  void initState() {
    super.initState();

    getLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

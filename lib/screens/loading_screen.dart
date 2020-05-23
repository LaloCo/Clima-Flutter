import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import '../services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    getWeatherData(latitude: location.latitude, longitude: location.longitude);
  }

  void getWeatherData({double latitude, double longitude}) async {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=cebc832c85bac282dc33969a103af744';
    var response = await get(url);
    print(response.body);
  }

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

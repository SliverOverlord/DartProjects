import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'dart:convert';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/weather.dart';

// const apiKey = '6e339dcfda744209024d520f3be901d5';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    getLocationData();
    //getData();
    super.initState();
  }

  void getLocationData() async {
    // Location location = Location();
    // await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;

    //print(latitude);
    //print(longitude);

    // NetworkHelper networkHelper = NetworkHelper(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=imperial');
    //
    // var weatherData = await networkHelper.getData();

    WeatherModel weatherModle = WeatherModel();
    var weatherData = await weatherModle.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // void getData() async {
  // http.Response response = await http.get(Uri.parse(
  //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
  //
  // //https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&appid=6e339dcfda744209024d520f3be901d5
  // if (response.statusCode == 200) {
  //   String data = response.body;
  //
  //   var decodedData = jsonDecode(data);
  //
  //   double temp = decodedData['main']['temp'];
  //   int condition = decodedData['weather'][0]['id'];
  //   String cityName = decodedData['name'];
  //
  //   print(temp);
  //   print(condition);
  //   print(cityName);
  //   // print(data);
  //   // var logitude = jsonDecode(data)['coord']['lon'];
  //   //
  //   // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
  // } else {
  //   print(response.statusCode);
  // }
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDualRing(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}

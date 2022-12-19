import 'package:clima/services/location.dart';
import 'package:clima/utilities/env.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

//lon: 52.52 lat: 13.41
  void getData() async {
    String key = Env.key;
    Response response = await get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=13.41&lon=52.52&appid=$key'),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold();
  }
}

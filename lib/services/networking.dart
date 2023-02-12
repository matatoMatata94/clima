import 'dart:convert';

import 'package:clima/services/weatherData.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  String url;

  Future<WeatherData?> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        return WeatherData.fromJson(jsonDecode(data));
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}

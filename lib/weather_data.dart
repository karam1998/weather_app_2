import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app_2/weather_model.dart';

class WeatherData{
  Future<Weather> getData(var latitude, var longitude)async{
    var url = Uri.parse('http://api.weatherapi.com/v1/current.json?key=099fc03c8e3946dab70184037222203&q=$latitude,$longitude&aqi=no');
    var response =await http.get(url);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);

  }
}
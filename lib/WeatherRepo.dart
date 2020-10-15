import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bloc_pattern_weather_app/WeatherModel.dart';

class WeatherRepo{
  String apiKey = "fc2e81c96b3f2a75d354ab07a8f2e681";
  // String base_url = "";
  Future<WeatherModel> getWeather(String city) async{
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$apiKey");
    
    if(result.statusCode != 200)
      throw Exception();
    
    return parsedJson(result.body);
  }
  
  WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
} 
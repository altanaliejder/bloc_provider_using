import 'dart:convert';

import 'package:bloc_provider_using/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String cityName) async {
    final cityURL = baseUrl + "/api/location/search/?query=" + cityName;
    final cityReply = await httpClient.get(cityURL);

    if (cityReply.statusCode != 200) {
      throw Exception("Veri Getirilirken hata oluştu");
    }
    final cityReplyJSON = (jsonDecode(cityReply.body)) as List;
    return cityReplyJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int cityID) async {
    final weatherURL = baseUrl + "/api/location/" + cityID.toString();
    final weatherReply = await httpClient.get(weatherURL);
    if (weatherReply.statusCode != 200) {
      throw Exception("Hava durumu getirilirken hata oluştu");
    }

    final weatherReplyJSON = jsonDecode(weatherReply.body);
    return Weather.fromJson(weatherReplyJSON);
  }
}

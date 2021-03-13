import 'package:bloc_provider_using/data/weather_api_client.dart';
import 'package:bloc_provider_using/locator.dart';
import 'package:bloc_provider_using/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = getIt<WeatherApiClient>();
  Future<Weather> getWeather(String city) async {
    final locationId = await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(locationId);
  }
}

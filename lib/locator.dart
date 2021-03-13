import 'package:bloc_provider_using/data/repository.dart';
import 'package:bloc_provider_using/data/weather_api_client.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => WeatherRepository());
  getIt.registerLazySingleton(() => WeatherApiClient());
}

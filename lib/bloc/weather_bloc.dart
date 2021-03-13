import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_provider_using/data/repository.dart';
import 'package:bloc_provider_using/locator.dart';
import 'package:bloc_provider_using/models/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository = getIt<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();

      try {
        Weather weather = await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: weather);
      } catch (a) {
        debugPrint(a.toString());
        //yield WeatherErrorState(a);
      }
    }
  }
}

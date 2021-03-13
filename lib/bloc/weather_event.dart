part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent([String cityName]);

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;

  FetchWeatherEvent({@required this.cityName}) : super(cityName);
  List<Object> get props => [cityName];
}

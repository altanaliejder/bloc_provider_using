part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState([Weather weather]);

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState({@required this.weather}) : super(weather);

  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {}

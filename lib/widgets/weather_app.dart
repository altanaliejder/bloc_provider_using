import 'package:bloc_provider_using/bloc/weather_bloc.dart';

import 'package:bloc_provider_using/widgets/select_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'weather_card.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String selectionCity;
    // ignore: close_sinks
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  selectionCity = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectCity()));
                  if (selectionCity != null) {
                    _weatherBloc
                        .add(FetchWeatherEvent(cityName: selectionCity));
                  }
                })
          ],
        ),
        body: WeatherCard(
          cityName: selectionCity,
        ));
  }
}

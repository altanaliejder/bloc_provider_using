import 'package:bloc_provider_using/bloc/weather_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WeatherCard extends StatefulWidget {
  @override
  _WeatherCardState createState() => _WeatherCardState();
  String cityName;
  WeatherCard({this.cityName});
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      // ignore: missing_return
      builder: (context, WeatherState state) {
        if (state is WeatherInitial) {
          return Center(
            child: Text("Eklemek istediğiniz şehir seçiniz"),
          );
        }
        if (state is WeatherLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is WeatherLoadedState) {
          final gettingWeather = state.weather;
          List city;
          city.add(gettingWeather.title);
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      Text(
                        gettingWeather.title,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      FlutterLogo(
                        size: 150,
                      ),
                      Text(
                        "Şu anki sıcaklık:" +
                            gettingWeather.consolidatedWeather[0].theTemp
                                .toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "En yüksek Sıcaklık:" +
                                gettingWeather.consolidatedWeather[0].maxTemp
                                    .toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            "En düşük Sıcaklık:" +
                                gettingWeather.consolidatedWeather[0].minTemp
                                    .toString(),
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }

        if (state is WeatherErrorState) {
          return Center(
            child: Text("hata"),
          );
        }
      },
    );
  }
}

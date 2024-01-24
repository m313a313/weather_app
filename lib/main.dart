import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/views/home_view.dart';

import 'Cubit/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getWeatherCubit(),

      child: Builder(
          builder: (context) {

            return BlocBuilder<getWeatherCubit,weatherState>(
              builder: (context, state) {
                return MaterialApp(
                  home: const HomeView(),
                  theme: ThemeData(primarySwatch: getThemeColor(

                      BlocProvider.of<getWeatherCubit>(context).weaherModel?.condition
                  ),
                    ),

                );

              },

            );
          }
      ),
    );
  }

}

MaterialColor getThemeColor(String ? condition) {

  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
      return Colors.cyan;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Rain shower':
      return Colors.lightGreen;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Snow showers':
    case 'Patchy sleet possible':
    case 'Freezing drizzle':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
      return Colors.amber;
    default:
      return Colors.blue;
  }
}


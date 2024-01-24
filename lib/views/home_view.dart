import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/Cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/no_weather_body.dart';
import 'package:weatherapp/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<getWeatherCubit, weatherState>(
        builder: (context, state) {
        
          if (state is noWeatherState)
            return NoWeatherBody();
          else if (state is weatherLoadedState)
            return WeatherInfoBody();
          else
            return Text('oops there is an error');
        },
      ),
    );
  }
}

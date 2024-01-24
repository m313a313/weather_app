import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/get_weather_cubit/get_weather_states.dart';
import '../../Models/weather_model.dart';
import '../../services/weather_servic.dart';

class getWeatherCubit extends Cubit<weatherState> {
  getWeatherCubit() : super(noWeatherState());
   WeatherModel? weaherModel;
   int g=5;
  getWeather({required String cityName}) async {
    try {
      weaherModel =
      await WeatherService(dio: Dio()).getCurrentWeather(cityName: cityName);
      emit(weatherLoadedState());
    } catch (e) {
     emit(weatherFalureState());
    }
  }
}

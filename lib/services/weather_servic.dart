import 'dart:developer';

import 'package:dio/dio.dart';
import '../Models/weather_model.dart';

class WeatherService {
 final Dio dio;
 final String key="2ac984053d9b47619e3155023232512";
 final String baseUrl="https://api.weatherapi.com/v1";

 WeatherService({required this.dio});
 Future<WeatherModel> getCurrentWeather({required String cityName}) async {

     try {
       Response response = await dio.get(
           '$baseUrl/forecast.json?key=$key&q=$cityName&days=1');
       WeatherModel weatherModel = WeatherModel.fromJson(response.data);
       return weatherModel;
     } on DioException catch (e) {

       final String errMsg=e.response?.data['error']['message'] ?? 'oops there is an error';
       throw Exception(errMsg);
     }
     catch(e){
       log(e.toString());
      throw Exception('oops there was an error, try later');
     }

 }


}
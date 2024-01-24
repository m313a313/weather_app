
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/main.dart';

import '../Cubit/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weaherModel=  BlocProvider.of<getWeatherCubit>(context).weaherModel!;
    BlocProvider.of<getWeatherCubit>(context).weaherModel!=null;


    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [getThemeColor(weaherModel.condition),
            getThemeColor(weaherModel.condition)[300]!,
            getThemeColor(weaherModel.condition)[50]!

          ],
              begin:Alignment.topCenter,
              end: Alignment.bottomCenter
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weaherModel.cityname,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
               'updated at ${weaherModel.update_date.hour}:${weaherModel.update_date.minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weaherModel.img!}',
                ),
                 Text(
                 weaherModel.temp.round().toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weaherModel.max_temp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weaherModel.min_temp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weaherModel.condition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),

             ),
          ],

        ),

      ),
    );
  }

}

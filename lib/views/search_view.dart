import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:weatherapp/Cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/services/weather_servic.dart';

import '../Cubit/get_weather_cubit/get_weather_cubit.dart';
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
bool isRTL=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:Text('Search city')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
             var weatherCubit= BlocProvider.of<getWeatherCubit>(context);
             weatherCubit.getWeather(cityName: value);
             Navigator.pop(context);
            },
            onChanged: (value){
              setState(() {
                isRTL = intl.Bidi.detectRtlDirectionality(value);
              });
              },
            textDirection: isRTL ? TextDirection.rtl:TextDirection.ltr,
            decoration: InputDecoration(

              contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              labelText: 'Search',
                hintText: 'Enter a city name',
                suffixIcon: Icon(Icons.search),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                      borderSide:BorderSide(
                      //  color: Colors.green
                      ),
                ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              borderSide:BorderSide(
                  //color: Colors.green
              )


            ),
          ),
        ),
      ),


    ));
  }
}

class WeatherModel {
  final String cityname;
  final DateTime update_date;
  final double temp;
  final double max_temp;
  final double min_temp;
  final String? img;
   String condition;
  WeatherModel(
      {
      required this.cityname,
      required this.update_date,
      required this.temp,
      required this.max_temp,
      required this.min_temp,
      this.img,
      required this.condition
      });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityname: json['location']['name'],
        update_date:DateTime.parse(json["current"]["last_updated"]),
        temp: json["forecast"]["forecastday"][0]["day"]['avgtemp_c'],
        max_temp:  json["forecast"]["forecastday"][0]["day"]['maxtemp_c'],
        min_temp:  json["forecast"]["forecastday"][0]["day"]['mintemp_c'],
        condition:   json["forecast"]["forecastday"][0]["day"]['condition']['text'],
        img:  json["forecast"]["forecastday"][0]["day"]['condition']['icon']
    );

  }
}

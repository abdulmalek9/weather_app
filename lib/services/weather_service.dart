import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String apiKey = "76dddb344ddbd402181c2a52b0dc9fd1"; //put your api key here;
  String baseUrl = 'https://api.openweathermap.org/data';
  final Dio dio;
  Map<String, dynamic> weatherinfo = {};
  List<WeatherModel>? info;

  WeatherService(this.dio);

  Future<dynamic> getweatheresponse({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/2.5/forecast?q=$cityname&units=metric&appid=$apiKey');
      // log("response.data ========== ${response.data}");
      return response.data;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'] ??
          "opps there was an error try again later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> getWeatherInfo(
      {required String cityname}) async {
    //WeatherModel List<WeatherModel>?

    // WeatherModel? info;
    weatherinfo = await getweatheresponse(cityname: cityname);
    log("model =============== ${weatherinfo['list'][0]}");
    // info = WeatherModel.fromJson(weatherinfo, cityname);
    // log("message ${weatherinfo['list'].length}");
    // for (int i = 0; i < weatherinfo['list'].length; i++) {
    // print("i =  $i");
    // info![i] = WeatherModel.fromJson(weatherinfo, cityname, dayNumber: i);
    // }
    // log("info============");
    // print("ss=== ${info![0]}");

    // for (int i = 0; i < weatherinfo.length; i++) {

    // }
    return weatherinfo;
  }
}


// {
//   "cod": "200",
//   "message": 0,
//   "cnt": 40,
//   "list": [
//     {
//       "dt": 1706043600,
//       "main": {
//         "temp": 9.42,
//         "feels_like": 6.59,
//         "temp_min": 9.42,
//         "temp_max": 10.76,
//         "pressure": 1015,
//         "sea_level": 1015,
//         "grnd_level": 934,
//         "humidity": 66,
//         "temp_kf": -1.34
//       },
//       "weather": [
//         {
//           "id": 802,
//           "main": "Clouds",
//           "description": "scattered clouds",
//           "icon": "03n"
//         }
//       ],
//       "clouds": {
//         "all": 36
//       },
//       "wind": {
//         "speed": 5.76,
//         "deg": 279,
//         "gust": 10.15
//       },
//       "visibility": 10000,
//       "pop": 0.11,
//       "sys": {
//         "pod": "n"
//       },
//       "dt_txt": "2024-01-23 21:00:00"
//     },
//     {
//       "dt": 1706054400,
//       "main": {
//         "temp": 9.44,
//         "feels_like": 7.56,
//         "temp_min": 9.44,
//         "temp_max": 9.49,
//         "pressure": 1015,
//         "sea_level": 1015,
//         "grnd_level": 934,
//         "humidity": 68,
//         "temp_kf": -0.05
//       },
//       "weather": [
//         {
//           "id": 802,
//           "main": "Clouds",
//           "description": "scattered clouds",
//           "icon": "03n"
//         }
//       ],
//       "clouds": {
//         "all": 30
//       },
//       "wind": {
//         "speed": 3.5,
//         "deg": 266,
//         "gust": 6.13
//       },
//       "visibility": 10000,
//       "pop": 0.11,
//       "sys": {
//         "pod": "n"
//       },
//       "dt_txt": "2024-01-24 00:00:00"
//     },
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String apiKey = //put your api key here;
  String baseUrl = 'https://api.openweathermap.org/data';
  final Dio dio;

  WeatherService(this.dio);

  Future<dynamic> getweatheresponse({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/2.5/forecast?q=$cityname&units=metric&appid=$apiKey');
      log(response.data);
      return response.data;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message'] ??
          "opps there was an error try again later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<WeatherModel?> getWeatherInfo({required String cityname}) async {
    WeatherModel? info;
    Response weatherinfo = await getweatheresponse(cityname: cityname);
    info = WeatherModel.fromJson(weatherinfo.data, cityname);

    return info;
  }
}

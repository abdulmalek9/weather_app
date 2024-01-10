import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String apiKey = "76dddb344ddbd402181c2a52b0dc9fd1"; //put your api key here;
  String baseUrl = 'https://api.openweathermap.org/data';
  final Dio dio;

  WeatherService(this.dio);

  Future<dynamic> getweatheresponse({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/2.5/forecast?q=$cityname&units=metric&appid=$apiKey');
      log("response.data ========== ${response.data}");
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
    Map<String, dynamic> weatherinfo =
        await getweatheresponse(cityname: cityname);
    log("model =============== ${weatherinfo['list']}");
    info = WeatherModel.fromJson(weatherinfo, cityname);

    return info;
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_cubit_state.dart';

class WeatherCubitCubit extends Cubit<WeatherCubitState> {
  WeatherCubitCubit() : super(WeatherCubitInitial());
  List<WeatherModel>? weatherInfo;
  Map<String, List<WeatherModel>> weatherPerDay = {};
  // WeatherModel? weatherInfo;
  // WeatherModel? weatherModelAllday;
  // List<WeatherModel>? weatherModelAllday;
  Map<String, dynamic> weatherModelAllday = {};

  getResponsePerDay({String? cityName, int? dataCount}) {
    int dayNum = 1, count = 0;
    String key = "day $dayNum";
    weatherPerDay = {
      "day 1": [],
      "day 2": [],
      "day 3": [],
      "day 4": [],
      "day 5": [],
      "day 6": [],
    };
    for (int i = 0; i < dataCount! - 1; i++) {
      if (weatherModelAllday['list'][i]['dt_txt'].split(" ")[0] ==
          weatherModelAllday['list'][i + 1]['dt_txt'].split(" ")[0]) {
        weatherPerDay[key]!.insert(count,
            WeatherModel.fromJson(weatherModelAllday, cityName!, dayNumber: i));
        count++;

        // weatherPerDay[key]!.add(WeatherModel.fromJson(
        //     weatherModelAllday, cityName,
        //     dayNumber: i));
        print("for =========== $i");
      } else {
        weatherPerDay[key]!.insert(count,
            WeatherModel.fromJson(weatherModelAllday, cityName!, dayNumber: i));
        // weatherPerDay[key]!.add(WeatherModel.fromJson(
        //     weatherModelAllday, cityName,
        //     dayNumber: i));
        dayNum++;
        count = 0;
        key = "day $dayNum";
        print("dayNum =========== $dayNum");
      }
    }
  }

  getWeatherInfo({required String cityName}) async {
    try {
      weatherModelAllday =
          await WeatherService(Dio()).getWeatherInfo(cityname: cityName);
      // weatherInfo = [WeatherModel.fromJson(weatherModelAllday, cityName)];
      int j = weatherModelAllday['list'].length;
      getResponsePerDay(cityName: cityName, dataCount: j);
      weatherInfo = weatherPerDay["day 1"];
      print("object=================");
      emit(WeatherLoadedState());
    } catch (e) {
      print("HHH=================");
      log(e.toString());
      emit(WeatherFailurState());
    }
  }
}

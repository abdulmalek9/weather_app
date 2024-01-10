import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_cubit_state.dart';

class WeatherCubitCubit extends Cubit<WeatherCubitState> {
  WeatherCubitCubit() : super(WeatherCubitInitial());
  WeatherModel? weatherInfo;

  getWeatherInfo({required String cityName}) async {
    try {
      weatherInfo =
          await WeatherService(Dio()).getWeatherInfo(cityname: cityName);
      print("object=================");
      emit(WeatherLoadedState());
    } catch (e) {
      print("HHH=================");
      log(e.toString());
      emit(WeatherFailurState());
    }
  }
}

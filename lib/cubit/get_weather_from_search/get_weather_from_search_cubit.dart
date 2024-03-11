import 'dart:developer';
// import 'package:geocode/geocode.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
part 'get_weather_from_search_state.dart';

class GetWeatherFromSearchCubit extends Cubit<GetWeatherFromSearchState> {
  GetWeatherFromSearchCubit() : super(GetWeatherCubitInitial());
  bool isSearched = false;

  List<WeatherModel>? weatherInfo;
  Map<String, List<WeatherModel>> weatherPerDay = {};
  // WeatherModel? weatherInfo;
  // WeatherModel? weatherModelAllday;
  // List<WeatherModel>? weatherModelAllday;
  Map<String, dynamic> weatherModelAllday = {};
  String dayName = "";

  // Location location = Location(); //explicit reference to the Location class
  // Future checkGps() async {
  //   if (!await location.serviceEnabled()) {
  //     location.requestService();
  //   }
  // }

  getResponsePerDay({String? cityName, int? dataCount}) {
    int dayNum = 1, count = 0;
    String key = "day $dayNum";
    weatherPerDay = {
      "day 1": [],
      "day 2": [],
      "day 3": [],
      "day 4": [],
    }; // "day 5": [], "day 6": [],
    for (int i = 0; i < dataCount! - 1; i++) {
      if (weatherModelAllday['list'][i]['dt_txt'].split(" ")[0] ==
          weatherModelAllday['list'][i + 1]['dt_txt'].split(" ")[0]) {
        weatherPerDay[key]!.insert(
            count,
            WeatherModel.fromJson(weatherModelAllday,
                dayNumber: i)); // cityName!,
        count++;

        // weatherPerDay[key]!.add(WeatherModel.fromJson(
        //     weatherModelAllday, cityName,
        //     dayNumber: i));
        // print("for =========== $i");
      } else {
        weatherPerDay[key]!.insert(
            count,
            WeatherModel.fromJson(weatherModelAllday,
                dayNumber: i)); // cityName!,
        // weatherPerDay[key]!.add(WeatherModel.fromJson(
        //     weatherModelAllday, cityName,
        //     dayNumber: i));
        dayNum++;
        count = 0;
        key = "day $dayNum";
        weatherPerDay[key] = [];
        // print("dayNum =========== $dayNum");
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

      // Position position = await _determinePosition();
      // String lat = position.toString().split(" ")[1];
      // // log("============= ${double.parse(lat.substring(0, lat.length - 1))}");
      // log("============= $position");
      // var address = await GeoCode().reverseGeocoding(
      //   latitude: double.parse(lat.substring(0, lat.length - 1)),
      //   longitude: double.parse(
      //     position.toString().split(" ")[3],
      //   ),
      // );
      // List<Placemark> placemarks = await placemarkFromCoordinates(
      //   double.parse(lat.substring(0, lat.length - 1)),
      //   double.parse(position.toString().split(" ")[3]),
      // );
      // log("The current location is $placemarks[0]");
      isSearched = true;
      emit(GetWeatherLoadedState());
    } catch (e) {
      print("HHH=================");
      isSearched = false;

      log(e.toString());
      emit(GetWeatherFailurState());
    }
  }

  getDayName({String? date}) {
    // String date = weatherModelAllday['list'][1]['dt_txt'].split(" ")[0];
    dynamic splitDate = date!.split(" ")[0].split('-');
    String dateString = splitDate[2] + "-" + splitDate[1] + "-" + splitDate[0];
    // Your date string from the API
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(dateString);
    dayName = DateFormat('EEEE').format(parsedDate);

    print('The day name is ${dayName.substring(0, 3)}');
    print('The dateString name is $dateString');
    return dayName.substring(0, 3);
  }
}

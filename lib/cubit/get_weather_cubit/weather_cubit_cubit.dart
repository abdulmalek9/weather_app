import 'dart:developer';
// import 'package:geocode/geocode.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
part 'weather_cubit_state.dart';

class WeatherCubitCubit extends Cubit<WeatherCubitState> {
  WeatherCubitCubit() : super(WeatherCubitInitial());
  List<WeatherModel>? weatherInfo;
  Map<String, List<WeatherModel>> weatherPerDay = {};
  // WeatherModel? weatherInfo;
  // WeatherModel? weatherModelAllday;
  // List<WeatherModel>? weatherModelAllday;
  Map<String, dynamic> weatherModelAllday = {};
  String dayName = "";

  Location location = Location(); //explicit reference to the Location class
  Future checkGps() async {
    if (!await location.serviceEnabled()) {
      location.requestService();
    }
  }

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
      emit(WeatherLoadedState());
    } catch (e) {
      print("HHH=================");
      log(e.toString());
      emit(WeatherFailurState());
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

  Future<bool> requestPermission() async {
    Location location = Location();
    final permission = await location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  Future<Position> determinePosition() async {
    // await checkGps();
    // bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   await checkGps();
    //   // location.requestService();
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   // return Future.error('Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  getInitWeatherInfo() async {
    try {
      Position position = await determinePosition();
      String lat = position.toString().split(" ")[1];
      String lon = position.toString().split(" ")[3];

      weatherModelAllday = await WeatherService(Dio()).getweatheresponseByGeo(
          lat: lat.substring(0, lat.length - 1), lon: lon);

      int j = weatherModelAllday['list'].length;
      getResponsePerDay(dataCount: j);
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

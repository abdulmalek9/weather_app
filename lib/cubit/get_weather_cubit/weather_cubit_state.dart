part of 'weather_cubit_cubit.dart';

sealed class WeatherCubitState {}

final class WeatherCubitInitial extends WeatherCubitState {
//   getWeather() async {

// try {

//       var weatherModelAllday =
//           await WeatherService(Dio()).getweatheresponseByGeo(cityname: );
//       // weatherInfo = [WeatherModel.fromJson(weatherModelAllday, cityName)];
//       int j = weatherModelAllday['list'].length;
//       getResponsePerDay(cityName: cityName, dataCount: j);
//       weatherInfo = weatherPerDay["day 1"];

//     } catch (e) {
//       print("HHH=================");
//       log(e.toString());

//     }
//   }
}

final class WeatherLoadedState extends WeatherCubitState {}

final class WeatherFailurState extends WeatherCubitState {}

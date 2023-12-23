part of 'weather_cubit_cubit.dart';

sealed class WeatherCubitState {}

final class WeatherCubitInitial extends WeatherCubitState {}

final class WeatherLoadedStat extends WeatherCubitState {}

final class WeatherFailurStat extends WeatherCubitState {}

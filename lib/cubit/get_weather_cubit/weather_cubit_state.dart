part of 'weather_cubit_cubit.dart';

sealed class WeatherCubitState {}

final class WeatherCubitInitial extends WeatherCubitState {}

final class WeatherLoadedState extends WeatherCubitState {}

final class WeatherFailurState extends WeatherCubitState {}

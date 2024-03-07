part of 'get_weather_from_search_cubit.dart';

sealed class GetWeatherFromSearchState {}

final class GetWeatherFromSearchInitial extends GetWeatherFromSearchState {}

final class GetWeatherCubitInitial extends GetWeatherFromSearchState {}

final class GetWeatherLoadedState extends GetWeatherFromSearchState {}

final class GetWeatherFailurState extends GetWeatherFromSearchState {}

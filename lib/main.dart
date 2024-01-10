import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit_cubit.dart';
import 'package:weather_app/views/main_home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubitCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainHomeView(),
      ),
    );
  }
}

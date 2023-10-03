import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xff0d2843), Color(0xff144875)]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 80.0, right: 16, left: 16),
            child: Column(
              children: [
                WeatherWidget(
                  cityTitle: "Damascuse",
                  weatherTitle: "Cloudy",
                  weatherImage: "assets/Cloudy.png",
                  tempr: "18",
                ),
                SizedBox(
                  height: 44,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Today",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

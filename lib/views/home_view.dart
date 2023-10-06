import 'package:flutter/material.dart';
import 'package:weather_app/widgets/home_view_builder.dart';

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
          child: const SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(top: 60.0, right: 16, left: 16),
            child: HomeViewBuilder(),
          ))),
    );
  }
}

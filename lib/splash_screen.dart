import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/views/main_home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
    //     overlays: [SystemUiOverlay.top]);
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainHomeView()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Color(0xff124974), Color(0xff4076c3)]),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            "assets/logo/logo_weather.png",
            width: 300,
            height: 300,
          ),
          const Text(
            "Weather App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 128,
          ),
          const Text(
            "Created By:",
            style: TextStyle(
              color: Colors.white38,
              fontSize: 18,
            ),
          ),
          const Text(
            " AbdulMalek-ALkhatib",
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
        ]),
      ),
    );
  }
}

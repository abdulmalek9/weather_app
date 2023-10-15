import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:weather_app/widgets/temp_value_builder.dart';

class CustomWeatherCard extends StatelessWidget {
  const CustomWeatherCard({
    super.key,
    required this.location,
    required this.subTitle,
    required this.weatherState,
    required this.tempValue,
    required this.tempH,
    required this.tempL,
    required this.weatherImage,
  });
  final String location,
      subTitle,
      weatherState,
      tempValue,
      tempH,
      tempL,
      weatherImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter:
              const ColorFilter.mode(Colors.black45, BlendMode.multiply),
          image: AssetImage(
            weatherImage,
          ),
        ),
        borderRadius: BorderRadius.circular(21),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 1.0),
          child: Container(
            padding: const EdgeInsets.only(top: 28.0, left: 24.0, right: 24.0),
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                width: 1.5,
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff245181), Color(0xff4076c3)],
                ),
              ),
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 55.0,
                    ),
                    Text(
                      weatherState,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // const SizedBox(
                //   width: 84.0,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TempValueBuilder(
                      tembNum: tempValue,
                      numberFontSize: 50,
                      isforSmall: false,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          "H:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        TempValueBuilder(
                          tembNum: tempH,
                          numberFontSize: 16,
                          isforSmall: true,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "L:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        TempValueBuilder(
                          tembNum: tempL,
                          numberFontSize: 16,
                          isforSmall: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

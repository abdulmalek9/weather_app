import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.cityTitle,
    required this.weatherTitle,
    required this.weatherImage,
    required this.tempr,
  });
  final String cityTitle, weatherTitle, weatherImage, tempr;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: (MediaQuery.of(context).size.width - 120),
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff386fb4),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: const Color(0xff1a4e7e),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                cityTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    tempr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "o",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 26,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 3),
                    height: 54,
                    child: const VerticalDivider(
                      thickness: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 88,
                    height: 42,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Color(0xff35648e),
                    ),
                    child: Text(
                      weatherTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 144,
          right: -60,
          child: Image.asset(
            weatherImage,
            width: 400,
            height: 200,
          ),
        ),
      ],
    );
  }
}

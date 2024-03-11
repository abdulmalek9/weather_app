import 'package:flutter/material.dart';
import 'package:weather_app/widgets/line_temp_value_builder.dart';

class TempInfoPerDay extends StatelessWidget {
  const TempInfoPerDay({
    super.key,
    required this.day,
    required this.weatherImage,
    required this.tempMorningNum,
    required this.tempNightNum,
  });
  final String day;
  final String weatherImage;
  final String tempMorningNum, tempNightNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          day,
          style: const TextStyle(
            color: Color(0xff667e94),
            fontSize: 16,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Image(
          image: AssetImage(
            weatherImage,
          ),
          width: 45,
          height: 45,
        ),
        const Spacer(
          flex: 1,
        ),
        // const SizedBox(
        //   width: 42,
        // ),
        LineTempValueBuilder(
          tempMorningNum: tempMorningNum,
          tempNightNum: tempNightNum,
        )
      ],
    );
  }
}

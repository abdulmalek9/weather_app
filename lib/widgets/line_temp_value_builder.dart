import 'package:flutter/material.dart';
import 'package:weather_app/widgets/temp_value_builder.dart';

class LineTempValueBuilder extends StatelessWidget {
  const LineTempValueBuilder({
    super.key,
    required this.tempMorningNum,
    required this.tempNightNum,
  });

  final String tempMorningNum, tempNightNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TempValueBuilder(
          tembNum: tempMorningNum,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Stack(
          children: [
            Container(
              width: 80,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
            ),
            Positioned(
              left: 18,
              child: Container(
                width: 60,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 8.0,
        ),
        TempValueBuilder(
          tembNum: tempNightNum,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TempValueBuilder extends StatelessWidget {
  const TempValueBuilder({
    super.key,
    required this.tembNum,
    this.tempFormat = "",
    this.numberFontSize = 18,
    required this.isforSmall,
  });
  final double numberFontSize;
  final bool isforSmall;
  final String tembNum;
  final String? tempFormat;
  @override
  Widget build(BuildContext context) {
    double restSize =
        isforSmall == true ? (numberFontSize - 6) : (numberFontSize - 12);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tembNum,
          style: TextStyle(
            color: Colors.white,
            fontSize: numberFontSize,
          ),
        ),
        Text(
          "o",
          textAlign: TextAlign.start,
          style: TextStyle(
              height: 1,
              color: Colors.white,
              fontSize: restSize,
              fontWeight: FontWeight.bold),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 1.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Text(
        //         "o",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: restSize,
        //             fontWeight: FontWeight.bold),
        //       ),
        //       SizedBox(
        //         height: (restSize - 12) < 0 ? 10 : restSize - 12,
        //       )
        //     ],
        //   ),
        // ),
        Text(
          tempFormat!,
          style: TextStyle(
            color: Colors.white,
            fontSize: numberFontSize,
          ),
        ),
      ],
    );
  }
}

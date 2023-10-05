import 'package:flutter/material.dart';

class TempValueBuilder extends StatelessWidget {
  const TempValueBuilder({
    super.key,
    required this.tembNum,
    this.tempFormat = "",
  });
  final String tembNum;
  final String? tempFormat;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tembNum,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "o",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Text(
          tempFormat!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

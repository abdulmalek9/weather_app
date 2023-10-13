import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    super.key,
    required this.childWidget,
  });

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff0d2843), Color(0xff124974)]),
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 60.0, right: 16, left: 16),
          child: childWidget,
        )));
  }
}

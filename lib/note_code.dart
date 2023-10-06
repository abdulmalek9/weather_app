// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         width: 350,
//         height: 350,
//         child: SliderTheme(
//           data: SliderThemeData(
//             overlayColor: Colors.transparent,
//             thumbShape: SliderComponentShape.noThumb,
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text('HTML'),
//                   Text(sliderValue.toInt().toString() + '%')
//                 ],
//               ),
//               Slider(
//                   value: 90,
//                   min: 0.0,
//                   max: 100.0,
//                   divisions: 100,
//                   mouseCursor: MouseCursor.uncontrolled,
//                   onChanged: (double value) {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

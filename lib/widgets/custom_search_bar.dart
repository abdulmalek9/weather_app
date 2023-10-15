import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class CustomSearchbar extends StatefulWidget {
  const CustomSearchbar({super.key});

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  String searchValue = '';
  Color color = Colors.white.withOpacity(0.3);
  Color tcolor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        scrollPhysics: const BouncingScrollPhysics(),
        showCursor: true,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
        enableSuggestions: true,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onSubmitted: ((value) {
          onSubm(value);
        }),
        onTap: () {
          tcolor = Colors.blue.withOpacity(0.5);
          setState(() {});
        },
        onChanged: (value) {
          tcolor = Colors.blue.withOpacity(0.5);
          color = Colors.white;
          setState(() {});
          searchValue = value;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          filled: true,
          fillColor: Colors.white.withOpacity(0.07),
          prefixIcon: IconButton(
            padding: const EdgeInsets.only(bottom: 3, left: 8),
            onPressed: () {
              onSubm(searchValue);
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: color.withOpacity(0.6),
              size: 18,
            ),
          ),
          hintText: "Search for a city",
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white.withOpacity(0.3),
            fontSize: 16,
          ),
          border: gradiantBorder(),
          enabledBorder: gradiantBorder(),
        ),
      ),
    );
  }

//function code of filter icon with drop down

//functoin check if text field null or do search
  void onSubm(String value) {
    if (value.isEmpty) {
      tcolor = Colors.red.withOpacity(0.5);
      color = Colors.red;
      setState(() {});
      log('field is required');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Scaffold();
          },
        ),
      );
    }
  }

  GradientOutlineInputBorder gradiantBorder() {
    return GradientOutlineInputBorder(
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
        colors: [
          Color.fromARGB(255, 38, 114, 190),
          Color.fromARGB(255, 45, 148, 239),
        ],
      ),
      width: 1.5,
      borderRadius: BorderRadius.circular(16),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/setting_view.dart';
import 'package:weather_app/widgets/back_ground_widget.dart';
import 'package:weather_app/widgets/home_view_builder.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({
    super.key,
  });

  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> tabs = [
    const HomeViewBuilder(),
    const CustomSearchView(),
    const SettingView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: BackGroundWidget(
            childWidget: tabs.elementAt(_selectedIndex), // HomeViewBuilder(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: const Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.white.withOpacity(0.5),
                backgroundColor: Colors.white.withOpacity(0.05),
                elevation: 0,
                currentIndex: _selectedIndex,
                selectedItemColor: const Color(0xff2e93ee),
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.cloud_queue_rounded),
                    label: 'Weather',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Location',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

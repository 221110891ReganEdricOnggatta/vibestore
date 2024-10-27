import 'package:flutter/material.dart';
import 'package:minggu4/screens/home/home.dart';
import 'package:minggu4/screens/profile/profile.dart';
import 'package:minggu4/screens/search/search.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}

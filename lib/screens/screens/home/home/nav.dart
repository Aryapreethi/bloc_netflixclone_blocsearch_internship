import 'package:flutter/material.dart';
import 'package:net/screens/color/color.dart';
import 'package:net/screens/screens/hotandnew/commingsoon.dart';
import 'package:net/screens/screens/home/home/Homescreen.dart';
import 'package:net/screens/screens/download/screen/downloadScreen.dart';
import '../../search/screen/searchlist.dart';

class AppNavScreen extends StatefulWidget {
  const AppNavScreen({super.key});

  @override
  State<AppNavScreen> createState() => _AppNavScreenState();
}

class _AppNavScreenState extends State<AppNavScreen> {
  int index = 0;
  final pages = [
    HomeScreen(),
    CommingSoonScreen(),
    Searchview(),
    DownloadScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: background,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        elevation: 0,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined), label: 'New & Hot'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download_outlined), label: 'Download')
        ],
      ),
    );
  }
}

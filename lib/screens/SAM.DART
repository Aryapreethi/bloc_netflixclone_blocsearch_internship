import 'package:flutter/material.dart';
import 'package:switchdark/screen/viewdark.dart';


class Homebar extends StatefulWidget {
  const Homebar({super.key});

  @override
  State<Homebar> createState() => _HomebarState();
}

class _HomebarState extends State<Homebar> {
  int index = 0;
  final pages = [
    const DarkMode(),
    const DarkMode(),
    const DarkMode(),
    const DarkMode(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            fixedColor: Theme.of(context).colorScheme.primary,
          onTap: (value) {
            index = value;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(null), label: ("Home")),
            BottomNavigationBarItem(icon: Icon(null), label: ("Search")),
            BottomNavigationBarItem(icon: Icon(null), label: ("Category")),
            BottomNavigationBarItem(icon: Icon(null), label: ("Setting")),
          ]),
    );
  }
}

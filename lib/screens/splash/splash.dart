import 'dart:async';
import 'package:flutter/material.dart';
import 'package:net/screens/splash/home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
   void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () =>
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/icons/net_splash.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/bloc/app_bloc.dart';
import 'package:net/provider/api.dart';
import 'package:net/provider/homeapi.dart';
import 'package:net/screens/color/color.dart';
import 'package:net/screens/screens/download/bloc/app_bloc.dart';
import 'package:net/screens/splash/splash.dart';




void main() {
  runApp(
     const MyApp(),   
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:  Colors.black,
        // backgroundColor: Colors.black,
        scaffoldBackgroundColor: background,
        appBarTheme: AppBarTheme(
          backgroundColor: background,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        colorScheme: const ColorScheme.dark(
          background: Colors.black,
          primary: Colors.black,
          secondary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => UserBloc(Api()),),
        BlocProvider(create: (context) => DataBloc(HomeaApi()),
        // child: BlocProvider(create: (context) => SearchBloc(ApiProvider()),)
        
        )
      ],child: const MyHomePage()),
    );
  }
}

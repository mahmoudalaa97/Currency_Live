import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'العملات مباشر',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
            primaryColor: Color(0xff232F3E),
            accentColor: Color(0xff1BBC9B),
            appBarTheme: AppBarTheme(textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),
            textTheme: TextTheme(
                headline1: TextStyle(color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                headline2: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)
            )
        ),
        theme: ThemeData(
            primaryColor: Color(0xff6B9080),
            accentColor: Color(0xff1BBC9B),
            appBarTheme: AppBarTheme(textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),
            textTheme: TextTheme(
                headline1: TextStyle(color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                headline2: TextStyle(color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)
            )
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),);
  }
}



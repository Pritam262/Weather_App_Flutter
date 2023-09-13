import 'package:flutter/material.dart';
import 'package:weather_app/Activity/location.dart';
import 'Package:weather_app/Activity/home_screen.dart';
import 'package:weather_app/Activity/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomePage(),
      routes: {
        // Set defalut route
        '/':(context) =>SplashScreen(),
        '/home':(context) => HomePage(),
        '/loading':(context)=> SplashScreen(),
      },
    );
  }
}

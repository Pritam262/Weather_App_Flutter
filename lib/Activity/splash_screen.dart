import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


// If the data get from the another widget and set the default value the data fetching function should ot be write on initState function
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // String Tepreature = 'Loading';
  String city = 'kolkata';
  String location = '';
  String region = ' ';
  String country = ' ';
  String lat = ' ';
  String lon = ' ';
  String temp = ' ';
  String condition = ' ';
  String image_url = ' ';
  String air_speed = ' ';
  String humidity = ' ';
  String air_direction = ' ';

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getWeatherData();
    location = instance.location;
    region = instance.region;
    country = instance.country;
    lat = instance.lat;
    lon = instance.lon;
    temp = instance.temp;
    condition = instance.condition;
    image_url = instance.image_url;
    air_speed = instance.air_speed;
    humidity = instance.humidity;
    air_direction = instance.air_direction;
    // Future deley use for atleast the flash screen will be shown 3 second (which time you want)
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {
          'location': location,
          'region': region,
          'country': country,
          'lat': lat,
          'lon': lon,
          'temp': temp,
          'condition': condition,
          'image_url': image_url,
          'air_speed': air_speed,
          'humidity': humidity,
          'air_direction': air_direction
        },
      );
    },);

  }

  @override
  void initState() {
    // startApp();
    super.initState();

/*    Timer(Duration(seconds: 4), () {
     Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location' = location,

     } );
    });*/
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? searchData =
    ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    // var searchCity = '';
    if (searchData?.isNotEmpty ?? false) {
      city = searchData?['SearchText'];
    }

    startApp(city);

    return Scaffold(
        body:
/*      Container(
        color: Colors.blue.shade100,
        child: Center(
            child: Icon(
          Icons.ac_unit,
          color: Colors.white,
          size: 100,
        )),
      ),*/

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/cloudy.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 15,),
                  Text('Weather App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Text('Made by Pritam', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                  SizedBox(height: 15,),
                  SpinKitWave(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.blue[100],
    );
  }
}

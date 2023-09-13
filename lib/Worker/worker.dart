import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class worker {
  String location;

  worker({required this.location});

  Map data = {};

   String region = '';
   String country ='';
  late String lat;
  late String lon;
  late String temp;
  late String condition;
  late String image_url;
  late String air_speed;
  late String humidity = '';
  late String air_direction;
  late String desc;

  // ... rest of the class code ...

  Future<void> getWeatherData() async {
    final apiKey = 'be1d66e43c554ba9877103750230506';
    final apiUrl = 'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map resdata = jsonDecode(response.body);
        data = resdata;
        Map locationData = resdata['location'];
        Map currentData = resdata['current'];

        location = locationData['name'] ?? '';
        region = locationData['region'] ?? '';
        country = locationData['country'] ?? '';
        lat = locationData['lat'].toString() ?? '';
        lon = locationData['lon'].toString() ?? '';
        temp = "${currentData['temp_c'].toString()} \u2103" ?? '';
        condition = currentData['condition']['text'] ?? '';
        image_url = currentData['condition']['icon'] ?? '';
        air_speed = "${currentData['wind_kph']?.toString()} kmph" ?? '';
        humidity = "${currentData['humidity']?.toString()}%" ?? '';
        air_direction = currentData['wind_dir'] ?? '';
      } else {
        location = 'NA';
        region = 'NA';
        country ='NA';
        lat = 'NA';
        lon ='NA';
        temp ='NA';
        condition ='NA';
        image_url ='NA';
        air_speed ='NA';
        humidity ='NA';
        air_direction = 'NA';
        desc = "Cant't Find Data";
        // print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

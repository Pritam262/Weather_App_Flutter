// import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:weather_app/Activity/location.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? info =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    var location = '';
    var region = '';
    var country = '';
    var lat = '';
    var lon = '';
    var temp = '';
    var condition = '';
    var image_url = '';
    var air_speed = '';
    var humidity = '';
    var air_direction = '';

    if (info != null) {
      if(info['location'] == 'NA'){
        image_url = 'https://cdn-icons-png.flaticon.com/512/1304/1304037.png';

      }else{
        location = info['location'];
        image_url = "http:${info['image_url']}";
        condition = info['condition'];
        region = info['region'];
      }
      region = info['region'];
      country = info['country'];
      lat = info['lat'];
      lon = info['lon'];
      temp = info['temp'];
      air_speed = info['air_speed'];
      humidity = info['humidity'];
      air_direction = info['air_direction'];
    }

    var city_name = [
      'Mumbai',
      'Delhi',
      'Kolkata',
      'Chennai',
      'Dhuguri',
      'Kochi',
      'Maldah'
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    // Container colour variable
     Color conColor = Colors.white54.withOpacity(0.5);

     // Variable declare

    var smWidth = 190.0;
    var smHeight = 150.0;
    var smPosiTop = 10.0;
    var smPosiLeft = 10.0;
    var tempConHeight = 220.0;
    TextStyle smText = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

    TextEditingController textController =new TextEditingController();

    return Scaffold(
/*      appBar: AppBar(
        title: Text('Home Page'),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.blue.shade300,
      ),*/

    // To avoid bottom pixel outage
    resizeToAvoidBottomInset: false,
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.blue,
      ),
    ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(1.0, 0.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Search field
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(
                          //   color: Colors.black,
                          // ),
                          borderRadius: BorderRadius.circular(50),
                          // color: Colors.blue.shade100,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: textController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search City',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: GestureDetector(
                                onTap: () {
                                  if(textController.text.replaceAll(' ', '') == ""){
                                    print('Blank search');
                                  }else{
                                    Navigator.pushReplacementNamed(context, '/loading', arguments: {
                                      'SearchText':textController.text.toString()
                                    });
                                  }
                                  // print(
                                  //     'Input Text: ${textController.text.toString()}');


                                },
                                child: Icon(Icons.search),
                              ),
                            ),
                          ],
                        ),
                      )),

                  // City name
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: conColor,
                        // border: Border.all(
                        //   color: Colors.black,
                        // ),
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.blue.shade100,
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          leading:
                              CircleAvatar(child: Image.network(image_url),radius: 25,),
                          title: Text(
                            condition,
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'In $location, $region, $country ....',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text('Hello'),
                            ],
                          ),
                        ),
                        itemCount: 1,
                      ),
                    ),
                  ),

                  // Temperature
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: tempConHeight,
                      decoration: BoxDecoration(
                        color: conColor,
                          // border: Border.all(
                          //   color: Colors.black,
                          // ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Positioned(
                            top: smPosiTop,
                            left: smPosiLeft,
                            child: Row(
                              children: [
                                Icon(Icons.thermostat),
                                Text('temperature'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Center(
                              child: Text(
                            '$temp',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                  ),

                  // Humidity && Wind speed && Direction && Position
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Humidity
                            Container(
                              width: smWidth,
                              height: smHeight,
                              decoration: BoxDecoration(
                                color: conColor,
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  // ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: smPosiTop,
                                    left: smPosiLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.water_drop),
                                        Text('humidity'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Text('$humidity', style: smText,),
                                  )
                                ],
                              ),
                            ),

                            // Wind speed
                            Container(
                              width: smWidth,
                              height: smHeight,
                              decoration: BoxDecoration(
                                color: conColor,
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  // ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: smPosiTop,
                                    left: smPosiLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.wind_power_rounded),
                                        Text('wind speed'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                    '$air_speed',
                                    style: smText,
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              // Wind data
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Wind direction
                            Container(
                              width: smWidth,
                              height: smHeight,
                              decoration: BoxDecoration(
                                color: conColor,
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  // ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: smPosiTop,
                                    left: smPosiLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.directions),
                                        Text('Wind direction'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                    '$air_direction',
                                    style: smText,
                                  )),
                                ],
                              ),
                            ),

                            // Area position
                            Container(
                              width: smWidth,
                              height: smHeight,
                              decoration: BoxDecoration(
                                color: conColor,
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  // ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: smPosiTop,
                                    left: smPosiLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        Text('position'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lat: $lat',
                                          style: smText,
                                        ),
                                        Text(
                                          'Long: $lon',
                                          style: smText,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                        child: Text(
                      'Data provided by Weather API',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.grey.shade300,
    );
  }
}

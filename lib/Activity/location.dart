import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add location'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        width: double.infinity,
          height: double.infinity,
          color:Colors.blue.shade100.withOpacity(0.65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add location'),
            ],
          )),
    );
  }
}

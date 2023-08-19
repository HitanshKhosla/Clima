import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  Future<void> getlocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(child: Text(
          'Get Location',
        ),
        onPressed:(){
         getlocation();
        },),
      ),
    );
  }
}

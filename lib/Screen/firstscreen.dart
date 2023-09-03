import 'package:flutter/material.dart';
import 'package:clima/location.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {

  @override
  void initState(){
    super.initState();
    getlocation();
  }

  void getlocation() async {
    Location location=Location();
    await location.getcurrentlocation();
    print(location.longitude);
    print(location.latitude);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

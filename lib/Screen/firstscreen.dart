import 'package:flutter/material.dart';
import 'package:clima/location.dart';
import 'package:clima/networking.dart';


const apikey = '9697fa9a059bc75f477b33876a1ca5bb';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    Location location = Location();
    await location.getcurrentlocation();
    longitude = location.longitude;
    latitude = location.latitude;
    Network gdata=Network("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey");

    var weather= await gdata.getdata();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

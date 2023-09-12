import 'package:clima/locationscreen.dart';
import 'package:flutter/material.dart';
import 'package:clima/location.dart';
import 'package:clima/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = '9697fa9a059bc75f477b33876a1ca5bb';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    Location location = Location();
    await location.getcurrentlocation();
    Network gdata = Network(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&unit=metric");

    var weather = await gdata.getdata();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
     locationscreen(localweather: weather)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitPouringHourGlass(
            color: Colors.yellow.shade200,
            size: 75.0,
          ),
        ),
      ),
    );
  }
}

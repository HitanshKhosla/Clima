import 'package:clima/locationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/weathercondition.dart';

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
    Weathermodel data = Weathermodel();
    var weather = await data.weatherlocation();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => locationscreen(localweather: weather)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitRipple(
            color: Colors.grey,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}

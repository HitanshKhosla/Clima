import 'package:flutter/material.dart';
import 'package:clima/location.dart';
import 'package:http/http.dart'as http;

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
    getdata();
  }

  void getlocation() async {
    Location location=Location();
    await location.getcurrentlocation();
    print(location.longitude);
    print(location.latitude);
  }
  void getdata()async{
    http.Response response = await http.get(Uri.https('https://api.openweathermap.org/data/2.5/onecall?lat={latitude}&lon={longitude}&exclude={part}&appid={API key}'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
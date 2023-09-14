import 'package:flutter/material.dart';
import 'weathercondition.dart';

class locationscreen extends StatefulWidget {
  var localweather;
  locationscreen({required this.localweather}) {}
  @override
  State<locationscreen> createState() => _State();
}

class _State extends State<locationscreen> {
  weathermodel data=weathermodel();
  late int temperature;
  String? weatherIcon;
  String? cityname;
  String? message;
  @override
  void initState() {
    super.initState();
    print(widget.localweather);
    updateU(widget.localweather);
  }
  void updateU(dynamic weatherdata) {
    double temp = weatherdata['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherdata[0]['id'];
    weatherIcon=data.getWeatherIcon(condition);
    cityname = weatherdata['sys']['name'];
    message=data.getMessage(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

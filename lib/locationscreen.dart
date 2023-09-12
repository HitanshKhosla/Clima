import 'package:flutter/material.dart';

class locationscreen extends StatefulWidget {
  var localweather;
  locationscreen({required this.localweather}) {}
  @override
  State<locationscreen> createState() => _State();
}

class _State extends State<locationscreen> {
  late int temperature;
  int? condition;
  String? cityname;
  @override
  void initState() {
    super.initState();
    updateU(widget.localweather);
  }
  void updateU(dynamic weatherdata) {
    double temp = weatherdata['main']['temp'];
    temperature = temp.toInt();
    condition = weatherdata[0]['description'];
    cityname = weatherdata['sys']['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

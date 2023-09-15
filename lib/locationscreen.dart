import 'package:flutter/material.dart';
import 'weathercondition.dart';
import 'city_location.dart';

class locationscreen extends StatefulWidget {
  var localweather;
  locationscreen({required this.localweather}) {}
  @override
  State<locationscreen> createState() => _State();
}

class _State extends State<locationscreen> {
  Weathermodel data = Weathermodel();
  late int temperature;
  String? weatherIcon;
  String? cityname;
  String? message;
  @override
  void initState() {
    super.initState();
    print(widget.localweather);
    updateUI(widget.localweather);
  }

  void updateUI(dynamic weatherdata) {
    if (weatherdata == null) {
      temperature = 0;
      cityname = 'no name';
      weatherIcon = 'Error';
    }
    setState(() {
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherdata['weather'][0]['id'];
      weatherIcon = data.getWeatherIcon(condition);
      cityname = weatherdata['sys']['name'];
      message = data.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('images/background.jpg')),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherdata = await data.weatherlocation();
                      updateUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.grey.shade800,
                      size: 80,
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        var typename = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityPage()));
                      if(typename!=null){
                        var new_weather=data.weathercitylocation(cityname);
                        updateUI(new_weather);
                      }
                        },
                      child: Icon(
                        Icons.location_city_sharp,
                        color: Colors.grey.shade800,
                        size: 80,
                      ))
                ],
              ),
            ),
          SizedBox(height: 30.0,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("$temperature",style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 130.0
              ),),
            Text("$weatherIcon",style: TextStyle(fontSize: 70.0,),)
            ],
          ),SizedBox(height: 200.0,),
          Expanded(child: Text("$message",style: TextStyle(fontSize: 70.0),))],
        ),
      ),
    );
  }
}

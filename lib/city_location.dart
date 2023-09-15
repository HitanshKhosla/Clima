import 'package:flutter/material.dart';
class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/foreground.jpeg'),
            fit: BoxFit.cover

          )
        ),
        child: Column(
          children: <Widget>[
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Icon(
              Icons.arrow_back_outlined,
            ))
          ],
        ),
      ),
    );
  }
}

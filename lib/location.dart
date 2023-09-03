import 'package:geolocator/geolocator.dart';
class Location{
  double? latitude;
  double? longitude;
  Future<void>getcurrentlocation()async{
    try{
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude=position.latitude;
      longitude=position.longitude;

    }catch(e){}
  }

}
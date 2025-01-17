
import 'package:geolocator/geolocator.dart';

class PermissionGps {

  Future<Position>init() async {
    bool isEnableGps = await Geolocator.isLocationServiceEnabled();
    if(isEnableGps){
      //gps activé
      LocationPermission permission = await Geolocator.checkPermission();
      return checkPermissionLocation(permission);

    }else
      {
        // gps non activé
        return Future.error("L'accès au gps n'est pas activé");
      }

  }

  Future<Position>checkPermissionLocation(LocationPermission perm){
    switch(perm){
      case LocationPermission.deniedForever: return Future.error("Vous ne souhaitez pas qu'on est accès à votre localisation");
      case LocationPermission.denied: return Geolocator.requestPermission().then((value)=>checkPermissionLocation(value));
      case LocationPermission.unableToDetermine: return Geolocator.requestPermission().then((value)=>checkPermissionLocation(value));
      case LocationPermission.whileInUse: return Geolocator.getCurrentPosition(desiredAccuracy:LocationAccury.best);
      case LocationPermission.always: return Geolocator.getCurrentPosition(desiredAccuracy:LocationAccury.best);
    }
  }


}
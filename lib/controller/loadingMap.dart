import 'package:first_app_2025_esilv/controller/permissiongps.dart';
import 'package:first_app_2025_esilv/view/mapView.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';



class LoadingMap extends StatefulWidget {
  const LoadingMap({super.key});

  @override
  State<LoadingMap> createState() => _LoadingMapState();
}

class _LoadingMapState extends State<LoadingMap> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: PermissionGps().init(),
      builder : (context,snap){








        if(snap.connectionState == ConnectionState.waiting){
          return Center(
            child : CircularProgressIndicator.adaptive()

          );
        } else {
          if(!snap.hasData){
            return Center(
              child: Text("Nous ne pouvons afficher la carte")

            );
          } else {
            Position myPosition = snap.data!;
            return Mapview(gps: myPosition);
          }
        }
      },
    );
  }
}

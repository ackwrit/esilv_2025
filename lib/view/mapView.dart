import 'package:flutter/material.dart';

class Mapview extends StatefulWidget {
  const Mapview({super.key});

  @override
  State<Mapview> createState() => _MapviewState();
}

class _MapviewState extends State<Mapview> {
  //variable
  CameraPosition cameraPosition = CameraPosition(target:LatLng(	48.871900,2.776623),zoom:14);
  Completer<GoogleMapController> controller = Completer();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled :true,
      myLocationButtonEnabled : true,
      onMapCreated : (control){
        controller.complete(control);
      }
    );
  }
}

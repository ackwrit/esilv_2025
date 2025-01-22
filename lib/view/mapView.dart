import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Mapview extends StatefulWidget {
  Position gps;
  Mapview({required this.gps,super.key});

  @override
  State<Mapview> createState() => _MapviewState();
}

class _MapviewState extends State<Mapview> {
  //variable
  late CameraPosition cameraPosition;
  late Completer<GoogleMapController> controller;
  
   @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(target:LatLng(widget.gps.latitude,widget.gps.longitude),zoom:14);
    controller = Completer();
  }

   @override
  void dispose() {
    
    super.dispose();
  }

  
  
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled :true,
      myLocationButtonEnabled : true,
      onMapCreated : (control) async {
        String newStyle = await DefaultAssetBundle.of(context).loadString("lib/styleMap.json");
        control.setMapStyle(newStyle);
        controller.complete(control);
      }
    );
  }
}

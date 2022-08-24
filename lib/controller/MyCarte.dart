import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyCarte extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCarteState();
  }

}

class MyCarteState extends State<MyCarte>{
  //Variables
  Completer<GoogleMapController> controller = Completer();
  LatLng tourEiffel = const LatLng(48.858278, 2.29425);
  LatLng montParnasse = const LatLng(48.842036, 2.322128);
  LatLng leLouvre = const LatLng(48.861013, 2.33585);
  CameraPosition cameraPosition = const CameraPosition(target: LatLng(48.858278, 2.29425),zoom:14);
  CameraPosition? positionActuelle;
  Position? maPosition;




  //Fonction interne



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GoogleMap(
        initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController control){
          controller.complete(control);
      },

    );
  }

}

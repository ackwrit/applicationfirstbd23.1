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
  Future<Position> verificationPermission() async {
    bool service;
    LocationPermission permission;
    service = await Geolocator.isLocationServiceEnabled();
    if(!service){
      return Future.error("La laocalisation n'a pas été demandé");
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("La permission a été refusé");
      }
    }

    if(permission == LocationPermission.deniedForever){
      Future.error("La permission sera toujours refusé");
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificationPermission().then((Position gps){
      setState(() {
        maPosition = gps;
        positionActuelle = CameraPosition(target: LatLng(maPosition!.latitude,maPosition!.longitude),zoom: 14);
      });
    });
  }






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: (positionActuelle==null)?cameraPosition:positionActuelle!,
          onMapCreated: (GoogleMapController control) async {
            String styleMap = await DefaultAssetBundle.of(context).loadString("lib/style/mapStyle.json");
            control.setMapStyle(styleMap);
            controller.complete(control);
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,

        ),

      ],
    );




  }

}

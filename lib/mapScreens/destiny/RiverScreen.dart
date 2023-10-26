import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class RiverScreen extends StatefulWidget {
   Map currentLocaion;
   RiverScreen(this.currentLocaion);
  @override
  State<RiverScreen> createState() => _RiverScreenState();
}

class _RiverScreenState extends State<RiverScreen> {


  @override
  Widget build(BuildContext context) {

    double currentLatitude = widget.currentLocaion['currentLatitude'];
    double currentLongitude = widget.currentLocaion['currentLongitude'];
   final Set<Marker> _markers = {
     Marker(markerId: MarkerId('1'),
         position: LatLng(currentLatitude,currentLongitude),
         icon: BitmapDescriptor.defaultMarker,
         infoWindow: InfoWindow(
            title: 'My Position',
         )
     ),

     Marker(markerId: MarkerId('2'),
         position: LatLng(31.814160449081644, 70.91993162642297), //Destiny River
         icon: BitmapDescriptor.defaultMarker,
         infoWindow: InfoWindow(
           title: 'DIKhan River',
         )
     ),
   };
    List<LatLng> latlng= [
      LatLng(currentLatitude,currentLongitude),
      LatLng(31.814160449081644, 70.91993162642297),//DIKhan River Destiny
    ];
    final Set<Polyline> _polyline = {
      Polyline(polylineId: PolylineId("1"),
          points: latlng,
          color: Colors.brown

      ),
    };
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
          target: LatLng(currentLatitude,currentLongitude),
            zoom: 15,
        ),
          myLocationEnabled: true,
          markers: _markers,
          polylines: _polyline,

        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NationalClub extends StatefulWidget {
  Map currentLocaion;
  NationalClub(this.currentLocaion);
  @override
  State<NationalClub> createState() => _NationalClubState();
}

class _NationalClubState extends State<NationalClub> {


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
          position: LatLng(31.810648106118773, 70.91540734459804), //Destiny National club
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'DIKhan National Club',
          )
      ),
    };
    List<LatLng> latlng= [
      LatLng(currentLatitude,currentLongitude),
      LatLng(31.810648106118773, 70.91540734459804),//DIKhan National club Destiny
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

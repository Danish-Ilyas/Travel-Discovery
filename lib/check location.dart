import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckLocation extends StatefulWidget {
  const CheckLocation({super.key});

  @override
  State<CheckLocation> createState() => _CheckLocationState();
}

class _CheckLocationState extends State<CheckLocation> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition:  CameraPosition(
      target: LatLng(37.422131, -122.084801),
      zoom: 14,
    ),


    );
  }
}

// lib/screens/bus_tracking_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusTrackingScreen extends StatefulWidget {
  final LatLng busLocation;
  BusTrackingScreen({required this.busLocation});
  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}
class _BusTrackingScreenState extends State<BusTrackingScreen> {
  late GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Tracker')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.busLocation,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId('bus'),
            position: widget.busLocation,
          ),
        },
        onMapCreated: (controller) => _controller = controller,
      ),
    );
  }
}
// lib/screens/bus_tracking_screen.dart end
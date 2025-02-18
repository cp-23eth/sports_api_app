import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({required this.stadium, super.key});

  final Stadium stadium;

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  bool _isMapCreated = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _isMapCreated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LatLng center =
        LatLng(widget.stadium.latitude, widget.stadium.longitude);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Google Maps',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF1C5D99),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color(0xFF0B132B),
        body: _isMapCreated
            ? GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 11.0,
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

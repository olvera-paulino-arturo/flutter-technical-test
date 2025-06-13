import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class MapMarker {
  final String id;
  final LatLng position;
  final String? title;

  MapMarker({required this.id, required this.position, this.title});
}
import 'dart:math';
import 'package:contpaqi_technical_test/features/map/domain/models/map_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng, LatLngBounds;

class MarkerDataSource {

  List<MapMarker> randomMarkers({required int count, required LatLng initialLatLng}) {
    final Random rand = Random();
    final List<MapMarker> markers = <MapMarker>[];
    for (int i = 0; i < count; i++) {
      final double lat = initialLatLng.latitude + rand.nextDouble() * 0.1;
      final double lng = initialLatLng.longitude + rand.nextDouble() * 0.1;
      markers.add(MapMarker(id: 'marker_$i', position: LatLng(lat, lng)));
    }

    return markers;
  }

  List<MapMarker> gridMarkers({required int count, required LatLng initialLatLng}) {
    final List<MapMarker> markers = <MapMarker>[];
    for (int i = 0; i < count; i++) {
      final double lat = initialLatLng.latitude + (i % 5) * 0.001;
      final double lng = initialLatLng.longitude + (i ~/ 5) * 0.001;
      markers.add(
        MapMarker(
          id: 'marker_$i',
          position: LatLng(lat, lng),
        ),
      );
    }
    return markers;
  }

  Future<List<MapMarker>> getMarkersInBounds(LatLngBounds bounds, List<MapMarker> markers) async {
    return markers.where((MapMarker mapMarker) {
      return bounds.contains(mapMarker.position);
    }).toList();
  }


}
import 'package:contpaqi_technical_test/features/map/domain/models/map_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show LatLng, LatLngBounds;

abstract class MarkerRepositoryContract {
  List<MapMarker> randomMarkers({
    required int count,
    required LatLng initialLatLng,
  });
  List<MapMarker> gridMarkers({
    required int count,
    required LatLng initialLatLng,
  });
  Future<List<MapMarker>> getMarkersInBounds(
    LatLngBounds bounds,
    List<MapMarker> markers,
  );
}

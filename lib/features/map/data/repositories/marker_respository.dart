import 'package:contpaqi_technical_test/features/map/data/data_sources/marker_data_source.dart';
import 'package:contpaqi_technical_test/features/map/domain/models/map_marker.dart';
import 'package:contpaqi_technical_test/features/map/domain/models/repositories/marker_repository_contract.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng, LatLngBounds;

class MarkerRepository implements MarkerRepositoryContract {
  final MarkerDataSource markerDataSource = MarkerDataSource();

  @override
  Future<List<MapMarker>> getMarkersInBounds(LatLngBounds bounds, List<MapMarker> markers) {
    return markerDataSource.getMarkersInBounds(bounds, markers);
  }

  @override
  List<MapMarker> gridMarkers({required int count, required LatLng initialLatLng}) {
    return markerDataSource.gridMarkers(count: count, initialLatLng: initialLatLng);
  }

  @override
  List<MapMarker> randomMarkers({required int count, required LatLng initialLatLng}) {
    return markerDataSource.randomMarkers(count: count, initialLatLng: initialLatLng);
  }

}
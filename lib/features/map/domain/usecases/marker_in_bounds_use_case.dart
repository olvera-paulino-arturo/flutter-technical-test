import 'package:contpaqi_technical_test/features/map/data/repositories/marker_respository.dart';
import 'package:contpaqi_technical_test/features/map/domain/models/map_marker.dart';
import 'package:contpaqi_technical_test/features/map/domain/models/repositories/marker_repository_contract.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLngBounds;

class MarkerInBoundUseCase {
  final MarkerRepositoryContract repository = MarkerRepository();

  Future<List<MapMarker>> execute(
      LatLngBounds bounds,
      List<MapMarker> markers,) {
    return repository.getMarkersInBounds(bounds, markers);
  }

}
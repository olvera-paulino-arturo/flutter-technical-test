import 'package:contpaqi_technical_test/features/map/data/repositories/marker_respository.dart';
import 'package:contpaqi_technical_test/features/map/domain/models/map_marker.dart';
import 'package:contpaqi_technical_test/features/map/domain/models/repositories/marker_repository_contract.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show LatLng;

class MarkerUseCase {
  final MarkerRepositoryContract repository = MarkerRepository();

  List<MapMarker> execute({required int count, required LatLng initialLatLng}) {
    return repository.randomMarkers(count: count, initialLatLng: initialLatLng);
  }
}

import 'package:bloc/bloc.dart';
import 'package:contpaqi_technical_test/core/helper/location_helper.dart';
import 'package:contpaqi_technical_test/features/map/domain/models/map_marker.dart';
import 'package:contpaqi_technical_test/features/map/domain/usecases/marker_in_bounds_use_case.dart';
import 'package:contpaqi_technical_test/features/map/domain/usecases/marker_use_case.dart';
import 'package:contpaqi_technical_test/features/map/helper/cluster_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final MarkerUseCase _markerUseCase = MarkerUseCase();
  final MarkerInBoundUseCase _markerInBoundUseCase = MarkerInBoundUseCase();

  Set<Marker> visibleMarkers = <Marker>{};
  GoogleMapController? mapController;
  LatLng? currentPosition;
  List<MapMarker> markers = [];

  MapBloc() : super(MapInitial()) {
    on<SetMapControllerEvent>((SetMapControllerEvent event, Emitter<MapState> emit) async {
      mapController = event.mapController;
      final LatLngBounds bounds = await mapController!.getVisibleRegion();
      final List<MapMarker> markersInBounds = await _markerInBoundUseCase.execute(
          bounds, markers);
      final List<Marker> clustered = ClusterHelper.buildClusters(
        markers: markersInBounds,
        clusterRadiusMeters: 120,
      );
      print('Seach Result: ${markersInBounds.length} - ${clustered.length}');
      visibleMarkers = clustered.toSet();
      emit(const MapControllerDone());
    });

    on<OnGetCurrentLocation> ((OnGetCurrentLocation event, Emitter<MapState> emit) async {
      final Position position = await LocationHelper.getCurrentLocation();
      final LatLng userLatLng = LatLng(position.latitude, position.longitude);

      markers = _markerUseCase.execute(count: 2000, initialLatLng: userLatLng);
      currentPosition = userLatLng;

      emit(MapCurrentLocationState(currentLocation: currentPosition!));
    });

    on<OnUpdateMarkersEvent> ((OnUpdateMarkersEvent event, Emitter<MapState> emit) async {
      final LatLngBounds bounds = await mapController!.getVisibleRegion();
      final List<MapMarker> markersInBounds = await _markerInBoundUseCase.execute(
          bounds, markers);
      final List<Marker> clustered = ClusterHelper.buildClusters(
        markers: markersInBounds,
        clusterRadiusMeters: 120,
      );
      print('Seach Result: ${markersInBounds.length} - ${clustered.length}');
      visibleMarkers = clustered.toSet();

      emit(MapUpdateMarkersState(visibleMarkers: visibleMarkers));

    });
  }
}



part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();
}

final class MapInitial extends MapState {
  @override
  List<Object?> get props => <Object?>[];
}

final class MapUpdateMarkersState extends MapState {
  final Set<Marker> visibleMarkers;

  const MapUpdateMarkersState({required this.visibleMarkers});

  @override
  List<Object?> get props => <Object?>[visibleMarkers];
}


final class MapCurrentLocationState extends MapState {
  final LatLng currentLocation;

  const MapCurrentLocationState({required this.currentLocation});

  @override
  List<Object?> get props => <Object?>[currentLocation];
}

final class MapControllerDone extends MapState {
  const MapControllerDone();

  @override
  List<Object?> get props => <Object?>[];
}



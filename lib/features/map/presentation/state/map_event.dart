part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();
}

class OnGetCurrentLocation extends MapEvent {
  const OnGetCurrentLocation();

  @override
  List<Object?> get props => <Object?>[];
}

class SetMapControllerEvent extends MapEvent {
  final GoogleMapController mapController;
  const SetMapControllerEvent(this.mapController);

  @override
  List<Object?> get props => <Object?>[mapController];
}

class OnUpdateMarkersEvent extends MapEvent {

  @override
  List<Object?> get props => <Object?>[];

}
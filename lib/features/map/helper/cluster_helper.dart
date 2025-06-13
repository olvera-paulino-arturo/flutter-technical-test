import 'package:contpaqi_technical_test/features/map/domain/models/map_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show BitmapDescriptor, InfoWindow, LatLng, Marker, MarkerId;

class ClusterHelper {
  static List<Marker> buildClusters({
    required List<MapMarker> markers,
    required double clusterRadiusMeters,
  }) {
    final Set<String> used = <String>{};
    final List<Marker> result = <Marker>[];

    for (int i = 0; i < markers.length; i++) {
      final MapMarker m1 = markers[i];
      if (used.contains(m1.id)) continue;

      final List<MapMarker> cluster = <MapMarker>[m1];
      used.add(m1.id);

      for (int j = i + 1; j < markers.length; j++) {
        final MapMarker m2 = markers[j];
        if (used.contains(m2.id)) continue;

        final double d = Geolocator.distanceBetween(
          m1.position.latitude, m1.position.longitude,
          m2.position.latitude, m2.position.longitude,
        );

        if (d <= clusterRadiusMeters) {
          cluster.add(m2);
          used.add(m2.id);
        }
      }

      if (cluster.length == 1) {
        result.add(Marker(
          markerId: MarkerId(m1.id),
          position: m1.position,
          infoWindow: InfoWindow(title: m1.title),
        ));
      } else {
        final double lat = cluster.map((MapMarker m) => m.position.latitude).reduce((double a, double b) => a + b) / cluster.length;
        final double lng = cluster.map((MapMarker m) => m.position.longitude).reduce((double a, double b) => a + b) / cluster.length;

        result.add(Marker(
          markerId: MarkerId('cluster_${m1.id}'),
          position: LatLng(lat, lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(title: '${cluster.length} points'),
        ));
      }
    }

    return result;
  }
}
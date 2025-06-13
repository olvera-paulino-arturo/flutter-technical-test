import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/features/map/presentation/state/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  static const double _initialZoom = 18.0;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations i18n = AppLocalizations.of(context)!;
    return BlocProvider<MapBloc>(
      create: (BuildContext context) => MapBloc(),
      child: Scaffold(
          appBar: AppBar(title: Text(i18n.buttonCinemaSearch),),
          body: BlocBuilder<MapBloc, MapState>(
            builder: (BuildContext context, MapState state) {
              if(state.runtimeType == MapInitial) {
                context.read<MapBloc>().add(const OnGetCurrentLocation());
              }
              return Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) => context.read<MapBloc>().currentPosition != null,
                  widgetBuilder: (BuildContext context) =>
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: context.read<MapBloc>().currentPosition!,
                          zoom: _initialZoom,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          context.read<MapBloc>().add(SetMapControllerEvent(controller));
                        },
                        onCameraIdle: () => context.read<MapBloc>().add(OnUpdateMarkersEvent()),
                        markers: context.read<MapBloc>().visibleMarkers,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      ),
                  fallbackBuilder: (BuildContext context) =>
                  const Column(
                    children: <Widget>[
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  )
              );
            },
          )
      ),
    );
  }
}

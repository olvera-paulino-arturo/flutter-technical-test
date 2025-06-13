import 'package:contpaqi_technical_test/features/app/presentation/constants/load_state_status.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/widgets/movies_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class MoviesStateIndicator extends StatelessWidget {
  final LoadStateStatus status;
  final VoidCallback? onRefresh;

  const MoviesStateIndicator({super.key, required this.status, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => status == LoadStateStatus.error,
      widgetBuilder: (BuildContext context) => Stack(
        children: <Widget>[
          const MoviesLoading(),
          InkWell(
            onTap: onRefresh,
            child: const Center(
              child: Text('Error'),
            ),
          )
        ],
      ),
      fallbackBuilder: (BuildContext context) => const MoviesLoading(),
    );
  }
}
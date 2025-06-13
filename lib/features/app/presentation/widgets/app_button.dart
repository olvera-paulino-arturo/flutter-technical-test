import 'package:contpaqi_technical_test/core/utils/types/action_types.dart';
import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class AppButton extends StatelessWidget {
  final String title;
  final OnVoidAction onPress;
  final IconData? iconData;
  const AppButton({super.key, required this.title, required this.onPress, this.iconData});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.lightPrimaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Conditional.single(
                context: context, 
                conditionBuilder: (BuildContext context) => iconData != null,
                widgetBuilder: (BuildContext context) => Icon(
                    iconData, color: Colors.white,
                )
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome, Moayad',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            TextButton(onPressed: () {}, child: Text('Connect Cluster')),
          ],
        ),
        Divider(
          color: AppColors.textLightGray.withAlpha(50),
        ),
        Row(
          children: [
            Text(
              'Available Clusters',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}

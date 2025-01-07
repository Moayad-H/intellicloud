import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.charcoalGray.withAlpha(200),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextButton(onPressed: () {}, child: Text('Documentation')),
        TextButton(onPressed: () {}, child: Text('API')),
        IconButton(
          icon: Icon(Icons.dark_mode),
          onPressed: () {
            // Notification action
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Notification action
          },
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            // Profile action
          },
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      //decoration: BoxDecoration(color: AppColors.brightWhite),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Documentation',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.lightGray),
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              'API',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.lightGray),
            )),
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

import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/colors.dart';

class DividerWithSizedbox extends StatelessWidget {
  const DividerWithSizedbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Divider(
          color: AppColors.textLightGray.withAlpha(50),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

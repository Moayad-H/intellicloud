import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';

class InfoVerticalDivider extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const InfoVerticalDivider({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          child: VerticalDivider(
            thickness: 2,
            width: 20,
            color: color,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              title,
              maxLines: 1,
              minFontSize: 10,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.lightGray),
            ),
            AutoSizeText(
              value,
              maxLines: 1,
              minFontSize: 10,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.lightGray, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}

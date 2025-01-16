import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';

class InfoVerticalDivider extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final TextStyle? style;
  final String? secondaryLabel;

  const InfoVerticalDivider({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    this.style,
    this.secondaryLabel,
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
                  ?.copyWith(color: AppColors.lightGray.withAlpha(180)),
            ),
            secondaryLabel != null
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: value,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: ' $secondaryLabel',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    letterSpacing: 2,
                                    color: AppColors.lightGray.withAlpha(160),
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  )
                : AutoSizeText(
                    value,
                    maxLines: 1,
                    minFontSize: 10,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.lightGray,
                        fontWeight: FontWeight.w700),
                  ),
          ],
        ),
      ],
    );
  }
}

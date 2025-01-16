import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/dashboard/components/widgets/info_vertical_divider.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String mainValue;
  final List<Map<String, String>> subValues;

  const InfoCard({
    super.key,
    required this.title,
    required this.mainValue,
    required this.subValues,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            child: Column(
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
                  mainValue,
                  maxLines: 1,
                  minFontSize: 10,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.mintGreen, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          ...subValues.map((subValue) {
            return Expanded(
                child: InfoVerticalDivider(
              title: subValue['title']!,
              value: subValue['value']!,
              color: subValue['color'] == 'primary'
                  ? primaryColor
                  : AppColors.warningAmber,
            ));
          }),
        ],
      ),
    );
  }
}

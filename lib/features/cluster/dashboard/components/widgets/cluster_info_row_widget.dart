import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/colors.dart';

class ClusterInfoRowWidget extends StatelessWidget {
  const ClusterInfoRowWidget(
      {super.key, required this.title, this.value, this.icon});
  final String title;
  final String? value;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          '$title:',
          maxLines: 1,
          minFontSize: 14,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.lightGray, fontWeight: FontWeight.w100),
        ),
        icon == null
            ? AutoSizeText(
                value.toString(),
                maxLines: 1,
                minFontSize: 14,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightGray, fontWeight: FontWeight.w900),
              )
            : SvgPicture.asset(
                AppAssets.eksIcon,
                width: 30,
                height: 30,
              ),
      ],
    );
  }
}

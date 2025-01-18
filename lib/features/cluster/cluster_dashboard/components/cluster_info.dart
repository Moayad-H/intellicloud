import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/widgets/cluster_info_row_widget.dart';

class ClusterInfoWidget extends StatelessWidget {
  const ClusterInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Cluster Details',
          maxLines: 1,
          minFontSize: 14,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.lightGray),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          width: 400,
          height: 250,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Cluster Status',
                    maxLines: 1,
                    minFontSize: 14,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.lightGray),
                  ),
                  AutoSizeText(
                    'Active',
                    maxLines: 1,
                    minFontSize: 14,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.mintGreen),
                  ),
                ],
              ),
              Divider(
                color: AppColors.textLightGray.withAlpha(30),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClusterInfoRowWidget(
                      title: 'Provider',
                      icon: AppAssets.eksIcon,
                    ),
                    ClusterInfoRowWidget(title: 'Region', value: 'Germany'),
                    ClusterInfoRowWidget(
                      title: 'Instance Type',
                      value: 't2.medium',
                    ),
                    ClusterInfoRowWidget(
                      title: 'Kubernetes Version',
                      value: '1.21',
                    ),
                    ClusterInfoRowWidget(
                      title: 'Cluster Id',
                      value: '11111111-1111-1111-1111-111111111111',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

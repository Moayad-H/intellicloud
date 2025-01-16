import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/dashboard/components/cluster_details_component.dart';
import 'package:intellicloud/features/cluster/dashboard/components/nodes_info.dart';
import 'package:intellicloud/features/cluster/dashboard/components/widgets/cluster_utilization_dougnut.dart';
import 'package:intellicloud/features/cluster/dashboard/components/widgets/info_vertical_divider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ClusterDashboard extends StatefulWidget {
  const ClusterDashboard({super.key});

  @override
  State<ClusterDashboard> createState() => ClusterDashboardState();
}

class ClusterDashboardState extends State<ClusterDashboard> {
  List<ChartData> cPUchartData = [
    ChartData('used', 45, AppColors.mintGreen),
    ChartData('requested', 20, primaryColor),
    ChartData('Remaining', 35, Colors.transparent)
  ];
  List<ChartData> memchartData = [
    ChartData('used', 25, AppColors.mintGreen),
    ChartData('requested', 10, primaryColor),
    ChartData('Remaining', 65, Colors.transparent)
  ];
  List<ChartData> storChartData = [
    ChartData('used', 0, AppColors.mintGreen),
    ChartData('requested', 0, primaryColor),
    ChartData('Remaining', 35, Colors.transparent)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AutoSizeText(
              'Dashboard',
              maxLines: 1,
              minFontSize: 14,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.mintGreen),
            ),
          ],
        ),
        Divider(
          color: AppColors.textLightGray.withAlpha(50),
        ),
        // Cluster Details
        ClusterDetailsComponent(),
        Divider(
          color: AppColors.textLightGray.withAlpha(50),
        ),
        //TODO USAGE
        Row(
          children: [
            ClusterUtilizationDougnut(
                chartData: cPUchartData,
                requested: '698.57',
                used: '223',
                utilizationFor: 'CPU\n',
                isCPU: true,
                provisioned: '65'),
            SizedBox(
              width: 20,
            ),
            ClusterUtilizationDougnut(
                chartData: memchartData,
                requested: '698.57',
                used: '223',
                utilizationFor: 'Memory\n',
                isCPU: false,
                provisioned: '5.8k'),
            SizedBox(
              width: 20,
            ),
            ClusterUtilizationDougnut(
                chartData: storChartData,
                requested: '--',
                used: '--',
                utilizationFor: 'Storage\n',
                isCPU: false,
                provisioned: '--'),
          ],
        ),
        //TODO Utilization
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double? y;
  final Color color;
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/cluster_details_component.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/utilization_column_chart.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/widgets/cluster_utilization_dougnut.dart';
import 'package:intellicloud/utils/divider_with_sizedbox.dart';

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
                  ?.copyWith(color: AppColors.softCyan),
            ),
          ],
        ),

        Divider(
          color: AppColors.textLightGray.withAlpha(50),
        ),
        SizedBox(
          height: 10,
        ),
        // Cluster Details
        ClusterDetailsComponent(),
        DividerWithSizedbox(),
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
        DividerWithSizedbox(),
        //TODO Utilization

        UtilizationColumnChart(
            avgRequested: '2343',
            avgProvisioned: '2345',
            avgUsed: '223',
            utilizationFor: 'CPU Utilization'),
        SizedBox(
          height: 20,
        ),
        UtilizationColumnChart(
            avgRequested: '1223',
            avgProvisioned: '2345',
            avgUsed: '223',
            utilizationFor: 'Memory Utilization'),
        SizedBox(
          height: 20,
        ),
        UtilizationColumnChart(
            avgRequested: '1223',
            avgProvisioned: '2345',
            avgUsed: '223',
            utilizationFor: 'Storage Utilization'),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color, {this.y2});
  final String x;
  final double? y;
  final double? y2;
  final Color color;
}

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
import 'package:intellicloud/utils/divider_with_sizedBox.dart';
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

        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'CPU Utilization',
                        maxLines: 1,
                        minFontSize: 14,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.lightGray),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoVerticalDivider(
                              title: 'AVG. Provisioned',
                              value: "1299.68",
                              secondaryLabel: 'CPU/h',
                              color: AppColors.softCyan,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                            InfoVerticalDivider(
                              title: 'AVG. Requested',
                              value: "2042.28",
                              secondaryLabel: 'CPU/h',
                              color: primaryColor,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                            InfoVerticalDivider(
                              title: 'AVG. Used',
                              value: "1532.29",
                              secondaryLabel: 'CPU/h',
                              color: AppColors.mintGreen,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: SfCartesianChart(
                                    onPlotAreaSwipe: (direction) =>
                                        {print(direction)},
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    primaryXAxis: CategoryAxis(
                                      rangePadding: ChartRangePadding.auto,
                                      axisLine: AxisLine(
                                          color: AppColors.lightGray
                                              .withAlpha(100)),
                                      isInversed: false,
                                      labelPlacement: LabelPlacement.onTicks,
                                    ),
                                    primaryYAxis: NumericAxis(
                                      axisLine: AxisLine(width: 0),
                                    ),
                                    series: <CartesianSeries>[
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          color: AppColors.mintGreen
                                              .withAlpha(220),
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          color: primaryColor.withAlpha(220),
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          borderColor:
                                              AppColors.lightGray.withAlpha(50),
                                          color: Colors.transparent,
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Memory Utilization',
                        maxLines: 1,
                        minFontSize: 14,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.lightGray),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoVerticalDivider(
                              title: 'AVG. Provisioned',
                              value: "1299.68",
                              secondaryLabel: 'CPU/h',
                              color: AppColors.softCyan,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                            InfoVerticalDivider(
                              title: 'AVG. Requested',
                              value: "2042.28",
                              secondaryLabel: 'CPU/h',
                              color: primaryColor,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                            InfoVerticalDivider(
                              title: 'AVG. Used',
                              value: "1532.29",
                              secondaryLabel: 'CPU/h',
                              color: AppColors.mintGreen,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: SfCartesianChart(
                                    onPlotAreaSwipe: (direction) =>
                                        {print(direction)},
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    primaryXAxis: CategoryAxis(
                                      rangePadding: ChartRangePadding.auto,
                                      axisLine: AxisLine(
                                          color: AppColors.lightGray
                                              .withAlpha(100)),
                                      isInversed: false,
                                      labelPlacement: LabelPlacement.onTicks,
                                    ),
                                    primaryYAxis: NumericAxis(
                                      axisLine: AxisLine(width: 0),
                                    ),
                                    series: <CartesianSeries>[
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          color: AppColors.mintGreen
                                              .withAlpha(220),
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          color: primaryColor.withAlpha(220),
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          borderColor:
                                              AppColors.lightGray.withAlpha(50),
                                          color: Colors.transparent,
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Storage Utilization',
                        maxLines: 1,
                        minFontSize: 14,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.lightGray),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoVerticalDivider(
                              title: 'AVG. Provisioned',
                              value: "1299.68",
                              secondaryLabel: 'CPU/h',
                              color: AppColors.softCyan,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                            InfoVerticalDivider(
                              title: 'AVG. Requested',
                              value: "2042.28",
                              secondaryLabel: 'CPU/h',
                              color: primaryColor,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                            InfoVerticalDivider(
                              title: 'AVG. Used',
                              value: "1532.29",
                              secondaryLabel: 'CPU/h',
                              color: AppColors.mintGreen,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: SfCartesianChart(
                                    onPlotAreaSwipe: (direction) =>
                                        {print(direction)},
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    primaryXAxis: CategoryAxis(
                                      rangePadding: ChartRangePadding.auto,
                                      axisLine: AxisLine(
                                          color: AppColors.lightGray
                                              .withAlpha(100)),
                                      isInversed: false,
                                      labelPlacement: LabelPlacement.onTicks,
                                    ),
                                    primaryYAxis: NumericAxis(
                                      axisLine: AxisLine(width: 0),
                                    ),
                                    series: <CartesianSeries>[
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          color: AppColors.mintGreen
                                              .withAlpha(220),
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          color: primaryColor.withAlpha(220),
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                      StackedColumnSeries<ChartData1, String>(
                                          onPointTap: (ChartPointDetails
                                              pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .dataPoints?[0]);
                                          },
                                          borderColor:
                                              AppColors.lightGray.withAlpha(50),
                                          color: Colors.transparent,
                                          dataSource: histogramData,
                                          xValueMapper: (ChartData1 data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData1 data, _) =>
                                              data.y),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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

class ChartData1 {
  ChartData1(this.x, this.y);
  final String x;
  final double y;
}

final List<ChartData1> histogramData = <ChartData1>[
  ChartData1('3:00 AM', 4),
  ChartData1('4:00 AM', 11),
  ChartData1('5:00 AM', 8),
  ChartData1('6:00 AM', 10),
  ChartData1('7:00 AM', 15),
  ChartData1('8:00 AM', 12),
  ChartData1('9:00 AM', 14),
  ChartData1('10:00 AM', 10),
  ChartData1('11:00 AM', 13),
  ChartData1('12:00 PM', 15),
  ChartData1('1:00 PM', 11),
  ChartData1('2:00 PM', 12),
  ChartData1('3:00 PM', 14),
  ChartData1('4:00 PM', 10),
  ChartData1('5:00 PM', 13),
  ChartData1('6:00 PM', 15),
  ChartData1('7:00 PM', 11),
  ChartData1('8:00 PM', 12),
  ChartData1('9:00 PM', 14),
  ChartData1('10:00 PM', 10),
  ChartData1('11:00 PM', 13),
  ChartData1('12:00 AM', 15),
  ChartData1('1:00 AM', 11),
  ChartData1('2:00 AM', 12),
];

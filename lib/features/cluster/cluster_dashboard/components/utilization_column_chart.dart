import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/widgets/info_vertical_divider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UtilizationColumnChart extends StatelessWidget {
  const UtilizationColumnChart({
    super.key,
    required this.avgRequested,
    required this.avgProvisioned,
    required this.avgUsed,
    required this.utilizationFor,
  });
  final String utilizationFor;
  final String avgRequested;
  final String avgProvisioned;
  final String avgUsed;
//TODO add the chart data
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '$utilizationFor Utilization',
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
                          value: avgProvisioned,
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
                          value: avgRequested,
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
                          value: avgUsed,
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
                            child: SfCartesianChart(
                              tooltipBehavior: TooltipBehavior(
                                  activationMode: ActivationMode.singleTap,
                                  enable: true),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              primaryXAxis: CategoryAxis(
                                interactiveTooltip:
                                    InteractiveTooltip(enable: true),
                                rangePadding: ChartRangePadding.auto,
                                axisLine: AxisLine(
                                    color: AppColors.lightGray.withAlpha(100)),
                                isInversed: false,
                                labelPlacement: LabelPlacement.onTicks,
                              ),
                              primaryYAxis: NumericAxis(
                                axisLine: AxisLine(width: 0),
                              ),
                              series: <CartesianSeries>[
                                StackedColumnSeries<ChartData1, String>(
                                    onPointTap: (ChartPointDetails
                                        pointInteractionDetails) {},
                                    color: AppColors.mintGreen.withAlpha(220),
                                    dataSource: histogramData,
                                    xValueMapper: (ChartData1 data, _) =>
                                        data.x,
                                    yValueMapper: (ChartData1 data, _) =>
                                        data.y),
                                StackedColumnSeries<ChartData1, String>(
                                    onPointTap: (ChartPointDetails
                                        pointInteractionDetails) {},
                                    color: primaryColor.withAlpha(220),
                                    dataSource: histogramData,
                                    xValueMapper: (ChartData1 data, _) =>
                                        data.x,
                                    yValueMapper: (ChartData1 data, _) =>
                                        data.y),
                                StackedColumnSeries<ChartData1, String>(
                                    onPointTap: (ChartPointDetails
                                        pointInteractionDetails) {},
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
    );
  }
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

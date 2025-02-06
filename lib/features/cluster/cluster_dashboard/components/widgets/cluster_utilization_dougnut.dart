import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/cluster_dashboard.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/widgets/info_vertical_divider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ClusterUtilizationDougnut extends StatelessWidget {
  const ClusterUtilizationDougnut({
    super.key,
    required this.chartData,
    required this.requested,
    required this.used,
    required this.utilizationFor,
    required this.isCPU,
    required this.provisioned,
  });
  final List<ChartData> chartData;
  final String requested;
  final String used;
  final bool isCPU;
  final String utilizationFor;
  final String provisioned;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            utilizationFor,
            maxLines: 1,
            minFontSize: 14,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(letterSpacing: 2, color: AppColors.lightGray),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(8)),
            // width: 450,
            height: 300,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 220,
                    width: 200,
                    child: SfCircularChart(
                      tooltipBehavior: TooltipBehavior(enable: true),
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                          widget: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(provisioned.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mintGreen)),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: isCPU ? 'CPU\n' : 'GiB\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Provisioned',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            letterSpacing: 2,
                                            color: AppColors.mintGreen,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // CircularChartAnnotation(
                        //   widget: Container(
                        //     child: const Text(
                        //       '62%',
                        //       style: TextStyle(
                        //           color: Color.fromRGBO(
                        //               0, 0, 0, 0.5),
                        //           fontSize: 25),
                        //     ),
                        //   ),
                        // )
                      ],
                      margin: EdgeInsets.all(0),
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          strokeColor: AppColors.softCyan.withAlpha(40),
                          radius: "100%",
                          innerRadius: '75%',
                          emptyPointSettings:
                              EmptyPointSettings(mode: EmptyPointMode.gap),
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          pointColorMapper: (ChartData data, _) => data.color,
                          startAngle: 220,
                          endAngle: 140,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoVerticalDivider(
                              title: 'Used',
                              value: used,
                              color: AppColors.mintGreen),
                          InfoVerticalDivider(
                              title: 'Requested',
                              value: requested,
                              color: primaryColor),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

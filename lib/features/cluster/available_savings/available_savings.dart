import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/cluster_dashboard.dart';
import 'package:intellicloud/features/cluster/dashboard/components/widgets/info_vertical_divider.dart';
import 'package:intellicloud/utils/divider_with_sizedbox.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AvailableSavings extends StatelessWidget {
  const AvailableSavings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AutoSizeText(
              'Available Savings',
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
        //TODO Savings
        Container(
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: AppColors.charcoalGray.withAlpha(150),
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.eksIcon,
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AutoSizeText(
                            'K8 Cluster',
                            maxLines: 1,
                            minFontSize: 10,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.lightGray),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mintGreen.withAlpha(200),
                          ),
                          color: AppColors.charcoalGray.withAlpha(150),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SvgPicture.asset(
                                //   AppAssets.eksIcon,
                                //   height: 30,
                                //   width: 30,
                                // ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: SfCircularChart(
                                        margin: EdgeInsets.all(0),
                                        series: <CircularSeries>[
                                          DoughnutSeries<ChartData, String>(
                                            strokeColor: AppColors.softCyan
                                                .withAlpha(40),
                                            radius: "100%",
                                            innerRadius: '65%',
                                            emptyPointSettings:
                                                EmptyPointSettings(
                                                    mode: EmptyPointMode.gap),
                                            dataSource: savingsChart,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.y,
                                            pointColorMapper:
                                                (ChartData data, _) =>
                                                    data.color,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'YOU CAN SAVE\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.copyWith(
                                                  letterSpacing: 2,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.softCyan,
                                                ),
                                          ),
                                          TextSpan(
                                            text: '64.4%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge
                                                ?.copyWith(
                                                  color: AppColors.lightGray,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                        ],
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ],
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'MONTHLY SAVINGS\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.w900,
                                              color: AppColors.softCyan,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '\$2,943.14 ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: AppColors.lightGray,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '/mo',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              color: AppColors.lightGray
                                                  .withAlpha(160),
                                            ),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'ANNUAL SAVINGS\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.softCyan,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '\$35,317.68 ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: AppColors.lightGray,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '/yr',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              color: AppColors.lightGray
                                                  .withAlpha(160),
                                            ),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SvgPicture.asset(
                              //   AppAssets.eksIcon,
                              //   height: 30,
                              //   width: 30,
                              // ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              AutoSizeText(
                                'Cluster Compute Cost',
                                maxLines: 1,
                                minFontSize: 14,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppColors.softCyan),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 150,
                                      child: SfCartesianChart(
                                        plotAreaBackgroundColor:
                                            Colors.transparent,
                                        plotAreaBorderColor: Colors.transparent,
                                        plotAreaBorderWidth: 1,
                                        primaryXAxis: CategoryAxis(
                                          isVisible: false,
                                        ),
                                        primaryYAxis: NumericAxis(
                                          maximum: 2800,
                                          isVisible: false,
                                        ),
                                        margin: EdgeInsets.only(right: 100),
                                        series: <CartesianSeries>[
                                          BarSeries<ComputeCostChartData,
                                              String>(
                                            dataLabelSettings:
                                                DataLabelSettings(
                                              labelAlignment:
                                                  ChartDataLabelAlignment.outer,
                                              isVisible: true,
                                              builder: (data, point, series,
                                                  pointIndex, seriesIndex) {
                                                return RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '\$${data.y.toStringAsFixed(2)}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineMedium
                                                            ?.copyWith(
                                                              color: AppColors
                                                                  .lightGray,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '/mo \n ${data.type == 0 ? 'K8' : 'IntelliCloud + K8'}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineSmall
                                                            ?.copyWith(
                                                              color: AppColors
                                                                  .lightGray
                                                                  .withAlpha(
                                                                      160),
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  overflow:
                                                      TextOverflow.visible,
                                                );
                                              },
                                            ),
                                            trackColor: AppColors.softCyan,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            emptyPointSettings:
                                                EmptyPointSettings(
                                                    mode: EmptyPointMode.gap),
                                            dataSource: computeCostChar,
                                            pointColorMapper:
                                                (ComputeCostChartData data,
                                                        _) =>
                                                    data.color,
                                            xValueMapper:
                                                (ComputeCostChartData data,
                                                        _) =>
                                                    data.x,
                                            yValueMapper:
                                                (ComputeCostChartData data,
                                                        _) =>
                                                    data.y,
                                            sortingOrder:
                                                SortingOrder.descending,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        DividerWithSizedbox(),
        Row(
          children: [
            AutoSizeText(
              'Configuration comparison',
              maxLines: 1,
              minFontSize: 14,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColors.softCyan),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: AppColors.charcoalGray.withAlpha(150),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SvgPicture.asset(
                                //   AppAssets.eksIcon,
                                //   height: 30,
                                //   width: 30,
                                // ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'AVG. AVAILABLE SAVINGS\n',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.softCyan,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: '69.84%',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge
                                                  ?.copyWith(
                                                    color: AppColors.lightGray,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                ),

                                InfoVerticalDivider(
                                    title: 'AVG Compute Cost',
                                    value: '\$60.72',
                                    color: AppColors.softCyan),
                                SizedBox(
                                  width: 50,
                                ),
                                InfoVerticalDivider(
                                    title: 'AVG Optimal Cost',
                                    value: '\$20.72',
                                    color: AppColors.softCyan),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SvgPicture.asset(
                              //   AppAssets.eksIcon,
                              //   height: 30,
                              //   width: 30,
                              // ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              AutoSizeText(
                                'Cluster Compute Cost',
                                maxLines: 1,
                                minFontSize: 14,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppColors.softCyan),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 350,
                                      child: SfCartesianChart(
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        margin: EdgeInsets.all(0),
                                        primaryXAxis: CategoryAxis(
                                          minimum: 0,
                                        ),
                                        primaryYAxis: NumericAxis(
                                          maximum: 150,
                                        ),
                                        series: <CartesianSeries>[
                                          StackedAreaSeries<ChartData, String>(
                                              borderColor: AppColors.softCyan,
                                              dataSource: computedCost,
                                              color: AppColors.mintGreen
                                                  .withAlpha(80),
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) =>
                                                      data.y2),
                                          StackedAreaSeries<ChartData, String>(
                                              dataSource: computedCost,
                                              borderColor:
                                                  primaryColor.withAlpha(140),
                                              color: primaryColor.withAlpha(80),
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) =>
                                                      data.y),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<ChartData> savingsChart = [
  ChartData('used', 64.4, Colors.green.shade400),
  ChartData('requested', 20, primaryColor),
  ChartData('Remaining', 15, AppColors.mintGreen.withAlpha(50))
];
List<ChartData> computedCost = [
  ChartData('12 AM', 45, y2: 25, primaryColor),
  ChartData('01 AM', 45, y2: 25, primaryColor),
  ChartData('02 AM', 45, y2: 25, primaryColor),
  ChartData('03 AM', 64.4, y2: 40, Colors.green.shade400),
  ChartData('04 AM', 62.4, y2: 35, Colors.green.shade400),
  ChartData('05 AM', 52.4, y2: 36, Colors.green.shade400),
  ChartData('06 AM', 49, y2: 25, primaryColor),
  ChartData('07 AM', 45, y2: 22, primaryColor),
  ChartData('08 AM', 50, y2: 25, primaryColor),
  ChartData('09 AM', 45, y2: 25, AppColors.mintGreen.withAlpha(50)),
  ChartData('10 AM', 43, y2: 20, AppColors.mintGreen.withAlpha(50)),
  ChartData('11 AM', 41, y2: 20, AppColors.mintGreen.withAlpha(50))
];

class ComputeCostChartData {
  final String x;
  final double y;
  final Color color;
  final int type;

  ComputeCostChartData(this.x, this.y, this.color, {this.type = 0});
}

List<ComputeCostChartData> computeCostChar = [
  ComputeCostChartData(type: 0, ' K8 Cluster', 2231.23, primaryColor),
  ComputeCostChartData(
      type: 1,
      'IntelliCloud + K8 Cluster',
      523.4,
      AppColors.mintGreen.withAlpha(180)),
];

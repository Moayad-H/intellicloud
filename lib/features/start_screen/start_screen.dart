import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/clusters/cluster_cubit.dart';
import 'package:intellicloud/controllers/clusters/cluster_states.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/features/start_screen/components/connect_cluster.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/utils/app_loader.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ClusterCubit>().loadClusters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<_ChartData> data = [
      _ChartData(15, 'IC', color: AppColors.mintGreen),
      _ChartData(80, 'EKS', color: primaryColor.withAlpha(150)),
    ];
    List<_ChartData> data2 = [
      _ChartData(0, 'IC'),
      _ChartData(70, 'EKS'),
      _ChartData(30, 'ICs'),
      _ChartData(70, 'EKSs'),
      _ChartData(60, 'EKSs2'),
      _ChartData(40, 'EKSsss'),
      _ChartData(30, 'ICadf'),
      _ChartData(70, 'EKSfd'),
      _ChartData(30, 'ICfdss'),
      _ChartData(70, 'EKSs53'),
      _ChartData(60, 'EKSs212'),
      _ChartData(0, 'EKSss23'),
    ];
    return BlocBuilder<ClusterCubit, ClusterState>(
      builder: (context, state) {
        if (state is ClusterLoading) {
          return Center(
            child: AppLoader(),
          );
        } else if (state is ClusterLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, Moayad',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColors.mintGreen,
                          letterSpacing: 1.2,
                        ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.softCyan.withAlpha(80),
                          spreadRadius: 2,
                          blurRadius: 1,
                        )
                      ],
                      color: AppColors.mintGreen.withAlpha(100),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        connectClusterDialog(context);
                      },
                      child: Text(
                        'Connect Cluster',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.textLightGray.withAlpha(50),
              ),
              Row(
                children: [
                  Text(
                    'Available Clusters',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: AppColors.charcoalGray.withAlpha(120),
                        //     spreadRadius: 2,
                        //     blurRadius: 1,
                        //   )
                        // ],
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      height: 100,
                      //TODO REsposive
                      width: 950,
                      child: DataTable2(
                        clipBehavior: Clip.antiAlias,
                        headingRowHeight: 40,
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        minWidth: 600,
                        columns: [
                          DataColumn2(
                            onSort: (columnIndex, ascending) {},
                            label: Text(
                              'ID',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          DataColumn(
                            label: Text('NAME',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          DataColumn(
                            label: Text('PR.',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          DataColumn(
                            label: Text('NODES',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          DataColumn(
                            label: Text('CPU',
                                style: Theme.of(context).textTheme.bodyMedium),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text('MEM.',
                                style: Theme.of(context).textTheme.bodyMedium),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text('CPU COST',
                                style: Theme.of(context).textTheme.bodyMedium),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text('STATUS',
                                style: Theme.of(context).textTheme.bodyMedium),
                            numeric: true,
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(cells: [
                            DataCell(Text(state.cluster.id.toString())),
                            DataCell(InkWell(
                              onTap: () => DashboardCubit.get(context)
                                  .updateActiveTab(
                                      1, AppRoutes.clusterDashboard, context),
                              child: Text(state.cluster.name.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: AppColors.mintGreen,
                                          decoration:
                                              TextDecoration.underline)),
                            )),
                            DataCell(Text(state.cluster.provider.toString(),
                                style: Theme.of(context).textTheme.bodyMedium)),
                            DataCell(Text(state.cluster.totalNodes.toString(),
                                style: Theme.of(context).textTheme.bodyMedium)),
                            DataCell(Text(state.cluster.totalVcpu.toString())),
                            DataCell(
                                Text(state.cluster.totalMemory.toString())),
                            DataCell(Text('\$0.05 /h')),
                            DataCell(Text(state.cluster.status.toString())),
                          ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Spacer(),
                  Expanded(
                    child: Container(
                      height: 250,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: AppColors.softCyan.withAlpha(120),
                        //     spreadRadius: 2,
                        //     blurRadius: 1,
                        //   )
                        // ],
                        color: AppColors.charcoalGray.withAlpha(100),
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.charcoalGray.withAlpha(100),
                              border: Border.all(color: secondaryColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.monetization_on),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Monitor Cluster Costs',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton.icon(
                                      iconAlignment: IconAlignment.end,
                                      onPressed: () {},
                                      label: Text('Explore Costs',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  color: AppColors.mintGreen)),
                                      icon: Icon(
                                        Icons.arrow_right_alt_sharp,
                                        color: AppColors.mintGreen,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text('Compute Spend:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      Text('\$8552.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                  color: AppColors.warningAmber,
                                                  letterSpacing: 2,
                                                  fontWeight: FontWeight.w800)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SfCartesianChart(
                                      enableAxisAnimation: false,
                                      primaryXAxis: CategoryAxis(
                                        isVisible: false,
                                        rangePadding: ChartRangePadding.none,
                                      ),
                                      primaryYAxis: NumericAxis(
                                          isVisible: false,
                                          minimum: 0,
                                          maximum: 80,
                                          interval: 20),
                                      series: <CartesianSeries<dynamic,
                                          String>>[
                                        SplineAreaSeries<_ChartData, String>(
                                            dataSource: data2,
                                            xValueMapper:
                                                (_ChartData data, _) => data.x,
                                            yValueMapper:
                                                (_ChartData data, index) =>
                                                    data.y,
                                            name: 'Savings',
                                            color: AppColors.mintGreen
                                                .withAlpha(200)),
                                        SplineAreaSeries<_ChartData, String>(
                                            dataSource: data2,
                                            xValueMapper:
                                                (_ChartData data, _) => data.x,
                                            yValueMapper:
                                                (_ChartData data, index) =>
                                                    data.y + -20,
                                            name: 'Savings',
                                            color: AppColors.softCyan)
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 250,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: AppColors.softCyan.withAlpha(120),
                        //     spreadRadius: 2,
                        //     blurRadius: 1,
                        //   )
                        // ],
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: secondaryColor),
                              color: AppColors.charcoalGray.withAlpha(100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.monetization_on),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Optimize Automatically:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton.icon(
                                      iconAlignment: IconAlignment.end,
                                      onPressed: () {
                                        DashboardCubit.get(context)
                                            .updateActiveTab(
                                                3,
                                                AppRoutes.availableSavings,
                                                context);
                                      },
                                      label: Text('Explore Savings',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  color: AppColors.mintGreen)),
                                      icon: Icon(
                                        Icons.arrow_right_alt_sharp,
                                        color: AppColors.mintGreen,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: AppColors.charcoalGray.withAlpha(100),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text('You can save:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                        Text('64.4%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color:
                                                        AppColors.mintGreen)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(
                                        isVisible: false,
                                      ),
                                      primaryYAxis: NumericAxis(
                                          isVisible: false,
                                          minimum: 0,
                                          maximum: 80,
                                          interval: 20),
                                      series: <CartesianSeries<dynamic,
                                          String>>[
                                        BarSeries<_ChartData, String>(
                                            pointColorMapper:
                                                (_ChartData data, _) =>
                                                    data.color,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            dataSource: data,
                                            xValueMapper:
                                                (_ChartData data, _) => data.x,
                                            yValueMapper:
                                                (_ChartData data, index) =>
                                                    data.y,
                                            name: 'Savings',
                                            color: AppColors.mintGreen
                                                .withAlpha(180)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: AppColors.softCyan.withAlpha(120),
                        //     spreadRadius: 2,
                        //     blurRadius: 1,
                        //   )
                        // ],
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Start to optimize your clusters in one simple step\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.lightGray,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              'Install a lightweight, read-only agent to enable cost monitoring, and get optimization suggestions',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ],
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.softCyan
                                                .withAlpha(80),
                                            spreadRadius: 2,
                                            blurRadius: 1,
                                          )
                                        ],
                                        color:
                                            AppColors.mintGreen.withAlpha(100),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                      ),
                                      child: TextButton(
                                          onPressed: () async {
                                            connectClusterDialog(context);
                                          },
                                          child: Text(
                                            'Connect Cluster',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w900),
                                          ))),
                                ],
                              ),
                            ),
                          ),
                          Expanded(child: Lottie.asset(AppAssets.optimizeHome))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        } else if (state is ClusterError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

void connectClusterDialog(BuildContext context) async {
  showDialog(
      // barrierDismissible: true,
      context: context,
      builder: (context) => ClusterConnectionScreen());
}

class _ChartData {
  _ChartData(this.y, this.x, {this.color});

  final String x;
  final Color? color;
  final double y;
}

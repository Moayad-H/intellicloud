import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/clusters/cluster_cubit.dart';
import 'package:intellicloud/controllers/clusters/cluster_states.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/cluster_details_component.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/utilization_column_chart.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/widgets/cluster_utilization_dougnut.dart';
import 'package:intellicloud/features/redacted/redacted_screen.dart';
import 'package:intellicloud/utils/app_loader.dart';
import 'package:intellicloud/utils/divider_with_sizedbox.dart';

class ClusterDashboard extends StatefulWidget {
  const ClusterDashboard({super.key});

  @override
  State<ClusterDashboard> createState() => ClusterDashboardState();
}

class ClusterDashboardState extends State<ClusterDashboard> {
  @override
  void initState() {
    context.read<ClusterCubit>().loadClusters();
    super.initState();
  }

  List<ChartData> cPUchartData = [
    ChartData('used', 20, AppColors.mintGreen),
    ChartData('requested', 8, primaryColor),
    ChartData('Remaining', 8, Colors.transparent)
  ];
  List<ChartData> memchartData = [
    ChartData('used', 168.2, AppColors.mintGreen),
    ChartData('requested', 41, primaryColor),
    ChartData('Remaining', 41, Colors.transparent)
  ];
  List<ChartData> storChartData = [
    ChartData('used', 0, AppColors.mintGreen),
    ChartData('requested', 0, primaryColor),
    ChartData('Remaining', 35, Colors.transparent)
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClusterCubit, ClusterState>(
      builder: (context, state) {
        if (state is ClusterLoading) {
          return Center(
            child: RedactedScreen(),
          );
        } else if (state is ClusterLoaded) {
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
              ClusterDetailsComponent(
                cluster: state.cluster,
              ),
              DividerWithSizedbox(),
              //TODO USAGE
              Row(
                children: [
                  ClusterUtilizationDougnut(
                      chartData: cPUchartData,
                      requested: '28',
                      used: '20',
                      utilizationFor: 'CPU\n',
                      isCPU: true,
                      provisioned: state.cluster.totalVcpu.toString()),
                  SizedBox(
                    width: 20,
                  ),
                  ClusterUtilizationDougnut(
                      chartData: memchartData,
                      requested: '180.1',
                      used: '168.2',
                      utilizationFor: 'Memory\n',
                      isCPU: false,
                      provisioned: state.cluster.totalMemory.toString()),
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
                  usage: 'cpu',
                  avgRequested: '27.2',
                  avgProvisioned: '35.2',
                  avgUsed: '18.7',
                  utilizationFor: 'CPU'),
              SizedBox(
                height: 20,
              ),
              UtilizationColumnChart(
                  usage: 'memory',
                  avgRequested: '181.1',
                  avgProvisioned: '209.3',
                  avgUsed: '166.4',
                  utilizationFor: 'Memory'),
              SizedBox(
                height: 20,
              ),
              UtilizationColumnChart(
                  usage: '',
                  avgRequested: '---',
                  avgProvisioned: '---',
                  avgUsed: '---',
                  utilizationFor: 'Storage'),
              SizedBox(
                height: 10,
              ),
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

class ChartData {
  ChartData(this.x, this.y, this.color, {this.y2});
  final String x;
  final double? y;
  final double? y2;
  final Color color;
}

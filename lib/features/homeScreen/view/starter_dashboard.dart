import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/data/models/cluster_data_model.dart';
import 'package:intellicloud/features/homeScreen/widgets/appbar.dart';
import 'package:intellicloud/features/homeScreen/widgets/sidebar2.dart';
import 'package:intellicloud/network/api_service.dart';

class MainContent extends StatefulWidget {
  MainContent({super.key, required this.child});
  Widget child;

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final ApiService _apiService = ApiService();
  late Future<Cluster> _clusterFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _clusterFuture = _apiService.getClusterById(1);
    context.read<DashboardCubit>().loadMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sidebar2(),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: CustomAppbar()),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Top Row for Key Metrics
        ],
      ),
    );
  }

  //
}

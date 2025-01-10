import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/features/costSavings/charts/energy_consumption.dart';
import 'package:intellicloud/features/homeScreen/widgets/appbar.dart';
import 'package:intellicloud/features/homeScreen/widgets/sidebar2.dart';
import 'package:intellicloud/features/start_screen/start_screen.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/features/homeScreen/widgets/sidebar.dart';

class MainContent extends StatefulWidget {
  MainContent({super.key, required this.child});
  Widget child;

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
